import 'package:agriboost/Pages/cropDetailPage.dart';
import 'package:agriboost/models/crops.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class CropPredictionScreen extends StatefulWidget {
  @override
  _CropPredictionScreenState createState() => _CropPredictionScreenState();
}

class _CropPredictionScreenState extends State<CropPredictionScreen> {
  late Interpreter interpreter;
  List<String> labels = [];
  final List<TextEditingController> controllers =
      List.generate(7, (_) => TextEditingController());

  String prediction = '';
  bool isInterpreterReady = false;

  @override
  void initState() {
    super.initState();
    loadModelAndLabels();
  }

  @override
  void dispose() {
    // Dispose controllers and interpreter
    for (var controller in controllers) {
      controller.dispose();
    }
    interpreter.close();
    super.dispose();
  }

  Future<void> loadModelAndLabels() async {
    try {
      // Load the TFLite model
      interpreter =
          await Interpreter.fromAsset('assets/models/crop_yield.tflite');

      // Load the labels
      final labelData = await rootBundle.loadString('assets/models/labels.txt');
      labels = labelData.split('\n').where((l) => l.trim().isNotEmpty).toList();

      setState(() {
        isInterpreterReady = true;
      });
    } catch (e) {
      setState(() {
        prediction = 'Error loading model or labels: $e';
      });
    }
  }

  void predict() {
    if (!isInterpreterReady) {
      setState(() {
        prediction = 'Model is still loading...';
      });
      return;
    }

    // Parse input values
    List<double> input =
        controllers.map((c) => double.tryParse(c.text) ?? 0.0).toList();

    if (input.length != 7 || input.contains(0.0)) {
      setState(() => prediction = 'Please enter all inputs correctly.');
      return;
    }

    // Prepare input and output tensors
    var inputTensor = [input];
    var output = List.filled(labels.length, 0.0).reshape([1, labels.length]);

    try {
      // Run the model
      interpreter.run(inputTensor, output);

      // Get the index of the highest probability
      int maxIndex = output[0].indexWhere(
          (e) => e == output[0].reduce((double a, double b) => a > b ? a : b));

      setState(() {
        prediction = (maxIndex < labels.length) ? labels[maxIndex] : 'Unknown';
      });
    } catch (e) {
      setState(() {
        prediction = 'Error during prediction: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final fields = [
      'Nitrogen',
      'Phosphorus',
      'Potassium',
      'Temperature',
      'Humidity',
      'pH',
      'Rainfall'
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Crop Predictor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ...List.generate(fields.length, (i) {
              return TextField(
                controller: controllers[i],
                decoration: InputDecoration(labelText: fields[i]),
                keyboardType: TextInputType.number,
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isInterpreterReady ? predict : null,
              child: Text(
                  isInterpreterReady ? 'Predict Crop' : 'Loading model...'),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Find the crop object based on the prediction
                final Crop? predictedCrop = crops.firstWhere(
                  (crop) => crop.name == prediction,
                  orElse: () => Crop(
                    id: '',
                    name: '',
                    imageUrl: '',
                    description: '',
                  ),
                );

                if (predictedCrop != null) {
                  // Navigate to the Cropdetailpage with the predicted crop
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Cropdetailpage(crop: predictedCrop),
                    ),
                  );
                } else {
                  // Handle case where the crop is not found
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('Crop details not found for $prediction')),
                  );
                }
              },
              child: Text(
                'Prediction: $prediction',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

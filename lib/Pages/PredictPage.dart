// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';

// class CropPredictionScreen extends StatefulWidget {
//   @override
//   State<CropPredictionScreen> createState() => _CropPredictionScreenState();
// }

// class _CropPredictionScreenState extends State<CropPredictionScreen> {
//   late Interpreter interpreter;
//   List<String> labels = [];
//   bool modelLoaded = false;
//   double rainfall = 1000.0;
//   String predictionResult = '';

//   @override
//   void initState() {
//     super.initState();
//     loadModelAndLabels();
//   }

//   Future<void> loadModelAndLabels() async {
//     interpreter = await Interpreter.fromAsset('models/crop_model.tflite');
//     final labelData = await rootBundle.loadString('assets/labels.txt');
//     labels = labelData
//         .split('\n')
//         .map((l) => l.trim())
//         .where((l) => l.isNotEmpty)
//         .toList();
//     setState(() {
//       modelLoaded = true;
//     });
//   }

//   void predictCrop() {
//     if (!modelLoaded) return;

//     // Example: only using rainfall, fill rest of 97 inputs with 0s
//     List<double> input = List.filled(97, 0.0);
//     input[0] = rainfall; // You can change index depending on your model

//     var inputTensor = [input];
//     var output = List.filled(1 * 1, 0.0).reshape([1, 1]);

//     interpreter.run(inputTensor, output);

//     int index = output[0][0].round();
//     if (index < labels.length) {
//       setState(() {
//         predictionResult = 'Recommended Crop: ${labels[index]}';
//       });
//     } else {
//       setState(() {
//         predictionResult = 'Invalid prediction index: $index';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Crop Predictor')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(labelText: 'Rainfall (mm)'),
//               keyboardType: TextInputType.number,
//               onChanged: (val) => rainfall = double.tryParse(val) ?? 1000.0,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: predictCrop,
//               child: Text('Predict Crop'),
//             ),
//             SizedBox(height: 20),
//             Text(predictionResult, style: TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }
// }

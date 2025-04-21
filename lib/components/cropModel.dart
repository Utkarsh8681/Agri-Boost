// import 'package:tflite_flutter/tflite_flutter.dart';

// late Interpreter interpreter;

// Future<void> loadModel() async {
//   interpreter = await Interpreter.fromAsset('models/crop_model.tflite');
//   print('Model loaded!');
// }

// void runInference(List<double> input) {
//   var inputTensor = [input]; // Batch size of 1
//   var output =
//       List.filled(1 * 1, 0).reshape([1, 1]); // adjust based on output shape

//   interpreter.run(inputTensor, output);
//   print('Prediction: ${output[0][0]}');
// }

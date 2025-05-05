// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewScreen extends StatefulWidget {
//   final String url;

//   const WebViewScreen({super.key, required this.url});

//   @override
//   State<WebViewScreen> createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   late final WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..loadRequest(Uri.parse(widget.url))
//       ..setJavaScriptMode(JavaScriptMode.unrestricted);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Web View"),
//         backgroundColor: Colors.green,
//         foregroundColor: Colors.white,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: () => _controller.reload(),
//           ),
//         ],
//       ),
//       body: WebViewWidget(controller: _controller),
//     );
//   }
// }

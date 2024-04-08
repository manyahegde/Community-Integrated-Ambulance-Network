import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void registerWebViewWebImplementation() {
  WebView.platform = SurfaceAndroidWebView();
  // Or use the appropriate concrete subtype based on the platform:
  // - SurfaceAndroidWebView for Android
  // - CupertinoWebView for iOS
  // - InAppWebView for macOS
}

void main() {
  registerWebViewWebImplementation(); // Register the web implementation
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ambulance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ambulance'),
        ),
        body: WebView(
          initialUrl: 'https://example.com',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

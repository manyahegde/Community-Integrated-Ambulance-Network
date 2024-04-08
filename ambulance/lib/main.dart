import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  registerWebViewWebImplementation();
  runApp(MyApp());
}

void registerWebViewWebImplementation() {
  // Set the platform-specific implementation of WebView
  WebView.platform = SurfaceAndroidWebView(); // Import SurfaceAndroidWebView if necessary
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ambulance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapRoute(), // Use MapRoute as the home page
    );
  }
}

class MapRoute extends StatelessWidget {
  const MapRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Optimal Route'),
      ),
      body: FutureBuilder<String>(
        future: loadHTMLAsset(), // Load the HTML file from assets
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return WebView(
              initialUrl: Uri.dataFromString(
                snapshot.data!,
                mimeType: 'text/html',
              ).toString(),
              javascriptMode: JavascriptMode.unrestricted,
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading HTML'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<String> loadHTMLAsset() async {
    return await rootBundle.loadString('assets/html/optimal_path.html');
  }
}

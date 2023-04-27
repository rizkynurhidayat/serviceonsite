import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // final link = Uri.parse('http://freelancerbenelux.com/');
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    late WebViewController mywebcontroller;

    return WillPopScope(
      onWillPop: () async {
        if (await mywebcontroller.canGoBack()) {
          mywebcontroller.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          body: SafeArea(
        child: WebView(
          onWebViewCreated: (controller) {
            mywebcontroller = controller;
          },
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: "https://sosserviceonsite.com/",
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndConditons extends StatefulWidget {
  const TermsAndConditons({Key? key}) : super(key: key);

  @override
  State<TermsAndConditons> createState() => _TermsAndConditonsState();
}

class _TermsAndConditonsState extends State<TermsAndConditons> {
  late WebViewController controller;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: WebView(
        initialUrl: 'https://www.pabjobs.com/termsandconditions',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
      ),
    ));
  }
}

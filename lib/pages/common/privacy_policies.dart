import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicies extends StatefulWidget {
  const PrivacyPolicies({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicies> createState() => _PrivacyPoliciesState();
}

class _PrivacyPoliciesState extends State<PrivacyPolicies> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebView(
        initialUrl: 'https://www.pabjobs.com/Privacypolicy',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

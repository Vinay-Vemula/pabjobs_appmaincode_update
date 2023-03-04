import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pabjobs/common/constant.dart';

import 'package:pabjobs/pages/common/login/login.dart';
import 'package:pabjobs/pages/job_seeker/common/reusable_scaffold.dart';
import 'package:pabjobs/pages/recruiter/common/reusable_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static Box<String> userInfo = Hive.box<String>(Constant.dbName);

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), onLoadSplashScreen);
  }

  void onLoadSplashScreen() async {
    String? token = userInfo.get('token');
    String? type = userInfo.get('type');

    if (token == null ||
        token.isEmpty ||
        token.isBlank! ||
        type == null ||
        type.isEmpty ||
        type.isBlank!) {
      Get.off(() => const Login());
    } else {
      if (type == "applicant") {
        Get.off(() => const ReusableScaffold());
      }
      if (type == "recruiter") {
        Get.off(() => const RecruiterReusableScaffold());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Colors.white,
          child: Center(
              child: Image.asset('assets/logos/pab_jobs_logo.png',
                  width: 175, height: 83)),
        ),
      ),
    );
  }
}

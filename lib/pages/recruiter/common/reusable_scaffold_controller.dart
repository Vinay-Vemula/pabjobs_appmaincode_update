import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:pabjobs/common/constant.dart';
import 'package:pabjobs/pages/recruiter/my_jobs/my_jobs_page.dart';
import 'package:pabjobs/pages/recruiter/profile/recruiter_profile.dart';

import '../homepage/home_page_recruiter_paginated.dart';

class ReusableScaffoldRecruiterController extends GetxController {
  var currentIndex = 0.obs;

  static Box<String> userInfo = Hive.box<String>(Constant.dbName);

  ReusableScaffoldRecruiterController() {
    currentIndex.value = 0;
  }

  // ignore: non_constant_identifier_names
  final List<Widget> ReusableScaffoldRecruiterList = [
    RecruiterHomePagePaginated(),
    MyJobsPage(),
    Profile(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // function to return correct view on bottom navBar switch
  Widget navBarSwitcher() {
    // print(currentIndex.value);
    return ReusableScaffoldRecruiterList.elementAt(currentIndex.value);
  }
}

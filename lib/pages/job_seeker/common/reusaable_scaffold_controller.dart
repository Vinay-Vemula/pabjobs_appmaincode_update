import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:pabjobs/common/constant.dart';
import 'package:pabjobs/pages/job_seeker/applied_jobs/applied_jobs.dart';
import 'package:pabjobs/pages/job_seeker/filter/search_page.dart';
import 'package:pabjobs/pages/job_seeker/homepage/homepage.dart';
import 'package:pabjobs/pages/job_seeker/profile/profile.dart';

import '../homepage/home_page_job_seeker_paginated.dart';

class ReusableScaffoldController extends GetxController {
  var currentIndex = 0.obs;

  static Box<String> userInfo = Hive.box<String>(Constant.dbName);

  ReusableScaffoldController() {
    currentIndex.value = 0;
  }

  final List<Widget> ReusableScaffoldList = const [
    HomePageJobSeekerPaginated(),
    SearchPage(),
    AppliedJobs(backButton: 'no'),
    ProfileDetails(),
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
    return ReusableScaffoldList.elementAt(currentIndex.value);
  }
}

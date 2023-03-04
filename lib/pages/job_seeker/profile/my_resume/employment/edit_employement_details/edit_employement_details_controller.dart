import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/entities/user_details_model.dart';

class EditEmployementController extends GetxController {
  var isLoading = true.obs;
  var data1_ = [].obs;
  var data2_ = [].obs;

  var userDetails = <UserDetails>[].obs;
  Rx<UserDetails> data = UserDetails(
    certification: [],
    contactNumber: 0,
    currentlocation: [],
    education: [],
    email: '',
    employment: [],
    experience: '',
    id: '',
    isEmailVerified: false,
    isPhoneVerified: false,
    jobApplicantDate: DateTime.now(),
    name: '',
    patent: [],
    presentation: [],
    profile: '',
    profileSummary: '',
    project: [],
    publication: [],
    rating: 0,
    resumeHeadline: '',
    skills: [],
    totalExperience: '',
    state: '',
    userId: '',
    v: 0,
    worksample: [],
    profileImage: '',
    careerprofile: [],
  ).obs;

  Future<void> fetchUserDetails() async {
    // isLoading(true);
    var z = await APIService.fetchUserDetails();
    data(z);
    // isLoading(false);
  }

  Future<void> readIndustryJson() async {
    final String response =
        await rootBundle.loadString('assets/json/Category.json');
    final _data1 = await json.decode(response);
    data1_(_data1);
  }

  Future<void> readDesignationJson() async {
    final String response =
        await rootBundle.loadString('assets/json/Designation.json');
    final _data2 = await json.decode(response);
    data2_(_data2);
  }

  void fetchData() async {
    isLoading(true);
    await fetchUserDetails();
    await readIndustryJson();
    await readDesignationJson();
    isLoading(false);
  }
}

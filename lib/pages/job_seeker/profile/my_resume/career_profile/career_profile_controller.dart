import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/entities/user_details_model.dart';

class CareerProfileController extends GetxController {
  var isLoading = true.obs;
  var data_ = [].obs;
  var data1_ = [].obs;
  var data2_ = [].obs;
  var data3_ = [].obs;

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
    var z = await APIService.fetchUserDetails();
    data(z);
  }

  Future<void> readLocationJson() async {
    final String response =
        await rootBundle.loadString('assets/json/locations.json');
    final _data = await json.decode(response);
    data_(_data);
    // data_ = _data;
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
    await readLocationJson();
    await fetchUserDetails();
    await readIndustryJson();
    await readDesignationJson();
    isLoading(false);
  }

  void defaultJobTypeSelection(value) async {
    isLoading(true);
    var previousData = data;
    if (value == 1) {
      previousData.value.careerprofile![0].desiredJobType = "Permanent";
    } else if (value == 2) {
      previousData.value.careerprofile![0].desiredJobType = "Contratual";
    }
    data(previousData.value);
    isLoading(false);
  }

  void defaultEmployementTypeSelection(value) async {
    isLoading(true);
    var previousData = data;
    if (value == 1) {
      previousData.value.careerprofile![0].desiredEmployementType = "Full Time";
    } else if (value == 2) {
      previousData.value.careerprofile![0].desiredEmployementType = "Part Time";
    } else if (value == 3) {
      previousData.value.careerprofile![0].desiredEmployementType =
          "Freelancer";
    } else if (value == 4) {
      previousData.value.careerprofile![0].desiredEmployementType =
          "Work From Home";
    } else if (value == 5) {
      previousData.value.careerprofile![0].desiredEmployementType =
          "Work Abroad";
    } else if (value == 6) {
      previousData.value.careerprofile![0].desiredEmployementType =
          "Internships";
    }
    data(previousData.value);
    isLoading(false);
  }

  void defaultShiftSelection(value) async {
    isLoading(true);
    var previousData = data;
    if (value == 1) {
      previousData.value.careerprofile![0].desiredPrefferedShift = "Any Shift";
    } else if (value == 2) {
      previousData.value.careerprofile![0].desiredPrefferedShift = "Day Shift";
    } else if (value == 3) {
      previousData.value.careerprofile![0].desiredPrefferedShift =
          "Night Shift";
    }
    data(previousData.value);
    isLoading(false);
  }
}

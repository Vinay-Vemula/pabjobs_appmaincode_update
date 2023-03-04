import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/entities/user_details_model.dart';

class ProfileDetailsController extends GetxController {
  var isLoading = true.obs;

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

  void fetchData() async {
    isLoading(true);
    await fetchUserDetails();
    isLoading(false);
  }

  void defaultGenderSelection(value) async {
    isLoading(true);
    var previousData = data;
    if (value == 1) {
      previousData.value.personaldetails!.gender = "Male";
    } else if (value == 2) {
      previousData.value.personaldetails!.gender = "Female";
    }
    data(previousData.value);
    print(data.value.personaldetails!.gender);
    isLoading(false);
  }

  void defaultMaritalSelection(value) async {
    isLoading(true);
    var previousData = data;
    if (value == 1) {
      previousData.value.personaldetails!.maritalStatus = "Married";
    } else if (value == 2) {
      previousData.value.personaldetails!.maritalStatus = "Unmarried";
    } else if (value == 3) {
      previousData.value.personaldetails!.maritalStatus = "Others";
    }
    data(previousData.value);
    isLoading(false);
  }

  void defaultpassportSelection(value) async {
    isLoading(true);
    var previousData = data;
    if (value == 1) {
      previousData.value.personaldetails!.passport = "Yes";
    } else if (value == 2) {
      previousData.value.personaldetails!.passport = "No";
    }
    data(previousData.value);
    isLoading(false);
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/entities/user_details_model.dart';

class EditProfileController extends GetxController {
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

  void defaultSelection(value) async {
    isLoading(true);
    var previousData = data;
    // print(value);
    if (value == 1) {
      previousData.value.experience = "fresher";
    } else if (value == 2) {
      previousData.value.experience = "experienced";
    }
    data(previousData.value);
    isLoading(false);
  }

  var locationData = [].obs;

  Future<void> readLocationJson() async {
    final String response =
        await rootBundle.loadString('assets/json/locations.json');
    final data1 = await json.decode(response);
    locationData(data1);
  }

  void uploadImage(File _image) async {
    var z = await APIService.uploadFile(_image);
    APIService.uploadProfileImageUrl(z);
  }

  void fetchData() async {
    isLoading(true);
    await fetchUserDetails();
    await readLocationJson();
    isLoading(false);
  }
}

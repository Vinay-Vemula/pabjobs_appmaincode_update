import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/entities/user_details_model.dart';

class ProfileController extends GetxController {
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
    isLoading(true);
    var z = await APIService.fetchUserDetails();
    data(z);
    isLoading(false);
  }

  var data_ = [].obs;

  Future<void> readLocationJson() async {
    final String response =
        await rootBundle.loadString('assets/json/locations.json');
    final data1 = await json.decode(response);
    data_(data1);
  }

  void fetchData() async {
    isLoading(true);
    await fetchUserDetails();
    await readLocationJson();
    isLoading(false);
  }
}

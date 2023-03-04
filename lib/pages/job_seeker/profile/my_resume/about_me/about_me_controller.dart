import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/entities/user_details_model.dart';

class AboutMeController extends GetxController {
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

  void uploadImage(File _image, String fileName) async {
    var z = await APIService.uploadFile(_image);
    APIService.uploadResumeImageUrl(z, fileName);
  }

  Future<void> readSkillsJson() async {
    final String response =
        await rootBundle.loadString('assets/json/Skill.json');
    final data1 = await json.decode(response);
    data3_(data1);
  }

  void jsonread() async {
    isLoading(true);
    await fetchUserDetails();
    await readSkillsJson();
    isLoading(false);
  }
}

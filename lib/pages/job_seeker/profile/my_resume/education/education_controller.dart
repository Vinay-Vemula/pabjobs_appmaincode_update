import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/entities/user_details_model.dart';

class EducationDetailsController extends GetxController {
  var isLoading = true.obs;
  var courseData = [].obs;
  var specializationData = [].obs;

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

  Future<void> readCourseJson() async {
    final String response =
        await rootBundle.loadString('assets/json/course.json');
    final _data = await json.decode(response);
    courseData(_data);
  }

  Future<void> readSpecialisationJson() async {
    final String response =
        await rootBundle.loadString('assets/json/Specialization.json');
    final _data1 = await json.decode(response);
    specializationData(_data1);
  }

  Future<void> fetchUserDetails() async {
    var z = await APIService.fetchUserDetails();
    data(z);
  }

  void fetchData() async {
    isLoading(true);
    await fetchUserDetails();
    await readCourseJson();
    await readSpecialisationJson();
    isLoading(false);
  }
}

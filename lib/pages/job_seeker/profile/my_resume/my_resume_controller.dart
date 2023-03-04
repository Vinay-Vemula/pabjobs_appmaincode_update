// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:path/path.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:pab_jobs/entities/api_service.dart';
// import 'package:pab_jobs/entities/user_details_model.dart';

// class MyResumeController extends GetxController {
//   var isLoading = true.obs;
//   var isJsonLoading = true.obs;
//   var data_ = [].obs;
//   var data1_ = [].obs;
//   var data2_ = [].obs;
//   var data3_ = [].obs;

//   var userDetails = <UserDetails>[].obs;
//   Rx<UserDetails> data = UserDetails(
//     certification: [],
//     contactNumber: 0,
//     currentlocation: [],
//     education: [],
//     email: '',
//     employment: [],
//     experience: '',
//     id: '',
//     isEmailVerified: false,
//     isPhoneVerified: false,
//     jobApplicantDate: DateTime.now(),
//     name: '',
//     patent: [],
//     presentation: [],
//     profile: '',
//     profileSummary: '',
//     project: [],
//     publication: [],
//     rating: 0,
//     resumeHeadline: '',
//     skills: [],
//     totalExperience: '',
//     state: '',
//     userId: '',
//     v: 0,
//     worksample: [],
//     profileImage: '',
//     careerprofile: [],
//   ).obs;

//   Future<void> fetchUserDetails() async {
//     // isLoading(true);
//     var z = await APIService.fetchUserDetails();
//     data(z);
//     // isLoading(false);
//   }

//   void uploadImage(File _image, String fileName) async {
//     var z = await APIService.uploadFile(_image);

//     print(z);
//     print(fileName);
//     APIService.uploadImageUrl(z, fileName);
//   }

//   Future<void> readLocationJson() async {
//     final String response =
//         await rootBundle.loadString('assets/json/locations.json');
//     final _data = await json.decode(response);
//     data_(_data);
//     // data_ = _data;
//   }

//   Future<void> readIndustryJson() async {
//     final String response =
//         await rootBundle.loadString('assets/json/Category.json');
//     final _data1 = await json.decode(response);
//     data1_(_data1);
//   }

//   Future<void> readDesignationJson() async {
//     final String response =
//         await rootBundle.loadString('assets/json/Designation.json');
//     final _data2 = await json.decode(response);
//     data2_(_data2);
//   }

//   Future<void> readSkillsJson() async {
//     final String response =
//         await rootBundle.loadString('assets/json/Skill.json');
//     final data1 = await json.decode(response);
//     data3_(data1);
//   }

//   void fetchData() async {
//     isJsonLoading(true);
//     await fetchUserDetails();
//     await readLocationJson();
//     await readIndustryJson();
//     await readDesignationJson();
//     await readSkillsJson();
//     isJsonLoading(false);
//   }
// }

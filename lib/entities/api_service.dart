// ignore_for_file: constant_identifier_names, equal_keys_in_map, deprecated_member_use, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pabjobs/common/constant.dart';
import 'package:http/http.dart' as http;
import 'package:pabjobs/entities/job_fair_model.dart';
import 'package:path/path.dart' as path;
import 'package:async/async.dart';

import 'package:pabjobs/entities/applied_jobs_model.dart';
import 'package:pabjobs/entities/job_details_by_id_model.dart';
import 'package:pabjobs/entities/job_details_model.dart';
import 'package:pabjobs/entities/user_details_model.dart';
import 'package:pabjobs/entities/favourite_model.dart';
import 'package:pabjobs/entities/notification_model.dart';
import 'package:pabjobs/entities/recomended_job_details_model.dart';

class APIService {
  APIService._();

  static Box<String> userInfo = Hive.box<String>(Constant.dbName);

  static const String API_HOST = 'https://api.pabjobs.com/';

  static http.Client client = http.Client();

  static Map<String, String> getAuthHeader() {
    String? token = userInfo.get('token');
    if (token == null) throw Exception('User is not logged in');
    // print(token);
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8'
    };
  }

  static Future<bool> phoneVerification(
      String phoneNo, Function(String) error) async {
    var resp = await client.post(
      Uri.parse(API_HOST + 'auth/mobile/send-otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'phone': phoneNo,
        },
      ),
    );
    if (resp.statusCode == 200) {
      return true;
    }
    error.call('User Not Registered');
    return false;
  }

  static Future<bool> checkOTP(
      String phoneNo, String otp, Function(String) f) async {
    var resp = await client.post(
      Uri.parse(API_HOST + 'auth/mobile/verify-otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'phone': phoneNo,
          'otp': otp,
        },
      ),
    );
    if (resp.statusCode == 200) {
      String token = jsonDecode(resp.body)['token'];
      String type = jsonDecode(resp.body)['type'];
      // print(token);
      userInfo.put('token', token);
      userInfo.put('type', type);

      return true;
    } else if (resp.statusCode == 404) {
      Get.snackbar("Error", "Something Wrong with Server.",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    } else {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Error", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    }

    return false;
  }

  static login({
    required String email,
    required String password,
  }) async {
    var url = API_HOST + 'auth/login';
    var resp = await client.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          "email": email,
          "password": password,
        },
      ),
    );

    var decodedJSON = jsonDecode(resp.body);

    if (resp.statusCode == 200) {
      String token = jsonDecode(resp.body)['token'];
      String type = jsonDecode(resp.body)['type'];
      userInfo.put('token', token);
      userInfo.put('type', type);

      return decodedJSON['type'];
    } else {
      var message = decodedJSON["message"];
      Get.snackbar("Error", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    }
    return "failed";
  }

  static Future<bool> signUp(String name, String contactNumber, String email,
      String type, String password) async {
    var resp = await client.post(
      Uri.parse(API_HOST + 'auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'name': name,
          'contactNumber': contactNumber,
          'email': email,
          'type': type,
          'password': password,
        },
      ),
    );
    print(resp.statusCode);
    print(resp.body);
    if (resp.statusCode == 200) {
      String token = jsonDecode(resp.body)['token'];
      String type = jsonDecode(resp.body)['type'];
      // print(token);
      // print(print);
      userInfo.put('token', token);
      userInfo.put('type', type);
      return true;
    } else {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Error", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    }
    return false;
  }

  static Future<bool> forgotPassword(String phone) async {
    var resp = await client.post(
      Uri.parse(API_HOST + 'auth/forgot-password'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'phone': phone,
        },
      ),
    );
    print(resp.statusCode);
    print(resp.body);
    if (resp.statusCode == 200) {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Message", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      return true;
    } else {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Error", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    }
    return false;
  }

  static Future<bool> AddProfileDetails(String currentlocation,
      String experience, String total_experience, List skills) async {
    var header = getAuthHeader();
    var resp = await client.put(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'currentlocation': currentlocation,
          'experience': experience,
          'total_experience': total_experience,
          'skills': skills,
        },
      ),
    );
    if (resp.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> EditProfileDetails(
    String experience,
    String total_experience,
    String name,
    String email,
    String contactNumber,
    String currentlocation,
  ) async {
    var header = getAuthHeader();
    var resp = await client.put(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
      body: jsonEncode(
        <String, String>{
          'experience': experience,
          'total_experience': total_experience,
          'name': name,
          'email': email,
          'contactNumber': contactNumber,
          'currentlocation': currentlocation,
        },
      ),
    );
    if (resp.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> addAboutMeDetails(
    String resumeHeadline,
    String profileSummary,
    List skills,
  ) async {
    var header = getAuthHeader();
    var resp = await client.put(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'resumeHeadline': resumeHeadline,
          'profileSummary': profileSummary,
          'skills': skills,
        },
      ),
    );
    if (resp.statusCode == 200) {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Message", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      return true;
    }
    return false;
  }

  static fetchrecomendedjobDetails() async {
    var header = getAuthHeader();
    var response = await client.get(Uri.parse(API_HOST + 'api/job-alerts/list'),
        headers: header);
    print(response.body);
    if (response.statusCode == 200) {
      return recomendedJobDetailsFromJson(response.body);
    }
  }

  static fetchJobDetails(int pageNo) async {
    var header = getAuthHeader();
    var response = await client.post(
      Uri.parse(API_HOST + 'api/jobs/search?page=$pageNo'),
      headers: header,
      body: jsonEncode(
        <String, List>{
          'category': [],
          'companies': [],
          'educations': [],
          'experience': [],
          'industryType': [],
          'location': [],
          'skills': [],
        },
      ),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return false;
    }
  }

  static addtoFavourites(String id, String action) async {
    var header = getAuthHeader();
    var response = await client.get(
      Uri.parse(API_HOST + 'api/wishlist/$action/$id'),
      headers: header,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static fetchFavourites() async {
    var header = getAuthHeader();
    var response = await client.get(
      Uri.parse(API_HOST + 'api/wishlist/list'),
      headers: header,
    );
    print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return favouritesModelFromJson(response.body);
    } else {
      Get.snackbar("Error", "Something Went Wrong!",
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    }
  }

  static fetchfilteredJobDetails(
      List category,
      List companies,
      List educations,
      List experience,
      List industryType,
      List location,
      List skills,
      List salary) async {
    var header = getAuthHeader();
    var response = await client.post(
      Uri.parse(API_HOST + 'api/jobs/search?page=0'),
      headers: header,
      body: jsonEncode(
        <String, List>{
          'category': category,
          'companies': companies,
          'educations': educations,
          'experience': experience,
          'industryType': industryType,
          'location': location,
          'skills': skills,
          'salary': salary
        },
      ),
    );
    if (response.statusCode == 200) {
      return jobDetailsFromJson(response.body);
    }
  }

  static fetchSearchJobDetails(String q) async {
    var header = getAuthHeader();
    var response = await client.post(
      Uri.parse(API_HOST + 'api/jobs/search?page=0'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'category': [],
          'companies': [],
          'educations': [],
          'experience': [],
          'industryType': [],
          'location': [],
          'skills': [],
          'salary': [],
          'q': q,
        },
      ),
    );
    if (response.statusCode == 200) {
      return jobDetailsFromJson(response.body);
    }
  }

  static fetchNotifications() async {
    var header = getAuthHeader();
    var response = await client.get(Uri.parse(API_HOST + 'api/notification'),
        headers: header);
    if (response.statusCode == 200) {
      return notificationModelFromJson(response.body);
    }
  }

  static fetchUserDetails() async {
    var header = getAuthHeader();
    var response =
        await client.get(Uri.parse(API_HOST + 'api/user'), headers: header);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return userDetailsFromJson(response.body);
    }
  }

  static fetchAppliedJobs() async {
    var header = getAuthHeader();
    var response = await client.get(Uri.parse(API_HOST + 'api/applications'),
        headers: header);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return appliedJobsFromJson(response.body);
    }
  }

  static fetchJobDetailsbyId(String id) async {
    var header = getAuthHeader();
    var response =
        await client.get(Uri.parse(API_HOST + 'api/jobs/$id'), headers: header);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return jobDetailsbyIdFromJson(response.body);
    }
  }

  static Future<bool> applyjob(String id) async {
    var header = getAuthHeader();
    var resp = await client.post(
      Uri.parse(API_HOST + 'api/jobs/$id/applications'),
      headers: header,
      body: jsonEncode(
        <String, String>{
          'sop': "ksajdfk",
        },
      ),
    );
    var decodedJSON = jsonDecode(resp.body);
    var errorMessage = decodedJSON["message"];
    if (resp.statusCode == 200) {
      return true;
    }

    Get.snackbar("Message", errorMessage,
        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    return false;
  }

  static Future<bool> changePassword(
    String password,
    String newpassword,
  ) async {
    var header = getAuthHeader();
    var resp = await client.post(
      Uri.parse(API_HOST + 'api/changepassword'),
      headers: header,
      body: jsonEncode(
        <String, String>{
          'password': password,
          'newpassword': newpassword,
        },
      ),
    );
    if (resp.statusCode == 200) {
      return true;
    }
    return false;
  }

  static uploadResumeImageUrl(String _resumeurl, String _resumename) async {
    print(_resumename);
    print(_resumeurl);
    var header = getAuthHeader();
    var response = await client.post(
      Uri.parse(API_HOST + 'upload/profile'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'resumeName': _resumename,
          'resume': _resumeurl,
        },
      ),
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Get.snackbar("Message", "Resume Uploaded", backgroundColor: Colors.white);
      return true;
    }
  }

  static uploadProfileImageUrl(String _profileUrl) async {
    var header = getAuthHeader();
    var response = await client.post(
      Uri.parse(API_HOST + 'upload/profile'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'profileImage': _profileUrl,
        },
      ),
    );
    if (response.statusCode == 200) {
      return true;
    }
  }

  static Future<String> uploadFile(File file) async {
    var header = getAuthHeader();
    var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();
    var uri = Uri.parse(API_HOST + "upload/upload/");
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(header);
    var multipartFile = http.MultipartFile('image', stream, length,
        filename: path.basename(file.path));
    request.files.add(multipartFile);
    var response = await request.send();
    var responseBody = await response.stream.bytesToString();

    print(response.statusCode);
    print(responseBody);

    if (response.statusCode == 200) {
      var decodedJSON = jsonDecode(responseBody);
      var _imagelink =
          "https://pabsolution-bucket-1.s3-ap-south-1.amazonaws.com/" +
              decodedJSON['imageUrl'];
      return _imagelink;
    }
    return "failed";
  }

  static Future<bool> careerProfile(
    String Desired_Industry,
    String Desired_Role_URL,
    String Desired_Job_Type,
    String Desired_Employement_Type,
    String Desired_PrefferedShift,
    String Desired_Expected_SalaryinLakhs,
    String Desired_Location,
  ) async {
    var header = getAuthHeader();
    var resp = await client.put(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'careerprofile': {
            'Desired_Industry': Desired_Industry,
            'Desired_Role_URL': Desired_Role_URL,
            'Desired_Job_Type': Desired_Job_Type,
            'Desired_Employement_Type': Desired_Employement_Type,
            'Desired_PrefferedShift': Desired_PrefferedShift,
            'Desired_Expected_SalaryinLakhs': Desired_Expected_SalaryinLakhs,
            'Desired_Location': Desired_Location,
          }
        },
      ),
    );
    print(resp.statusCode);
    print(resp.body);
    if (resp.statusCode == 200) {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Message", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      return true;
    }
    return false;
  }

  static Future<bool> profileDetails(
    String dateofbirth,
    String gender,
    String address,
    String hometown,
    String pincode,
    String maritalStatus,
    String AddressProof,
    String AdressProofNumber,
    String passport,
    List languages,
  ) async {
    var header = getAuthHeader();
    var resp = await client.put(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'personaldetails': {
            'dateofbirth': dateofbirth,
            'gender': gender,
            'address': address,
            'hometown': hometown,
            'pincode': pincode,
            'maritalStatus': maritalStatus,
            'AddressProof': AddressProof,
            'AdressProofNumber': AdressProofNumber,
            'passport': passport,
            'languages': languages,
          }
        },
      ),
    );
    if (resp.statusCode == 200) {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Message", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      return true;
    }
    return false;
  }

  static Future<bool> educationDetails(
      String highestgraduation,
      String course,
      String specialization,
      String institute,
      String courseType,
      String passedoutyear,
      String marks,
      dynamic educationDetails) async {
    var header = getAuthHeader();

    dynamic educationList = [];
    educationDetails
        .map((item) => {
              educationList.addAll([
                {
                  'highestgraduation': item.highestgraduation,
                  'course': item.course,
                  'specialization': item.specialization,
                  'institute': item.institute,
                  'courseType': item.courseType,
                  'passedoutyear': item.passedoutyear,
                  'marks': item.marks,
                }
              ])
            })
        .toList();
    educationList.addAll([
      {
        'highestgraduation': highestgraduation,
        'course': course,
        'specialization': specialization,
        'institute': institute,
        'courseType': courseType,
        'passedoutyear': passedoutyear,
        'marks': marks,
      }
    ]);

    var resp = await client.put(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{'education': educationList},
      ),
    );
    print(resp.statusCode);
    print(resp.body);
    if (resp.statusCode == 200) {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Message", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      return true;
    }
    return false;
  }

  static deleteEducation(String id) async {
    var header = getAuthHeader();
    var response = await client.delete(
        Uri.parse(API_HOST + 'api/user/$id/education'),
        headers: header);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static editEducation(
    String id,
    String highestgraduation,
    String course,
    String specialization,
    String institute,
    String courseType,
    String passedoutyear,
    String marks,
  ) async {
    var header = getAuthHeader();
    var response = await client.put(
      Uri.parse(API_HOST + 'api/user/$id/education'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'highestgraduation': highestgraduation,
          'course': course,
          'specialization': specialization,
          'institute': institute,
          'courseType': courseType,
          'passedoutyear': passedoutyear,
          'marks': marks,
          '_id': id
        },
      ),
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> employementDetails(
    String designation,
    String organization,
    String isCurrentCompany,
    String startYear,
    String endYear,
    String profileDescription,
    dynamic employmentDetails,
  ) async {
    var header = getAuthHeader();
    dynamic employmentList = [];
    employmentDetails
        .map((item) => {
              employmentList.addAll([
                {
                  'designation': item.designation,
                  'organization': item.organization,
                  'isCurrentCompany': item.isCurrentCompany,
                  // 'startYear': item.startYear.toString(),
                  'endYear': item.endYear.toString(),
                  'maritalStprofileDescriptionatus': item.profileDescription,
                }
              ])
            })
        .toList();
    employmentList.addAll([
      {
        'designation': designation,
        'organization': organization,
        'isCurrentCompany': isCurrentCompany,
        'startYear': startYear,
        'endYear': endYear,
        'maritalStprofileDescriptionatus': profileDescription,
      }
    ]);

    var resp = await client.put(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{'employment': employmentList},
      ),
    );
    if (resp.statusCode == 200) {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Message", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      return true;
    }
    var decodedJSON = jsonDecode(resp.body);
    var message = decodedJSON["message"];
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    return false;
  }

  static deleteEmployement(String id) async {
    var header = getAuthHeader();
    var response = await client.delete(
        Uri.parse(API_HOST + 'api/user/$id/employment'),
        headers: header);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static editEmployement(
    String id,
    String designation,
    String organization,
    String isCurrentCompany,
    String startYear,
    String endYear,
    String profileDescription,
  ) async {
    var header = getAuthHeader();
    var response = await client.put(
      Uri.parse(API_HOST + 'api/user/$id/employment'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'designation': designation,
          'organization': organization,
          'isCurrentCompany': isCurrentCompany,
          'startYear': startYear,
          'endYear': endYear,
          'maritalStprofileDescriptionatus': profileDescription,
          '_id': id
        },
      ),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> projectDetails(
      String ProjectTitle,
      String ProjectClient,
      String ProjectStartDate,
      String ProjectWorkTill,
      String ProjectDescription,
      dynamic projectDetails) async {
    var header = getAuthHeader();

    dynamic projectList = [];
    projectDetails
        .map((item) => {
              projectList.addAll([
                {
                  'ProjectTitle': item.projectTitle,
                  'ProjectClient': item.projectClient,
                  'ProjectStartDate': item.projectStartDate.toString(),
                  'ProjectWorkTill': item.projectWorkTill.toString(),
                  'ProjectDescription': item.projectDescription,
                }
              ])
            })
        .toList();
    projectList.addAll([
      {
        'ProjectTitle': ProjectTitle,
        'ProjectClient': ProjectClient,
        'ProjectStartDate': ProjectStartDate,
        'ProjectWorkTill': ProjectWorkTill,
        'ProjectDescription': ProjectDescription,
      }
    ]);

    var resp = await client.put(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{'project': projectList},
      ),
    );
    print(resp.body);
    print(resp.statusCode);
    if (resp.statusCode == 200) {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Message", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      return true;
    }
    var decodedJSON = jsonDecode(resp.body);
    var message = decodedJSON["message"];
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    return false;
  }

  static deleteProject(String id) async {
    var header = getAuthHeader();
    var response = await client
        .delete(Uri.parse(API_HOST + 'api/user/$id/project'), headers: header);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static editProject(
    String id,
    String ProjectTitle,
    String ProjectClient,
    String ProjectStartDate,
    String ProjectWorkTill,
    String ProjectDescription,
  ) async {
    var header = getAuthHeader();
    var response = await client.put(
      Uri.parse(API_HOST + 'api/user/$id/project'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'ProjectTitle': ProjectTitle,
          'ProjectClient': ProjectClient,
          'ProjectStartDate': ProjectStartDate,
          'ProjectWorkTill': ProjectWorkTill,
          'ProjectDescription': ProjectDescription,
          '_id': id
        },
      ),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> acccomplishmentDetails(
      String Work_Title,
      String Work_URL,
      String Work_Duration_From,
      String Work_Duration_To,
      String Work_Description,
      dynamic workSampleDetails) async {
    var header = getAuthHeader();

    dynamic workSampleList = [];
    workSampleDetails
        .map((item) => {
              workSampleList.addAll([
                {
                  'Work_Title': item.workTitle,
                  'Work_URL': item.workUrl,
                  'Work_Duration_From': item.workDurationFrom.toString(),
                  'Work_Duration_To': item.workDurationTo.toString(),
                  'Work_Description': item.workDescription,
                }
              ])
            })
        .toList();
    workSampleList.addAll([
      {
        'Work_Title': Work_Title,
        'Work_URL': Work_URL,
        'Work_Duration_From': Work_Duration_From,
        'Work_Duration_To': Work_Duration_To,
        'Work_Description': Work_Description,
      }
    ]);

    var resp = await client.put(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{'worksample': workSampleList},
      ),
    );
    print(resp.statusCode);
    if (resp.statusCode == 200) {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Message", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      return true;
    }
    var decodedJSON = jsonDecode(resp.body);
    var message = decodedJSON["message"];
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    return false;
  }

  static deleteAcccomplishment(String id) async {
    var header = getAuthHeader();
    var response = await client.delete(
        Uri.parse(API_HOST + 'api/user/$id/worksample'),
        headers: header);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static editAcccomplishment(
    String id,
    String Work_Title,
    String Work_URL,
    String Work_Duration_From,
    String Work_Duration_To,
    String Work_Description,
  ) async {
    var header = getAuthHeader();
    var response = await client.put(
      Uri.parse(API_HOST + 'api/user/$id/worksample'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'Work_Title': Work_Title,
          'Work_URL': Work_URL,
          'Work_Duration_From': Work_Duration_From,
          'Work_Duration_To': Work_Duration_To,
          'Work_Description': Work_Description,
          '_id': id
        },
      ),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> researchDetails(
    String Publication_Title,
    String Publication_URL,
    String Publication_Description,
    dynamic researchDetails,
  ) async {
    var header = getAuthHeader();

    dynamic researchList = [];
    researchDetails
        .map((item) => {
              researchList.addAll([
                {
                  'Publication_Title': item.publicationTitle,
                  'Publication_URL': item.publicationUrl,
                  'Publication_Description': item.publicationDescription,
                }
              ])
            })
        .toList();
    researchList.addAll([
      {
        'Publication_Title': Publication_Title,
        'Publication_URL': Publication_URL,
        'Publication_Description': Publication_Description,
      }
    ]);
    var resp = await client.put(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{'publication': researchList},
      ),
    );
    if (resp.statusCode == 200) {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Message", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      return true;
    }
    var decodedJSON = jsonDecode(resp.body);
    var message = decodedJSON["message"];
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    return false;
  }

  static deleteResearch(String id) async {
    var header = getAuthHeader();
    var response = await client.delete(
        Uri.parse(API_HOST + 'api/user/$id/publication'),
        headers: header);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static editResearch(
    String id,
    String Publication_Title,
    String Publication_URL,
    String Publication_Description,
  ) async {
    var header = getAuthHeader();
    var response = await client.put(
      Uri.parse(API_HOST + 'api/user/$id/publication'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'Publication_Title': Publication_Title,
          'Publication_URL': Publication_URL,
          'Publication_Description': Publication_Description,
          '_id': id
        },
      ),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> presentationDetails(
      String Presentation_Title,
      String Presentation_URL,
      String Presentation_Description,
      dynamic presentationDetails) async {
    var header = getAuthHeader();

    dynamic presentationList = [];
    presentationDetails
        .map((item) => {
              presentationList.addAll([
                {
                  'Presentation_Title': item.presentationTitle,
                  'Presentation_URL': item.presentationUrl,
                  'Presentation_Description': item.presentationDescription,
                }
              ])
            })
        .toList();
    presentationList.addAll([
      {
        'Presentation_Title': Presentation_Title,
        'Presentation_URL': Presentation_URL,
        'Presentation_Description': Presentation_Description,
      }
    ]);
    var resp = await client.put(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{'presentation': presentationList},
      ),
    );
    if (resp.statusCode == 200) {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Message", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      return true;
    }
    var decodedJSON = jsonDecode(resp.body);
    var message = decodedJSON["message"];
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    return false;
  }

  static Future<bool> patentDetails(
    String Patent_Title,
    String Patent_URL,
    String Patent_Office,
    String Patent_Status,
    String Patent_Application_Number,
    String Patent_Description,
    dynamic patentDetails,
  ) async {
    var header = getAuthHeader();

    dynamic patentList = [];
    patentDetails
        .map((item) => {
              patentList.addAll([
                {
                  'Patent_Title': item.patentTitle,
                  'Patent_URL': item.patentUrl,
                  'Patent_Office': item.patentOffice,
                  'Patent_Status': item.patentStatus,
                  'Patent_Application_Number': item.patentApplicationNumber,
                  'Patent_Description': item.patentDescription,
                }
              ])
            })
        .toList();
    patentList.addAll([
      {
        'Patent_Title': Patent_Title,
        'Patent_URL': Patent_URL,
        'Patent_Office': Patent_Office,
        'Patent_Status': Patent_Status,
        'Patent_Application_Number': Patent_Application_Number,
        'Patent_Description': Patent_Description,
      }
    ]);

    var resp = await client.put(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{'patent': patentList},
      ),
    );
    if (resp.statusCode == 200) {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Message", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      return true;
    }
    var decodedJSON = jsonDecode(resp.body);
    var message = decodedJSON["message"];
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    return false;
  }

  static Future<bool> certificationDetails(
    String Certification_Name,
    String Certification_ID,
    String Certification_URL,
    String Certification_Validity_From,
    String Certification_Validity_To,
    dynamic certificateDetails,
  ) async {
    var header = getAuthHeader();
    dynamic certificateList = [];
    certificateDetails
        .map((item) => {
              certificateList.addAll([
                {
                  'Certification_Name': item.certificationName,
                  'Certification_ID': item.certificationId,
                  'Certification_URL': item.certificationUrl,
                  'Certification_Validity_From':
                      item.certificationValidityFrom.toString(),
                  'Certification_Validity_To':
                      item.certificationValidityTo.toString(),
                }
              ])
            })
        .toList();
    certificateList.addAll([
      {
        'Certification_Name': Certification_Name,
        'Certification_ID': Certification_ID,
        'Certification_URL': Certification_URL,
        'Certification_Validity_From': Certification_Validity_From,
        'Certification_Validity_To': Certification_Validity_To,
      }
    ]);
    var resp = await client.put(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{'certification': certificateList},
      ),
    );
    if (resp.statusCode == 200) {
      var decodedJSON = jsonDecode(resp.body);
      var message = decodedJSON["message"];
      Get.snackbar("Message", message,
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
      return true;
    }
    var decodedJSON = jsonDecode(resp.body);
    var message = decodedJSON["message"];
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    return false;
  }

  static megaJobFair(String education) async {
    var header = getAuthHeader();
    var response = await client.post(
      Uri.parse(API_HOST + 'api/hall-ticket/apply'),
      headers: header,
      body: jsonEncode(
        <String, String>{'educationDetails': education},
      ),
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static megaJobFairNotLogged(
    String name,
    String phone,
    String education,
  ) async {
    var response = await client.post(
      Uri.parse(API_HOST + 'api/hall-ticket/apply-for-non-logged-user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'name': name,
          'phone': phone,
          'educationDetails': education
        },
      ),
    );

    if (response.statusCode == 200) {
      String fileSrc = jsonDecode(response.body)['fileSrc'];
      userInfo.put('fileSrc', fileSrc);
      return true;
    }
    return false;
  }

  static isAppliedMegaJobFair() async {
    var header = getAuthHeader();
    var response = await client.post(
        Uri.parse(API_HOST + 'api/hall-ticket/check-if-user-applied'),
        headers: header);

    print(response.body);
    if (response.statusCode == 200) {
      return jobFairModelFromJson(response.body);
    }
    return false;
  }
}

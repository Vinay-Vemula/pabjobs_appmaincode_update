import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:pabjobs/entities/candidate_details_model.dart';
import 'package:path/path.dart' as path;
import 'package:async/async.dart';

import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/entities/company_profile_model.dart';
import 'package:pabjobs/entities/edit_job_data_model.dart';
import 'package:pabjobs/entities/recruiter_post_job_model.dart';
import 'package:pabjobs/entities/view_page_model.dart';
import '../common/constant.dart';
import 'applicant_listing_model.dart';
import 'my_jobs_model.dart';
import 'package:pabjobs/common/constant.dart';

class ApiServiceRecruiter {
  ApiServiceRecruiter._();

  static Box<String> userInfo = Hive.box<String>(Constant.dbName);

  static const String API_HOST = 'https://api.pabjobs.com/';

  static http.Client client = http.Client();

  static Future<bool> postJob(
    String? jobTitle,
    String? maxPosition,
    String? jobType,
    String? experience,
    String? salary,
    List<dynamic>? skills,
    String? region,
    List<dynamic>? locations,
    String? deadline,
    String? education,
    String? description,
  ) async {
    var header = APIService.getAuthHeader();
    var response = await client.post(
      Uri.parse(API_HOST + 'api/jobs'),
      headers: header,
      body: jsonEncode(<String, dynamic>{
        'title': jobTitle,
        'maxPositions': maxPosition,
        'jobType': jobType,
        'experience': experience,
        'salary': salary,
        'skillsets': skills,
        'country': region,
        'cities': locations,
        'deadline': deadline,
        'education': education,
        'description': description,
      }),
    );
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static fetchMyJobs() async {
    var header = APIService.getAuthHeader();
    var response = await client.get(
      Uri.parse(API_HOST + 'api/jobs?myjobs=1'),
      headers: header,
    );
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return myJobsModelFromJson(response.body);
    } else {
      // print(response.statusCode);
      // print(response.body);
      // Get.snackbar("Error", "Something Went Wrong!",
      //     snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    }
  }

  static fetchEditJobData(String id) async {
    var header = APIService.getAuthHeader();
    var response = await client.get(
      Uri.parse(API_HOST + 'api/jobs/$id'),
      headers: header,
    );
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return editJobDataModelFromJson(response.body);
    } else {
      // print(response.statusCode);
      // print(response.body);
      // Get.snackbar("Error", "Something Went Wrong!",
      //     snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
    }
  }

  static fetchApplicantById(String id) async {
    var header = APIService.getAuthHeader();
    var response = await client
        .get(Uri.parse(API_HOST + 'api/applicants?jobId=$id'), headers: header);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return applicantModelFromJson(response.body);
    }
  }

  static Future<bool> deleteJobById(String id) async {
    var header = APIService.getAuthHeader();
    var response = await client.delete(Uri.parse(API_HOST + 'api/jobs/$id'),
        headers: header);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> statusUpdateId(String id, String status) async {
    var header = APIService.getAuthHeader();
    var response = await client.put(
      Uri.parse(API_HOST + 'api/applications/$id'),
      headers: header,
      body: jsonEncode(<String, dynamic>{
        'dateOfPosting': DateTime.now().toString(),
        'status': status
      }),
    );
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static fetchViewContent(String id) async {
    var header = APIService.getAuthHeader();
    var response =
        await client.get(Uri.parse(API_HOST + 'api/jobs/$id'), headers: header);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return viewPageModelFromJson(response.body);
    }
  }

  static Future<bool> editJob(
    String? jobTitle,
    String? maxPosition,
    String? jobType,
    String? experience,
    String? salary,
    List<dynamic>? skills,
    String? region,
    List<dynamic>? locations,
    String? deadline,
    String? education,
    String? description,
    String? id,
  ) async {
    var header = APIService.getAuthHeader();
    var response = await client.put(
      Uri.parse(API_HOST + 'api/jobs/$id'),
      headers: header,
      body: jsonEncode(<String, dynamic>{
        'title': jobTitle,
        'maxPositions': maxPosition,
        'jobType': jobType,
        'experience': experience,
        'salary': salary,
        'skillsets': skills,
        'country': region,
        'cities': locations,
        'deadline': deadline,
        'education': education,
        'description': description,
      }),
    );
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static fetchCompanyProfileData() async {
    var header = APIService.getAuthHeader();
    var response = await client.get(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
    );
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return companyProfileModelFromJson(response.body);
    }
  }

  static Future<String> uploadFile(File file) async {
    var header = APIService.getAuthHeader();
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

  static uploadProfileImageUrl(String _profileUrl) async {
    var header = APIService.getAuthHeader();
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

  static updateCompanyProfile(
    String? companyName,
    String? webSiteLink,
    String? foundedDate,
    String? industryType,
    String? description,
    int? contactNumber,
    String? email,
    String? country,
    String? state,
    String? city,
    int? pinCode,
    String? address,
    String? facebook,
    String? twitter,
    String? google,
    String? linkedin,
  ) async {
    var header = APIService.getAuthHeader();
    var response = await client.put(
      Uri.parse(API_HOST + 'api/user'),
      headers: header,
      body: jsonEncode(<String, dynamic>{
        'address': address,
        'city': city,
        'companyname': companyName,
        'contactNumber': contactNumber,
        'country': country,
        // 'createdAt': foundedDate,
        'description': description,
        'email': email,
        'facebook': facebook,
        'foundedDate': foundedDate,
        'google': google,
        'linkedin': linkedin,
        'organizationType': industryType,
        'pincode': pinCode,
        // 'profileImage':
        'state': state,
        // "subscription":
        // 'subscriptionDetails':
        'twitter': twitter,
        'websitelink': webSiteLink,
      }),
    );
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      Get.snackbar('Error', 'Something gone Wrong.',
          backgroundColor: Colors.white);
    }
    return false;
  }

  static fetchfilteredJobDetails(
    List designation,
    List skills,
    String experience,
    List location,
  ) async {
    // print(experience);
    var header = APIService.getAuthHeader();
    var response = await client.post(
      Uri.parse(API_HOST + 'api/allapplicants/search?page=0&&limit=100'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'ageMax': "",
          'ageMin': "",
          'applicationFilter': "",
          'educations_course': [],
          'emp_type': [],
          'expectedCTC': "",
          'gender': [],
          'isEmailVerified': false,
          'isPhoneVerified': false,
          'isResume': false,
          'profileSearch': [],
          'state': [],
          'timestamp': "",
          'work_shift': [],
          'category': designation,
          'companies': [],
          'educations': [],
          'experience': experience,
          'industryType': [],
          'location': location,
          'skills': skills,
          'salary': [],
        },
      ),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return candidateDetailsModelFromJson(response.body);
    }
  }

  static fetchCandidateList(int pagenumber) async {
    var header = APIService.getAuthHeader();
    print('Candidate page fetched');
    var response = await client.post(
      Uri.parse(
          API_HOST + 'api/allapplicants/search?page=$pagenumber&&limit=20'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          'applicationFilter': "",
          'category': [],
          'designation': [],
          'educations': [],
          'educations_course': [],
          'emp_type': [],
          'experience': "",
          'gender': [],
          'industryType': [],
          'location': [],
          'profileSearch': [],
          'skills': [],
          'state': [],
          'timestamp': "",
          'work_shit': [],
        },
      ),
    );

    print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  static fetchSearchJobDetails(String q) async {
    var header = APIService.getAuthHeader();
    var response = await client.post(
      Uri.parse(API_HOST + 'api/allapplicants/search?page=1&&limit=100'),
      headers: header,
      body: jsonEncode(
        <String, dynamic>{
          // 'ageMax': "",
          // 'ageMin': "",
          // 'applicationFilter': "",
          // 'educations_course': [],
          // 'emp_type': [],
          // 'expectedCTC': "",
          // 'gender': [],
          // 'isEmailVerified': false,
          // 'isPhoneVerified': false,
          // 'isResume': false,
          // 'profileSearch': [],
          // 'state': [],
          // 'timestamp': "",
          // 'work_shift': [],
          // 'category': [],
          // 'companies': [],
          // 'educations': [],
          // 'experience': [],
          // 'industryType': [],
          // 'location': [],
          // 'skills': [],
          // 'salary': [],
          'q': q
        },
      ),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return candidateDetailsModelFromJson(response.body);
    }
  }
}

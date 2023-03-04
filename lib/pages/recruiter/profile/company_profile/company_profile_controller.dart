import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service_recruiter.dart';

import '../../../../entities/company_profile_model.dart';

class CompanyProfileController extends GetxController {
  var isLoading = true.obs;
  var locationData = [].obs;
  var industryData = [].obs;
  Rx<CompanyProfileModel> profileData = CompanyProfileModel().obs;

  Future<void> readLocationJson() async {
    final String response =
        await rootBundle.loadString('assets/json/locations.json');
    final data = await json.decode(response);
    locationData(data);
  }

  Future<void> fetchProfileData() async {
    var fetchedData = await ApiServiceRecruiter.fetchCompanyProfileData();
    if (fetchedData != null) {
      profileData.value = fetchedData;
    }
  }

  Future<void> readIndustryJson() async {
    final String response =
        await rootBundle.loadString('assets/json/Category.json');
    final _data1 = await json.decode(response);
    industryData(_data1);
  }

  void uploadImage(File _image) async {
    var z = await ApiServiceRecruiter.uploadFile(_image);
    ApiServiceRecruiter.uploadProfileImageUrl(z);
  }

  void fetchData() async {
    isLoading(true);
    await readLocationJson();
    await fetchProfileData();
    await readIndustryJson();
    isLoading(false);
  }
}

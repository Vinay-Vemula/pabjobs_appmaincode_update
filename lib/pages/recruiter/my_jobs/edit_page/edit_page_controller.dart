import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pabjobs/entities/edit_job_data_model.dart';

import '../../../../entities/api_service_recruiter.dart';
import '../../../../entities/my_jobs_model.dart';
import '../../../../entities/view_page_model.dart';

class EditPageController extends GetxController {
  var isLoading = true.obs;
  var skilldata = [].obs;
  var locationData = [].obs;
  var jobData = <MyJobsModel>[].obs;
  Rx<EditJobDataModel> myJobData = EditJobDataModel().obs;
  Future<void> readLocationJson() async {
    final String response =
        await rootBundle.loadString('assets/json/locations.json');
    final data = await json.decode(response);
    // print(data);
    locationData(data);
  }

  Future<void> readSkillsJson() async {
    final String response =
        await rootBundle.loadString('assets/json/Skill.json');
    final data1 = await json.decode(response);
    // print(data1);
    skilldata(data1);
  }

  // void jsonread() async {
  //   isLoading(true);
  //   await readSkillsJson();
  //   await readLocationJson();
  //   isLoading(false);
  // }

  Future<void> defaultJobTypeSelection(value) async {
    var previousData = myJobData;
    if (value == 1) {
      previousData.value.job!.jobType = "full time";
    } else if (value == 2) {
      previousData.value.job!.jobType = "part time";
    } else if (value == 3) {
      previousData.value.job!.jobType = "freelancer";
    }
    myJobData(previousData.value);
    print(previousData.value.job!.jobType);
  }

  Future<void> fetchPostedJobsData() async {
    var z = await ApiServiceRecruiter.fetchMyJobs();
    if (z != null) {
      jobData.value = z;
    }
  }

  Future<void> fetchEditJobsData(String id) async {
    var z = await ApiServiceRecruiter.fetchEditJobData(id);
    if (z != null) {
      myJobData.value = z;
    }
  }

  void fetchData(String id) async {
    isLoading(true);
    await fetchEditJobsData(id);
    await fetchPostedJobsData();
    // await defaultJobTypeSelection(value);
    await readSkillsJson();
    await readLocationJson();
    isLoading(false);
  }
}

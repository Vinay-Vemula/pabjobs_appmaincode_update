import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddEducationDetailsController extends GetxController {
  var isLoading = true.obs;
  var courseData = [].obs;
  var specializationData = [].obs;

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

  void fetchData() async {
    isLoading(true);
    await readCourseJson();
    await readSpecialisationJson();
    isLoading(false);
  }
}

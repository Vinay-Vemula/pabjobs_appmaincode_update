import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddProfileDetailsController extends GetxController {
  var location = [].obs;
  var skills = [].obs;
  var isLoading = true.obs;

  Future<void> readLocationJson() async {
    final String response =
        await rootBundle.loadString('assets/json/locations.json');
    final data = await json.decode(response);
    location(data);
  }

  Future<void> readSkillsJson() async {
    final String response =
        await rootBundle.loadString('assets/json/Skill.json');
    final data1 = await json.decode(response);
    skills(data1);
  }

  void fetchData() async {
    isLoading(true);
    await readLocationJson();
    await readSkillsJson();
    isLoading(false);
  }
}

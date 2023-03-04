import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PostJobController extends GetxController {
  var isLoading = true.obs;
  var skilldata = [].obs;
  var locationData = [].obs;

  Future<void> readLocationJson() async {
    final String response =
        await rootBundle.loadString('assets/json/locations.json');
    final data = await json.decode(response);
    locationData(data);
  }

  Future<void> readSkillsJson() async {
    final String response =
        await rootBundle.loadString('assets/json/Skill.json');
    final data1 = await json.decode(response);
    skilldata(data1);
  }

  void jsonread() async {
    isLoading(true);
    await readSkillsJson();
    await readLocationJson();
    isLoading(false);
  }
}

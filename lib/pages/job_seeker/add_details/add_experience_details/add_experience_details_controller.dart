import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddExperienceDetailsController extends GetxController {
  var isLoading = true.obs;

  var designation = [].obs;
  Future<void> readDesignationJson() async {
    final String response =
        await rootBundle.loadString('assets/json/Designation.json');
    final data = await json.decode(response);
    designation(data);
  }

  var category = [].obs;
  Future<void> readCategoryJson() async {
    final String response =
        await rootBundle.loadString('assets/json/Category.json');
    final data1 = await json.decode(response);
    category(data1);
  }

  void fetchData() async {
    isLoading(true);
    await readDesignationJson();
    await readCategoryJson();
    isLoading(false);
  }
}

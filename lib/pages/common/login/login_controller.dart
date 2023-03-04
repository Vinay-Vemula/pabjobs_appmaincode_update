import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service.dart';

class PhoneNumberController extends GetxController {
  var phNo = "".obs;

  Future<bool> login(String phoneNumber) async {
    phNo(phoneNumber);
    return await APIService.phoneVerification(
      phoneNumber,
      (x) {
        Get.snackbar("Error", "Your Number is not registered. Please register",
            backgroundColor: Colors.white);
      },
    );
  }
}

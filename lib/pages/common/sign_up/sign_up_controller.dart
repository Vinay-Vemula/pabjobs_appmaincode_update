// ignore_for_file: unused_local_variable

import 'package:get/get.dart';

import 'package:pabjobs/entities/api_service.dart';

class SignUpController extends GetxController {
  Future<bool> signUp(String name, String contactNumber, String email,
      String type, String password) async {
    bool result =
        await APIService.signUp(name, contactNumber, email, type, password);
    return true;
  }
}

import 'package:get/get.dart';

import 'package:pabjobs/entities/api_service.dart';

class OTPController extends GetxController {
  var otp = "".obs;

  Future<bool> checkOtp(String phoneNo) async {
    if (otp.isBlank! || otp.isEmpty || otp.value.length != 6) {
      // ignore: todo
      // TODO: Show Popup with some message like otp is empty.
      return false;
    }
    bool correctOTP = await APIService.checkOTP(phoneNo, otp.value, (err) {
      // ignore: todo
      // TODO: Show Error Message
    });

    return correctOTP;
  }

  setOtp(String oTP) => otp(oTP);
}

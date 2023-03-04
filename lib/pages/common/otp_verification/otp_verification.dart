// ignore_for_file: unused_local_variable, await_only_futures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pabjobs/pages/job_seeker/common/reusable_scaffold.dart';
import 'package:pabjobs/pages/recruiter/common/reusable_scaffold.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:pabjobs/pages/common/login/login_controller.dart';
import 'package:pabjobs/pages/common/otp_verification/otp_controller.dart';
import 'package:pabjobs/theme/text_theme.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/common/constant.dart';

class OtpVerification extends StatefulWidget {
  final String phoneNumber;

  const OtpVerification({Key? key, required this.phoneNumber})
      : super(key: key);
  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  static Box<String> userInfo = Hive.box<String>(Constant.dbName);
  late TextEditingController _phoneNumberController;

  final OTPController otpController = Get.put(OTPController());
  final PhoneNumberController phoneNumberController =
      Get.put(PhoneNumberController());

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PABColorTheme.backgrndColor,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 120),
            Text(
              "Enter your\nVerification code",
              style: PABTextTheme.headline1
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              "Enter code send to your mobile number,",
              style: PABTextTheme.headline2.copyWith(color: Colors.white54),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "If not received  ",
                  style: PABTextTheme.headline2.copyWith(color: Colors.white54),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () async {
                    await phoneNumberController.login(widget.phoneNumber);
                  },
                  child: Text(
                    "Resend",
                    style: PABTextTheme.headline2.copyWith(
                        color: Colors.white70, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(height: 28),
            PinCodeTextField(
              appContext: context,
              pastedTextStyle: PABTextTheme.content.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              pinTheme: PinTheme(
                  activeColor: Colors.white,
                  selectedColor: Colors.white,
                  inactiveColor: Colors.white38,
                  disabledColor: Colors.red),
              length: 6,
              obscureText: false,
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              validator: (v) => null,
              cursorColor: Colors.white,
              animationDuration: const Duration(milliseconds: 300),
              textStyle: PABTextTheme.content.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 24,
              ),
              keyboardType: TextInputType.number,
              onCompleted: (v) => otpController.setOtp(v),
              onChanged: (value) {},
              beforeTextPaste: (text) {
                return true;
              },
            ),
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: TextButton(
                      child: Text(
                        'Verify OTP',
                        style:
                            PABTextTheme.content.copyWith(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 31),
                        primary: Colors.white,
                        backgroundColor: PABColorTheme.primaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(31)),
                        ),
                      ),
                      onPressed: () async {
                        bool isCorrect =
                            await otpController.checkOtp(widget.phoneNumber);

                        String? type = await userInfo.get('type');

                        if (type == "applicant") {
                          Get.offAll(() => const ReusableScaffold());
                        }
                        if (type == "recruiter") {
                          Get.offAll(() => const RecruiterReusableScaffold());
                        }
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

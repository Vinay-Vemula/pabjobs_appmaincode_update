import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pabjobs/common/constant.dart';

import 'package:pabjobs/pages/common/login/login_controller.dart';
import 'package:pabjobs/pages/common/login/login_with_email.dart';
import 'package:pabjobs/pages/common/otp_verification/otp_verification.dart';
import 'package:pabjobs/pages/common/sign_up/select_user_type.dart';
import 'package:pabjobs/pages/job_seeker/megajobfair/mega_job_fair.dart';
import 'package:pabjobs/pages/job_seeker/megajobfair/mega_job_fair1.dart';
import 'package:pabjobs/theme/text_theme.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController textController = TextEditingController();
  final PhoneNumberController phoneNumberController =
      Get.put(PhoneNumberController());

  static Box<String> userInfo = Hive.box<String>(Constant.dbName);

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Resume cannot found",
          backgroundColor: Colors.white);
    }
  }

  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: Get.height,
            width: Get.width,
            color: PABColorTheme.backgrndColor,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                // InkWell(
                //   onTap: () {
                //     String? fileSrc = userInfo.get('fileSrc');
                //     if (fileSrc == null) {
                //       Get.to(() => JobFair1());
                //     } else {
                //       _launchUrl(
                //           "https://pabsolution-bucket-1.s3-ap-south-1.amazonaws.com/" +
                //               fileSrc);
                //     }
                //   },
                //   child: Container(
                //     width: Get.width,
                //     child: Image.asset("assets/images/megajobfair-banner.png"),
                //   ),
                // ),
                const SizedBox(height: 30),
                Text(
                  "Enter   your \nMobile  Number",
                  style: PABTextTheme.headline1.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  "We will send one time password \nto this mobile number",
                  style: PABTextTheme.headline2.copyWith(color: Colors.white54),
                ),
                const SizedBox(height: 28),
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: textController,
                  style: PABTextTheme.content.copyWith(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 17),
                      // filled: true,
                      // fillColor: PABColorTheme.backgrndColor,
                      labelStyle:
                          PABTextTheme.content.copyWith(color: Colors.white),
                      hintText: "Mobile Number",
                      hintStyle:
                          PABTextTheme.content.copyWith(color: Colors.white)),
                ),
                const SizedBox(height: 24),
                TextButton(
                    child: Text(
                      'Login using your email',
                      style: PABTextTheme.content.copyWith(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: Colors.white,
                      backgroundColor: PABColorTheme.backgrndColor,
                    ),
                    onPressed: () {
                      Get.off(() => const LoginWithEmail());
                    }),
                const Spacer(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: TextButton(
                          child: Text(
                            'Create Account',
                            style: PABTextTheme.content
                                .copyWith(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: PABColorTheme.backgrndColor,
                          ),
                          onPressed: () {
                            Get.to(() => const SelectUserType());
                          }),
                    ),
                    const Spacer(),
                    Container(
                      width: 150,
                      padding: const EdgeInsets.only(bottom: 35),
                      child: TextButton(
                          child: _isLoading
                              ? Container(
                                  width: 22,
                                  height: 22,
                                  padding: const EdgeInsets.all(2.0),
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  'Get OTP',
                                  style: PABTextTheme.content
                                      .copyWith(color: Colors.white),
                                ),
                          style: TextButton.styleFrom(
                            padding: _isLoading
                                ? const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 31)
                                : const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 31),
                            primary: Colors.white,
                            backgroundColor: PABColorTheme.primaryColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(31)),
                            ),
                          ),
                          onPressed: () async {
                            if (!_isLoading) {
                              if (textController.value.text != "") {
                                setState(() => _isLoading = true);
                                bool x = await phoneNumberController
                                    .login(textController.text);
                                if (x) {
                                  setState(() => _isLoading = false);
                                  Get.to(
                                    () => OtpVerification(
                                        phoneNumber: textController.text),
                                  );
                                }
                                setState(() => _isLoading = false);
                              } else {
                                Get.snackbar(
                                    "Incomplete", "Please Enter Phone Number",
                                    backgroundColor: Colors.white);
                              }
                            } else {
                              null;
                            }
                          }),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}

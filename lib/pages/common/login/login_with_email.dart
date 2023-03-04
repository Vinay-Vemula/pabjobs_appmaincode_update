import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pabjobs/common/textfield.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/pages/common/login/forgot_password.dart';
import 'package:pabjobs/pages/common/login/login.dart';

import 'package:pabjobs/pages/common/login/login_controller.dart';

import 'package:pabjobs/pages/common/sign_up/select_user_type.dart';
import 'package:pabjobs/pages/job_seeker/common/reusable_scaffold.dart';
import 'package:pabjobs/pages/recruiter/common/reusable_scaffold.dart';

import 'package:pabjobs/theme/text_theme.dart';
import 'package:pabjobs/theme/color_theme.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final PhoneNumberController phoneNumberController =
      Get.put(PhoneNumberController());

  bool _passwordVisible = false;

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
                const SizedBox(height: 120),
                Text(
                  "Enter your\nEmail & Password",
                  style: PABTextTheme.headline1.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  "and just check for new job oppurtunities",
                  style: PABTextTheme.headline2.copyWith(color: Colors.white54),
                ),
                const SizedBox(height: 28),
                Textfield(
                  controller: emailController,
                  hintText: "Email",
                  textInputType: TextInputType.text,
                  obscure: false,
                  Icon: const SizedBox(),
                ),
                const SizedBox(height: 24),
                Textfield(
                  controller: passController,
                  hintText: 'Password',
                  textInputType: TextInputType.text,
                  obscure: !_passwordVisible,
                  Icon: IconButton(
                      icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white38),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      }),
                ),
                const SizedBox(height: 4),
                TextButton(
                    child: Text(
                      'Forgot Password ?',
                      style: PABTextTheme.content
                          .copyWith(color: const Color(0xffC53145)),
                    ),
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      primary: Colors.white,
                      backgroundColor: PABColorTheme.backgrndColor,
                    ),
                    onPressed: () {
                      Get.to(() => const ForgotPassword());
                    }),
                const SizedBox(height: 36),
                TextButton(
                    child: Text(
                      'Login using your mobile number',
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
                      Get.off(() => const Login());
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: TextButton(
                          child: Text(
                            'Login',
                            style: PABTextTheme.content.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 31),
                            primary: Colors.white,
                            backgroundColor: PABColorTheme.primaryColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(31)),
                            ),
                          ),
                          onPressed: () async {
                            if (emailController.value.text != "" ||
                                passController.value.text != "") {
                              var response = APIService.login(
                                email: emailController.value.text,
                                password: passController.value.text,
                              );

                              if (await response == "applicant") {
                                Get.offAll(const ReusableScaffold());
                              } else if (await response == "recruiter") {
                                Get.offAll(const RecruiterReusableScaffold());
                              }
                            } else {
                              Get.snackbar(
                                  "Incomplete", "Fill all fields to complete",
                                  backgroundColor: Colors.white);
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

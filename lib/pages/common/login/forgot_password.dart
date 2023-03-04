import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pabjobs/common/textfield.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController phoneController = TextEditingController();

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
                        "Forgot\nPassword ?",
                        style: PABTextTheme.headline1.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Enter Your Mobile Number below, We will send new\npassword to this mobile number",
                        style: PABTextTheme.headline2
                            .copyWith(color: Colors.white54),
                      ),
                      const SizedBox(height: 28),
                      Textfield(
                        controller: phoneController,
                        hintText: "Mobile Number",
                        textInputType: TextInputType.number,
                        obscure: false,
                        Icon: const SizedBox(),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 35),
                            child: TextButton(
                                child: Text(
                                  'Login using\nyour email',
                                  style: PABTextTheme.content
                                      .copyWith(color: Colors.white),
                                ),
                                style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: PABColorTheme.backgrndColor,
                                ),
                                onPressed: () {
                                  Get.back();
                                }),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 35),
                            child: TextButton(
                                child: Text(
                                  'Change Password',
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
                                  if (phoneController.text != "") {
                                    APIService.forgotPassword(
                                        phoneController.text);
                                    Get.back();
                                  } else {
                                    Get.snackbar("Incomplete",
                                        "Fill all fields to complete",
                                        backgroundColor: Colors.white);
                                  }
                                }),
                          )
                        ],
                      )
                    ]))));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';
import 'package:validation_textformfield/validation_textformfield.dart';

class RecruiterChangePassword extends StatefulWidget {
  const RecruiterChangePassword({Key? key}) : super(key: key);

  @override
  State<RecruiterChangePassword> createState() =>
      _RecruiterChangePasswordState();
}

class _RecruiterChangePasswordState extends State<RecruiterChangePassword> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _isObscure = true;

    return Scaffold(
        body: Container(
            color: Color(0xffF5F5F5),
            height: Get.height,
            width: Get.width,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const SizedBox(height: 62),
                      Container(
                          child: Row(children: [
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back_ios,
                                color: Colors.black)),
                        const SizedBox(width: 25),
                        Text(
                          "Change Password",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ])),
                      const SizedBox(height: 40),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: textController,
                        obscureText: true,
                        style:
                            PABTextTheme.content.copyWith(color: Colors.black),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 17, vertical: 17),
                            labelStyle: PABTextTheme.content
                                .copyWith(color: Colors.black),
                            suffixIconColor: Colors.black,
                            hintText: "Old Password",
                            hintStyle: PABTextTheme.content
                                .copyWith(color: Colors.black)),
                      ),
                      const SizedBox(height: 14),
                      PassWordValidationTextFiled(
                        style:
                            PABTextTheme.content.copyWith(color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          labelStyle: PABTextTheme.content
                              .copyWith(color: Colors.black),
                          hintText: "New Password",
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black),
                        ),
                        lineIndicator: false,
                        hasPasswordEmpty: "Password is Empty",
                        passwordMaxError: "Password to long",
                        passWordUpperCaseError:
                            "at least one Uppercase (Capital)letter",
                        passWordDigitsCaseError: "at least one digit",
                        passwordLowercaseError:
                            "at least one lowercase character",
                        passWordSpecialCharacters:
                            "at least one Special Characters",
                        obscureText: _isObscure,
                        scrollPadding: EdgeInsets.only(left: 60),
                        onChanged: (value) {
                          // print(value);
                        },
                        passTextEditingController: passwordController,
                        keyboardType: TextInputType.text,
                        passwordMaxLength: 10,
                        passwordMinLength: 5,
                      ),
                      const SizedBox(height: 14),
                      ConfirmPassWordValidationTextFromField(
                        style:
                            PABTextTheme.content.copyWith(color: Colors.black),
                        passtextEditingController: passwordController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            counterText: '',
                            labelStyle: PABTextTheme.content
                                .copyWith(color: Colors.black),
                            hintText: "Confirm Password",
                            hintStyle: PABTextTheme.content
                                .copyWith(color: Colors.black)),
                        obscureText: _isObscure,
                        scrollPadding: const EdgeInsets.only(left: 60),
                        onChanged: (value) {
                          // print(value);
                        },
                        whenTextFieldEmpty: "Empty",
                        validatorMassage: "Password not Match",
                        confirmtextEditingController: confpasswordController,
                      ),
                      const SizedBox(height: 28),
                      Container(
                        padding: const EdgeInsets.only(bottom: 32),
                        width: Get.width,
                        child: TextButton(
                            child: Text(
                              'Change Password',
                              style: PABTextTheme.content
                                  .copyWith(color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 31),
                              primary: Colors.white,
                              backgroundColor: PABColorTheme.primaryColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(31)),
                              ),
                            ),
                            onPressed: () async {
                              if (textController.value.text != "" &&
                                  confpasswordController.value.text != "" &&
                                  passwordController.value.text ==
                                      confpasswordController.value.text) {
                                // APIService.changePassword(
                                //     textController.value.text,
                                //     confpasswordController.value.text);
                                Get.back();
                              } else {
                                if (confpasswordController.value.text != "" &&
                                    passwordController.value.text != "" &&
                                    passwordController.value.text !=
                                        confpasswordController.value.text) {
                                  Get.snackbar(
                                      "Incorrect Password", "Please try again",
                                      backgroundColor: Colors.white);
                                } else {
                                  Get.snackbar("Incomplete",
                                      "Fill all feilds to proceed",
                                      backgroundColor: Colors.white);
                                }
                              }
                            }),
                      ),
                    ])))));
  }
}

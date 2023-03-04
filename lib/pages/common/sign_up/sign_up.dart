import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pabjobs/common/constant.dart';
import 'package:pabjobs/pages/common/privacy_policies.dart';
import 'package:pabjobs/pages/common/terms_and_conditons.dart';
import 'package:pabjobs/pages/job_seeker/add_details/add_profile_details/add_profile_details.dart';
import 'package:pabjobs/pages/recruiter/common/reusable_scaffold.dart';
import 'package:validation_textformfield/validation_textformfield.dart';

import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';
import 'package:pabjobs/common/textfield.dart';
import 'package:pabjobs/pages/common/sign_up/sign_up_controller.dart';

class SignUp extends StatefulWidget {
  final String userType;
  const SignUp({Key? key, required this.userType}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static Box<String> userInfo = Hive.box<String>(Constant.dbName);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confpasswordController = TextEditingController();

  final SignUpController controller = Get.put(SignUpController());

  bool _passwordVisible = false;
  bool _passwordVisible1 = false;

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  String? validateMobile(String? value) {
    String pattern = r'^[6-9][0-9]{9}$';
    RegExp regExp = RegExp(pattern);
    if (value!.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
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
              const SizedBox(height: 124),
              Text(
                "Okay, Lets get\nstarted",
                style: PABTextTheme.headline1
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                "Join us, and get your dream job",
                style: PABTextTheme.headline2.copyWith(color: Colors.white54),
              ),
              const SizedBox(height: 32),
              Textfield(
                controller: nameController,
                hintText:
                    widget.userType == "applicant" ? "Name" : "Company Name",
                textInputType: TextInputType.text,
                obscure: false,
                Icon: const SizedBox(),
              ),
              const SizedBox(height: 14),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                showCursor: true,
                readOnly: false,
                autocorrect: true,
                cursorWidth: 2,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white)),
                    labelStyle: PABTextTheme.content.copyWith(
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                    hintText: "Phone Number",
                    hintStyle:
                        PABTextTheme.content.copyWith(color: Colors.white38)),
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                validator: validateMobile,
                controller: phoneController,
              ),
              const SizedBox(height: 14),
              EmailValidationTextField(
                cursorColor: Colors.white,
                onChanged: (val) {},
                whenTextFieldEmpty: "Please enter  email",
                validatorMassage: "Please enter valid email",
                keyboardType: TextInputType.text,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white)),
                    labelStyle: PABTextTheme.content.copyWith(
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                    hintText: "Email Address",
                    hintStyle:
                        PABTextTheme.content.copyWith(color: Colors.white38)),
                textEditingController: emailController,
              ),
              const SizedBox(height: 14),
              PassWordValidationTextFiled(
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white)),
                  labelStyle: PABTextTheme.content
                      .copyWith(color: const Color.fromRGBO(255, 255, 255, 1)),
                  hintText: "Password",
                  hintStyle:
                      PABTextTheme.content.copyWith(color: Colors.white38),
                  suffixIcon: IconButton(
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
                lineIndicator: false,
                hasPasswordEmpty: "Password is Empty",
                passwordMaxError: "Password to long",
                passWordUpperCaseError:
                    "at least one Uppercase (Capital)letter",
                passwordMinError: "at least eight digit",
                // passWordDigitsCaseError: "at least one digit",
                passwordLowercaseError: "at least one lowercase character",
                passWordSpecialCharacters: "at least one Special Characters",
                obscureText: !_passwordVisible,
                scrollPadding: const EdgeInsets.only(left: 60),
                onChanged: (value) {
                  // print(value);
                },
                passTextEditingController: passwordController,
                keyboardType: TextInputType.text,
                passwordMinLength: 8,
                passwordMaxLength: 20,
              ),
              const SizedBox(height: 14),
              ConfirmPassWordValidationTextFromField(
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                passtextEditingController: passwordController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.white)),
                  counterText: '',
                  labelStyle: PABTextTheme.content
                      .copyWith(color: const Color.fromRGBO(255, 255, 255, 1)),
                  hintText: "Confirm Password",
                  hintStyle:
                      PABTextTheme.content.copyWith(color: Colors.white38),
                  suffixIcon: IconButton(
                      icon: Icon(
                          _passwordVisible1
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white38),
                      onPressed: () {
                        setState(() {
                          _passwordVisible1 = !_passwordVisible1;
                        });
                      }),
                ),
                obscureText: !_passwordVisible1,
                scrollPadding: const EdgeInsets.only(left: 60),
                onChanged: (value) {},
                whenTextFieldEmpty: "Empty",
                validatorMassage: "Password not Match",
                confirmtextEditingController: confpasswordController,
              ),
              const SizedBox(height: 14),
              RichText(
                text: TextSpan(children: <InlineSpan>[
                  TextSpan(
                      text: 'By signing up, you agree to our ',
                      style: PABTextTheme.headline2.copyWith(
                          color: Colors.white, fontWeight: FontWeight.normal)),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => const TermsAndConditons());
                        },
                      text: 'Terms and Conditions',
                      style: PABTextTheme.headline2.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      )),
                  TextSpan(
                      text: ' & ',
                      style: PABTextTheme.headline2.copyWith(
                          color: Colors.white, fontWeight: FontWeight.normal)),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => const PrivacyPolicies());
                        },
                      text: 'Privacy Policies',
                      style: PABTextTheme.headline2.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      )),
                ]),
              ),
              // Text(
              //   "You agree to Terms and Condtions & Privacy Policies by Signing Up",
              //   style: PABTextTheme.headline2.copyWith(color: Colors.white),
              // ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(bottom: 32),
                width: Get.width,
                child: TextButton(
                    child: Text(
                      'Register Now',
                      style: PABTextTheme.content.copyWith(color: Colors.white),
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
                      if (nameController.value.text != "" &&
                          phoneController.value.text != "" &&
                          emailController.value.text != "" &&
                          widget.userType != "" &&
                          confpasswordController.value.text != "" &&
                          passwordController.value.text ==
                              confpasswordController.value.text) {
                        if (validateStructure(
                            confpasswordController.value.text)) {
                          bool isCorrect = await controller.signUp(
                              nameController.text,
                              phoneController.text,
                              emailController.text,
                              widget.userType,
                              confpasswordController.text);

                          if (isCorrect) {
                            String? type = userInfo.get('type');
                            if (type == "applicant") {
                              Get.offAll(() => const AddProfileDetails(),
                                  arguments: [
                                    nameController.text,
                                    emailController.text,
                                    phoneController.text
                                  ]);
                            }
                            if (type == "recruiter") {
                              Get.offAll(
                                  () => const RecruiterReusableScaffold());
                            }
                          }
                        } else {
                          Get.snackbar("Error", "Please Enter Valid Password",
                              backgroundColor: Colors.white);
                        }
                      } else {
                        if (confpasswordController.value.text != "" &&
                            passwordController.value.text != "" &&
                            passwordController.value.text !=
                                confpasswordController.value.text) {
                          Get.snackbar("Incorrect Password", "Please try again",
                              backgroundColor: Colors.white);
                        } else {
                          Get.snackbar(
                              "Incomplete", "Fill all feilds to proceed",
                              backgroundColor: Colors.white);
                        }
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

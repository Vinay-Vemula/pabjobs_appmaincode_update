import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pabjobs/common/constant.dart';

import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/pages/job_seeker/homepage/homepage_controller.dart';
import 'package:pabjobs/pages/job_seeker/megajobfair/job_fair_controller.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class JobFair1 extends StatefulWidget {
  JobFair1({Key? key}) : super(key: key);
  @override
  State<JobFair1> createState() => _JobFair1State();
}

class _JobFair1State extends State<JobFair1> {
  JobFairController controller = Get.put(JobFairController());
  HomepageController homecontroller = Get.put(HomepageController());

  final TextEditingController textController = TextEditingController();
  final TextEditingController text1Controller = TextEditingController();
  final TextEditingController text2Controller = TextEditingController();

  static Box<String> userInfo = Hive.box<String>(Constant.dbName);

  var _isLoading = false;

  void _onSubmit() {
    setState(() => _isLoading = true);
    Future.delayed(
      const Duration(seconds: 2),
      () => setState(() => _isLoading = false),
    );
  }

  @override
  void initState() {
    super.initState();
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

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Resume cannot found",
          backgroundColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: const Color(0xffF5F5F5),
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
                          "Mega Job Fair - Apply for Hall Ticket",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ])),
                      const SizedBox(height: 40),
                      Text(
                        "Name",
                        textAlign: TextAlign.left,
                        style: PABTextTheme.headline1.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 9),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: textController,
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
                            hintText: "Enter Your Name",
                            hintStyle: PABTextTheme.content.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Phone Number",
                        textAlign: TextAlign.left,
                        style: PABTextTheme.headline1.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 9),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        showCursor: true,
                        readOnly: false,
                        autocorrect: true,
                        cursorWidth: 2,
                        cursorColor: Colors.black,
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
                            labelStyle: PABTextTheme.content.copyWith(
                                color: const Color.fromRGBO(255, 255, 255, 1)),
                            hintText: "Enter Your Phone Number",
                            hintStyle: PABTextTheme.content
                                .copyWith(color: Colors.black)),
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,
                        validator: validateMobile,
                        controller: text1Controller,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Higher Education",
                        style: PABTextTheme.headline1
                            .copyWith(fontSize: 12, color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        maxLines: 2,
                        keyboardType: TextInputType.multiline,
                        controller: text2Controller,
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
                            hintText: "Please Enter your Higher Education",
                            hintStyle: PABTextTheme.content.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                      ),
                      const SizedBox(height: 28),
                      Container(
                        padding: const EdgeInsets.only(bottom: 32),
                        width: Get.width,
                        child: TextButton(
                            child: _isLoading
                                ? Container(
                                    width: 24,
                                    height: 24,
                                    padding: const EdgeInsets.all(2.0),
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                  )
                                : Text(
                                    'Continue',
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
                              if (!_isLoading) {
                                if (textController.text != "" &&
                                    text1Controller.text != "" &&
                                    text2Controller.text != "") {
                                  setState(() => _isLoading = true);
                                  final x =
                                      await APIService.megaJobFairNotLogged(
                                          textController.text,
                                          text1Controller.text,
                                          text2Controller.text);
                                  if (x) {
                                    String? fileSrc = userInfo.get('fileSrc');
                                    _launchUrl(
                                        "https://pabsolution-bucket-1.s3-ap-south-1.amazonaws.com/" +
                                            fileSrc!);
                                  }
                                  setState(() => _isLoading = false);
                                  Get.back();
                                } else {
                                  Get.snackbar("Incomplete",
                                      "Fill all fields to complete",
                                      backgroundColor: Colors.white);
                                }
                              } else {
                                null;
                              }
                            }),
                      ),
                    ])))));
  }
}

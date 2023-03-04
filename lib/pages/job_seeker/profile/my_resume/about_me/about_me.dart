import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/about_me/about_me_controller.dart';
import 'package:pabjobs/common/custom_searchable_dropdown.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class ScreenA extends StatefulWidget {
  const ScreenA({
    Key? key,
  }) : super(key: key);
  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  AboutMeController controller = Get.put(AboutMeController());

  String? fileName = "";

  final TextEditingController textController = TextEditingController();
  final TextEditingController text1Controller = TextEditingController();

  List? _mySkillsSelection;
  List? mySkillsSelectedList = [];

  String? imageFile;
  String? _picked_file_extension;
  File? _picked_file;

  _getFile() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (pickedFile != null) {
      setState(() {
        _picked_file_extension = pickedFile.files.single.extension;
        _picked_file = File(pickedFile.files.single.path!);
        fileName = _picked_file!.path.split('/').last;
      });
    }
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
  void initState() {
    super.initState();
    setState(() {
      controller.jsonread();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Container(
          color: PABColorTheme.backgrndColor,
          height: Get.height,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.white,
            ),
          ),
        );
      } else {
        return SingleChildScrollView(
          child: Container(
            color: Color(0xffF5F5F5),
            height: Get.height * 0.75,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 24),
              Text(
                "Upload Resume",
                textAlign: TextAlign.left,
                style: PABTextTheme.headline1.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 7),
              // (controller.data.value.resume!.url == null)
              //     ?
              InkWell(
                onTap: () {
                  _getFile();
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 23.0),
                  child: Row(
                    children: [
                      (controller.data.value.resume!.filename! != "")
                          ? (fileName != "")
                              ? SizedBox(
                                  width: Get.width * 0.6,
                                  child: Text(
                                    fileName!,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: PABTextTheme.headline1.copyWith(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                )
                              : SizedBox(
                                  width: Get.width * 0.6,
                                  child: Text(
                                    controller.data.value.resume!.filename!,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: PABTextTheme.headline1.copyWith(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                )
                          : (fileName != "")
                              ? Text(
                                  fileName!,
                                  textAlign: TextAlign.left,
                                  style: PABTextTheme.headline1.copyWith(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                )
                              : Text(
                                  "Click here to upload",
                                  textAlign: TextAlign.left,
                                  style: PABTextTheme.headline1.copyWith(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                      const Spacer(),
                      (controller.data.value.resume!.filename! == "")
                          ? const SizedBox()
                          : InkWell(
                              onTap: () {
                                _launchUrl(controller.data.value.resume!.url!);
                              },
                              child: SvgPicture.asset(
                                  'assets/images/Download.svg',
                                  color: Colors.black),
                            ),
                    ],
                  ),
                ),
              ),

              // InkWell(
              //     onTap: () {
              //       _getFromGallery();
              //     },
              //     child: Container(
              //       width: double.infinity,
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 18.0, vertical: 23.0),
              //       child: Text(
              //         imageFile.toString(),
              //         textAlign: TextAlign.left,
              //         style: PABTextTheme.headline1.copyWith(
              //             fontSize: 12,
              //             color: Colors.black,
              //             fontWeight: FontWeight.normal),
              //       ),
              //     ),
              //   ),
              const SizedBox(height: 16),
              Text(
                "Resume Headline",
                textAlign: TextAlign.left,
                style: PABTextTheme.headline1.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 7),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                controller: textController,
                style: PABTextTheme.content.copyWith(color: Colors.black),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 17),
                    labelStyle:
                        PABTextTheme.content.copyWith(color: Colors.black),
                    suffixIconColor: Colors.black,
                    hintText: (controller.data.value.resumeHeadline != "")
                        ? controller.data.value.resumeHeadline
                        : "Enter Headline",
                    hintStyle: PABTextTheme.content.copyWith(
                        color: Colors.black, fontWeight: FontWeight.normal)),
              ),
              const SizedBox(height: 16),
              Text(
                "Profile Summary",
                textAlign: TextAlign.left,
                style: PABTextTheme.headline1.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 7),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                controller: text1Controller,
                style: PABTextTheme.content.copyWith(color: Colors.black),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.white)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 17),
                    labelStyle:
                        PABTextTheme.content.copyWith(color: Colors.black),
                    suffixIconColor: Colors.black,
                    hintText: (controller.data.value.profileSummary != "")
                        ? controller.data.value.profileSummary
                        : "Enter 2 to 3 lines",
                    hintStyle: PABTextTheme.content.copyWith(
                        color: Colors.black, fontWeight: FontWeight.normal)),
              ),
              const SizedBox(height: 16),
              Text(
                "Key Skills",
                textAlign: TextAlign.left,
                style: PABTextTheme.headline1.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 7),
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.only(left: 17.0, right: 17.0),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       border: Border.all(color: Colors.white)),
              //   child: DropdownButton(
              //     items: controller.data3_.map((item) {
              //       return DropdownMenuItem(
              //         child: Text(item['Skill'],
              //             style: PABTextTheme.content
              //                 .copyWith(color: Colors.black)),
              //         value: item['Skill'].toString(),
              //       );
              //     }).toList(),
              //     onChanged: (newVal) {
              //       setState(() {
              //         _mySkillsSelection = newVal as String;
              //       });
              //     },
              //     value: _mySkillsSelection,
              //     icon: const Icon(Icons.arrow_drop_down),
              //     dropdownColor: Colors.white,
              //     underline: const SizedBox(),
              //     isExpanded: true,
              //     hint: (controller.data.value.skills == [])
              //         ? Text('Skills',
              //             style: PABTextTheme.content
              //                 .copyWith(color: Colors.black))
              //         : Text(controller.data.value.skills[0].toString(),
              //             style: PABTextTheme.content
              //                 .copyWith(color: Colors.black)),
              //   ),
              // ),
              CustomSearchableDropDown(
                items: controller.data3_,
                backgroundColor: Colors.white,
                label: (controller.data.value.skills!.isEmpty)
                    ? 'Select Key Skills'
                    : controller.data.value.skills
                        .toString()
                        .replaceAll(RegExp(r'[^\w\s]+'), '  '),
                multiSelectTag: 'Skills',
                multiSelectValuesAsWidget: true,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                multiSelect: true,
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(Icons.search),
                ),
                dropDownMenuItems: controller.data3_.map((item) {
                  return item['Skill'];
                }).toList(),
                onChanged: (value) {
                  // print(value.toString());
                  if (value != null) {
                    _mySkillsSelection = jsonDecode(value);
                    print(_mySkillsSelection);
                    mySkillsSelectedList = _mySkillsSelection!.map((item) {
                      return item['Skill'];
                    }).toList();
                    print(mySkillsSelectedList);
                  } else {
                    _mySkillsSelection = [];
                  }
                },
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.only(bottom: 32),
                width: Get.width,
                child: TextButton(
                    child: Text(
                      'Save Changes',
                      style: PABTextTheme.content.copyWith(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 31),
                      primary: Colors.white,
                      backgroundColor: PABColorTheme.primaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(31)),
                      ),
                    ),
                    onPressed: () async {
                      if (fileName != "") {
                        (_picked_file_extension == "pdf" ||
                                _picked_file_extension == "doc" ||
                                _picked_file_extension == "docx")
                            ? controller.uploadImage(_picked_file!, fileName!)
                            : Get.snackbar(
                                "Error", "Image file cannot be uploaded",
                                backgroundColor: Colors.white);
                      }
                      APIService.addAboutMeDetails(
                          (textController.text == "")
                              ? controller.data.value.resumeHeadline!
                              : textController.text,
                          (text1Controller.text == "")
                              ? controller.data.value.profileSummary!
                              : text1Controller.text,
                          (mySkillsSelectedList!.isEmpty)
                              ? controller.data.value.skills!
                              : mySkillsSelectedList!);
                    }),
              ),
            ]),
          ),
        );
      }
    });
  }
}

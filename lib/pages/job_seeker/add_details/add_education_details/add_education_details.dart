import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pabjobs/common/constant.dart';

import 'package:pabjobs/common/textfield.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/common/custom_searchable_dropdown.dart';
import 'package:pabjobs/pages/job_seeker/add_details/add_education_details/add_education_details_controller.dart';
import 'package:pabjobs/pages/job_seeker/common/reusable_scaffold.dart';
import 'package:pabjobs/pages/job_seeker/homepage/home_page_job_seeker_paginated.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

import '../../homepage/homepage.dart';

class AddEducationDetails extends StatefulWidget {
  const AddEducationDetails({Key? key}) : super(key: key);

  @override
  State<AddEducationDetails> createState() => _AddEducationDetailsState();
}

class _AddEducationDetailsState extends State<AddEducationDetails> {
  AddEducationDetailsController controller =
      Get.put(AddEducationDetailsController());

  static Box<String> userInfo = Hive.box<String>(Constant.dbName);

  final TextEditingController text4Controller = TextEditingController();
  final TextEditingController text6Controller = TextEditingController();
  final TextEditingController text7Controller = TextEditingController();

  String? _qualification;
  List<String> Qualification = [
    "SSC",
    "Intermediate",
    "Diploma",
    "Graduate",
    "Post Graduate"
  ];

  String? _courseSelection;

  String? _specializationSelection;

  String? courseType;
  int _value = 0;
  Widget CustomRadioButton(String _text, int _index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _value = _index;
          courseType = _text;
        });
      },
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Center(
          child: Text(
            _text,
            style: PABTextTheme.content.copyWith(
              color: (_value == _index) ? Colors.white : Colors.white,
            ),
          ),
        ),
      ),
      style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: (_value == _index)
              ? PABColorTheme.purpleGradientColor
              : Colors.transparent),
    );
  }

  @override
  void initState() {
    super.initState();
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PABColorTheme.backgrndColor,
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Stack(children: [
            SvgPicture.asset("assets/images/bg_primaryColor.svg",
                width: Get.width),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 92),
                    Text(
                      "Your Education\nDetails",
                      style: PABTextTheme.headline1.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Tell about your education qualification.",
                      style: PABTextTheme.headline2
                          .copyWith(color: Colors.white54),
                    ),
                    const SizedBox(height: 56),
                    Text(
                      "Highest Postgraduation",
                      style: PABTextTheme.headline1
                          .copyWith(fontSize: 12, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)),
                      child: DropdownButton(
                          items: Qualification.map((item) {
                            return DropdownMenuItem(
                              child: Text(item,
                                  style: PABTextTheme.content
                                      .copyWith(color: Colors.white)),
                              value: item.toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              _qualification = newVal as String;
                            });
                          },
                          value: _qualification,
                          icon: const Icon(Icons.arrow_drop_down),
                          dropdownColor: Colors.black,
                          underline: const SizedBox(),
                          isExpanded: true,
                          hint: Text('',
                              style: PABTextTheme.content
                                  .copyWith(color: Colors.white))),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Course",
                      style: PABTextTheme.headline1
                          .copyWith(fontSize: 12, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    CustomSearchableDropDown(
                      items: controller.courseData,
                      label: '',
                      labelStyle:
                          PABTextTheme.content.copyWith(color: Colors.white),
                      dropdownItemStyle:
                          PABTextTheme.content.copyWith(color: Colors.black),
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(Icons.search, color: Colors.grey),
                      ),
                      dropDownMenuItems: controller.courseData.map((item) {
                        return item['name'];
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          _courseSelection = value['name'].toString();
                          print(_courseSelection);
                        } else {
                          _courseSelection = null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Specialization",
                      style: PABTextTheme.headline1
                          .copyWith(fontSize: 12, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    CustomSearchableDropDown(
                      items: controller.specializationData,
                      label: '',
                      labelStyle:
                          PABTextTheme.content.copyWith(color: Colors.white),
                      dropdownItemStyle:
                          PABTextTheme.content.copyWith(color: Colors.black),
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(Icons.search, color: Colors.grey),
                      ),
                      dropDownMenuItems:
                          controller.specializationData.map((item) {
                        return item['name'];
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          _specializationSelection = value['name'].toString();
                        } else {
                          _specializationSelection = null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "University/Institute",
                      style: PABTextTheme.headline1
                          .copyWith(fontSize: 12, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Textfield(
                      controller: text4Controller,
                      hintText: "",
                      textInputType: TextInputType.text,
                      obscure: false,
                      Icon: const SizedBox(),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Course Type",
                      style: PABTextTheme.headline1
                          .copyWith(fontSize: 12, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Column(children: [
                      CustomRadioButton("Full Time", 1),
                      SizedBox(height: 12),
                      CustomRadioButton("Part Time", 2),
                      SizedBox(height: 12),
                      CustomRadioButton("Correspondence/Distance Learning", 3),
                    ]),
                    const SizedBox(height: 20),
                    Text(
                      "Passed Out Year",
                      style: PABTextTheme.headline1
                          .copyWith(fontSize: 12, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Textfield(
                      controller: text6Controller,
                      hintText: "",
                      textInputType: TextInputType.number,
                      obscure: false,
                      Icon: const SizedBox(),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Marks in Percentage or CGPA",
                      style: PABTextTheme.headline1
                          .copyWith(fontSize: 12, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Textfield(
                      controller: text7Controller,
                      hintText: "",
                      textInputType: TextInputType.number,
                      obscure: false,
                      Icon: const SizedBox(),
                    ),
                    const SizedBox(height: 28),
                    Container(
                      padding: const EdgeInsets.only(bottom: 12),
                      width: Get.width,
                      child: OutlinedButton(
                          child: Text(
                            'Skip',
                            style: PABTextTheme.content
                                .copyWith(color: Colors.white),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 2, color: PABColorTheme.primaryColor),
                            padding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 31),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(31)),
                            ),
                          ),
                          onPressed: () async {
                            String? type = userInfo.get('type');
                            if (type == "applicant") {
                              Get.offAll(() => const ReusableScaffold());
                            }
                            if (type == "recruiter") {
                              Get.offAll(
                                  () => const HomePageJobSeekerPaginated());
                            }
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 32),
                      width: Get.width,
                      child: TextButton(
                          child: Text(
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
                            if (_qualification != null &&
                                _courseSelection != null &&
                                _specializationSelection != null &&
                                text4Controller.text != "" &&
                                text6Controller.text != "" &&
                                text7Controller.text != "" &&
                                courseType != null) {
                              APIService.educationDetails(
                                  _qualification!,
                                  _courseSelection!,
                                  _specializationSelection!,
                                  text4Controller.text,
                                  courseType!,
                                  text6Controller.text,
                                  text7Controller.text, []);
                              Get.offAll(
                                () => const ReusableScaffold(),
                              );
                            }
                          }),
                    ),
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}

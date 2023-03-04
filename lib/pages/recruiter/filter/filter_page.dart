import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:pabjobs/common/checkbox_group.dart';
import 'package:pabjobs/common/filter_contents.dart';
import 'package:pabjobs/common/radio_button_group.dart';
import 'package:pabjobs/pages/recruiter/filter/filter_listing.dart';

import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class FilterPageR extends StatefulWidget {
  const FilterPageR({Key? key}) : super(key: key);

  @override
  State<FilterPageR> createState() => _FilterPageRState();
}

class _FilterPageRState extends State<FilterPageR> {
  // FilterPageRController controller = FilterPageRController();
  bool? isLoading = true;

  final TextEditingController textController = TextEditingController();

  String experiencechecked = "";

  List designationcheckedlist = [];
  List locationcheckedlist = [];
  List skillscheckedlist = [];

  List<String> designationList = [];
  List<String> locationList = [];
  List<String> skillsList = [];

  String selected = "";

  List<String> experience = [
    "0-2 Years",
    "2-5 Years",
    "5-10 Years",
    "10-15 Years",
    "15+ Years",
  ];

  @override
  void initState() {
    super.initState();

    setState(() {
      selected = "designation";
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading!) {
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
      return SafeArea(
        child: Scaffold(
            body: Container(
              width: Get.width,
              height: Get.height,
              color: const Color(0xffEBEBEB),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 20, color: Colors.white),
                    Container(
                      padding: const EdgeInsets.all(22),
                      color: Colors.white,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 25),
                          Text("Filter",
                              style: PABTextTheme.headline1.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: const Color(0xffEBEBEB),
                            width: Get.width * 0.40,
                            // height: Get.height - 93,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = "designation";
                                      });
                                      // filterList = designation;
                                    },
                                    child: Container(
                                      width: Get.width * 0.4,
                                      color: (selected == "designation")
                                          ? Colors.white
                                          : const Color(0xffF5F5F5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 13),
                                      child: Text("Designation",
                                          style: PABTextTheme.headline1
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = "skills";
                                      });
                                      // filterList = skills;
                                    },
                                    child: Container(
                                      width: Get.width * 0.4,
                                      color: (selected == "skills")
                                          ? Colors.white
                                          : const Color(0xffF5F5F5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 13),
                                      child: Text("Skills",
                                          style: PABTextTheme.headline1
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = "experience";
                                      });
                                    },
                                    child: Container(
                                      width: Get.width * 0.4,
                                      color: (selected == "experience")
                                          ? Colors.white
                                          : const Color(0xffF5F5F5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 13),
                                      child: Text("Experience",
                                          style: PABTextTheme.headline1
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12)),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selected = "location";
                                      });
                                    },
                                    child: Container(
                                      width: Get.width * 0.4,
                                      color: (selected == "location")
                                          ? Colors.white
                                          : const Color(0xffF5F5F5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 28, vertical: 13),
                                      child: Text("Location",
                                          style: PABTextTheme.headline1
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12)),
                                    ),
                                  ),
                                ]),
                          ),
                          Container(
                            child: (() {
                              if (selected == "experience") {
                                return Expanded(
                                  child: Container(
                                    color: Colors.white,
                                    width: Get.width * 0.58,
                                    height: Get.height - 93,
                                    child: RadioButtonGroup(
                                      labelStyle: PABTextTheme.content.copyWith(
                                          color: Colors.black, fontSize: 12),
                                      labels: experience,
                                      onChange: (String label2, int index2) =>
                                          print(
                                              "label: $label2 index: $index2"),
                                      onSelected: (String label2) =>
                                          experiencechecked = label2,
                                    ),
                                  ),
                                );
                              } else if (selected == "location") {
                                return Expanded(
                                  child: Container(
                                    color: Colors.white,
                                    width: Get.width * 0.58,
                                    // height: Get.height - 93,
                                    child: CheckboxGroup(
                                      labelStyle: PABTextTheme.content.copyWith(
                                          color: Colors.black, fontSize: 11),
                                      labels: FilterContents.location,
                                      onChange: (bool isChecked3, String label3,
                                              int index3) =>
                                          print(
                                              "isChecked: $isChecked3   label: $label3  index: $index3"),
                                      onSelected: (List checked3) =>
                                          locationcheckedlist = checked3,
                                      selectedList: locationList,
                                    ),
                                  ),
                                );
                              } else if (selected == "designation") {
                                return Expanded(
                                  child: Container(
                                    color: Colors.white,
                                    width: Get.width * 0.58,
                                    // height: Get.height - 93,
                                    child: CheckboxGroup(
                                      labelStyle: PABTextTheme.content.copyWith(
                                          color: Colors.black, fontSize: 11),
                                      labels: FilterContents.designation,
                                      onChange: (bool isChecked, String label,
                                              int index) =>
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index"),
                                      onSelected: (List checked) =>
                                          designationcheckedlist = checked,
                                      selectedList: designationList,
                                    ),
                                  ),
                                );
                              } else if (selected == "skills") {
                                return Expanded(
                                  child: Container(
                                    color: Colors.white,
                                    width: Get.width * 0.58,
                                    // height: Get.height - 93,
                                    child: CheckboxGroup(
                                      labelStyle: PABTextTheme.content.copyWith(
                                          color: Colors.black, fontSize: 11),
                                      labels: FilterContents.skills,
                                      onChange: (bool isChecked, String label,
                                              int index) =>
                                          print(
                                              "isChecked: $isChecked   label: $label  index: $index"),
                                      onSelected: (List checked) =>
                                          skillscheckedlist = checked,
                                      selectedList: skillsList,
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }()),
                          )
                        ]),
                    SizedBox(
                      height: 70,
                      child: Row(
                        children: [
                          Container(
                            width: Get.width * .4,
                          ),
                          Container(
                            width: Get.width * .6,
                            color: Colors.white,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Container(
              width: Get.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 58),
                    height: 30,
                    width: Get.width * 0.4,
                    child: InkWell(
                      onTap: () {
                        isLoading = true;
                        print(experiencechecked);
                        setState(() {
                          designationcheckedlist = [];
                          designationList = [];
                          skillscheckedlist = [];
                          skillsList = [];
                          experiencechecked = "";
                          locationcheckedlist = [];
                          locationList = [];
                        });
                        isLoading = false;
                      },
                      child: Text(
                        "Clear",
                        style: PABTextTheme.headline1.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    width: Get.width * 0.58,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const FilterListingR(), arguments: [
                          designationcheckedlist,
                          skillscheckedlist,
                          experiencechecked,
                          locationcheckedlist,
                        ]);
                      },
                      child: Container(
                        height: 48,
                        width: 202,
                        decoration: BoxDecoration(
                          color: PABColorTheme.primaryColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text("Apply Filter",
                              style: PABTextTheme.headline1.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      );
    }
  }
}

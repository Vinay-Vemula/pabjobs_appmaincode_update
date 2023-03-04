// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/common/custom_searchable_dropdown.dart';
import 'package:pabjobs/pages/job_seeker/add_details/add_experience_details/add_experience_details.dart';
import 'package:pabjobs/pages/job_seeker/add_details/add_profile_details/add_profile_details_controller.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class AddProfileDetails extends StatefulWidget {
  const AddProfileDetails({Key? key}) : super(key: key);

  @override
  State<AddProfileDetails> createState() => _AddProfileDetailsState();
}

class _AddProfileDetailsState extends State<AddProfileDetails> {
  AddProfileDetailsController controller =
      Get.put(AddProfileDetailsController());

  var UserDetails = Get.arguments;

  String? _myLocationSelection;
  List? _mySkillsSelection;
  List? mySkillsSelectedList = [];
  String? experience;

  String? _experienceyear;
  List experienceyear = [
    "0-2 Years",
    "2-5 Years",
    "5-7 Years",
    "7-10 Years",
    "10+ Years",
  ];
  // final AddDetailsController controller = Get.put(AddDetailsController());

  int _value = 0;
  Widget CustomRadioButton(String _text1, int _index) {
    return OutlinedButton(
        onPressed: () {
          setState(() {
            _value = _index;
            experience = _text1.toLowerCase();
          });
        },
        child: Container(
          width: Get.width * .33,
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Center(
            child: Text(
              _text1,
              style: PABTextTheme.content.copyWith(
                color: (_value == _index) ? Colors.white : Colors.white,
              ),
            ),
          ),
        ),
        style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(
              color: (_value == _index)
                  ? PABColorTheme.primaryColor
                  : Colors.white),
        ));
  }

  @override
  void initState() {
    super.initState();
    controller.fetchData();
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
        return Scaffold(
          body: Container(
            color: PABColorTheme.backgrndColor,
            height: Get.height,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 87),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: Image.asset("assets/images/profile_dp.png",
                                fit: BoxFit.cover, height: 80, width: 80))),
                    Center(
                      child: Text(
                        "${UserDetails[0]}",
                        style: PABTextTheme.headline1.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Center(
                      child: Text(
                        "${UserDetails[1]}",
                        style: PABTextTheme.headline2
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Center(
                      child: Text(
                        "+91 " + "${UserDetails[2]}",
                        style: PABTextTheme.headline2
                            .copyWith(color: Colors.white54),
                      ),
                    ),
                    const SizedBox(height: 56),
                    Text(
                      "Your Experience",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        CustomRadioButton("Fresher", 1),
                        const Spacer(),
                        CustomRadioButton("Experienced", 2),
                      ],
                    ),
                    const SizedBox(height: 16),
                    (experience == "experienced")
                        ? Container(
                            width: double.infinity,
                            padding:
                                const EdgeInsets.only(left: 17.0, right: 17.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white)),
                            child: DropdownButton(
                                items: experienceyear.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item,
                                        style: PABTextTheme.content
                                            .copyWith(color: Colors.white)),
                                    value: item.toString(),
                                  );
                                }).toList(),
                                onChanged: (String? newVal) {
                                  setState(() {
                                    _experienceyear = newVal;
                                    print(_experienceyear);
                                  });
                                },
                                value: _experienceyear,
                                icon: const Icon(Icons.arrow_drop_down),
                                dropdownColor: Colors.black,
                                underline: const SizedBox(),
                                isExpanded: true,
                                hint: Text('Total Experience',
                                    style: PABTextTheme.content
                                        .copyWith(color: Colors.grey))),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 16),
                    CustomSearchableDropDown(
                      items: controller.location,
                      label: 'Location',
                      labelStyle:
                          PABTextTheme.content.copyWith(color: Colors.white),
                      dropdownItemStyle:
                          PABTextTheme.content.copyWith(color: Colors.black),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(Icons.search, color: Colors.grey),
                      ),
                      dropDownMenuItems: controller.location.map((item) {
                        return item['location'];
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          _myLocationSelection = value['location'].toString();
                          print(_myLocationSelection);
                        } else {
                          _myLocationSelection = null;
                        }
                      },
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       border: Border.all(color: Colors.white)),
                    //   child: DropdownButton(
                    //     items: controller.location.map((item) {
                    //       return DropdownMenuItem(
                    //         child: Text(item['location'],
                    //             style: PABTextTheme.content
                    //                 .copyWith(color: Colors.white)),
                    //         value: item['id'].toString(),
                    //       );
                    //     }).toList(),
                    //     onChanged: (newVal) {
                    //       setState(() {
                    //         _myLocationSelection = newVal as String;
                    //       });
                    //     },
                    //     value: _myLocationSelection,
                    //     icon: const Icon(Icons.arrow_drop_down),
                    //     dropdownColor: Colors.black,
                    //     underline: const SizedBox(),
                    //     isExpanded: true,
                    //     hint: Text('Location',
                    //         style: PABTextTheme.content
                    //             .copyWith(color: Colors.white)),
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    CustomSearchableDropDown(
                      items: controller.skills,
                      label: 'Your Key Skills',
                      labelStyle:
                          PABTextTheme.content.copyWith(color: Colors.black),
                      dropdownItemStyle:
                          PABTextTheme.content.copyWith(color: Colors.black),
                      multiSelectTag: 'Skills',
                      multiSelectValuesAsWidget: true,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      multiSelect: true,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(Icons.search, color: Colors.grey),
                      ),
                      dropDownMenuItems: controller.skills.map((item) {
                        return item['Skill'];
                      }).toList(),
                      onChanged: (value) {
                        // print(value.toString());
                        if (value != null) {
                          _mySkillsSelection = jsonDecode(value);
                          print(_mySkillsSelection);
                          mySkillsSelectedList =
                              _mySkillsSelection!.map((item) {
                            return item['Skill'];
                          }).toList();
                          print(mySkillsSelectedList);
                        } else {
                          _mySkillsSelection = [];
                        }
                      },
                    ),
                    const SizedBox(height: 60),
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
                            Get.to(
                              () => const AddExperienceDetails(),
                            );
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
                            if (_myLocationSelection != null ||
                                experience != null ||
                                mySkillsSelectedList != null) {
                              APIService.AddProfileDetails(
                                  _myLocationSelection.toString(),
                                  experience.toString(),
                                  _experienceyear!,
                                  mySkillsSelectedList!);

                              Get.to(
                                () => const AddExperienceDetails(),
                              );
                            } else {
                              Get.snackbar(
                                  "Incomplete", "Fill all fields to complete",
                                  backgroundColor: Colors.white);
                            }
                            ;
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}

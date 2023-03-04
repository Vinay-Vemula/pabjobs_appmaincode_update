import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pabjobs/common/custom_searchable_dropdown.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/education/add_education.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/education/edit_education.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/education/education_controller.dart';

import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class ScreenC extends StatefulWidget {
  const ScreenC({
    Key? key,
  }) : super(key: key);
  @override
  State<ScreenC> createState() => _ScreenCState();
}

class _ScreenCState extends State<ScreenC> {
  EducationDetailsController controller = Get.put(EducationDetailsController());

  final TextEditingController textController = TextEditingController();
  final TextEditingController text1Controller = TextEditingController();
  final TextEditingController text2Controller = TextEditingController();

  String? _courseSelection;
  String? _specializationSelection;

  String? _qualification;
  List<String> Qualification = [
    "SSC",
    "Intermediate",
    "Diploma",
    "Graduate",
    "Post Graduate"
  ];

  String? _course;
  List<String> Course = [
    "10th",
  ];

  String? _specialization;
  List<String> Specialization = [
    "Medical",
    "Comerce",
    "Computer",
  ];

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
              color: (_value == _index) ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
      style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor:
              (_value == _index) ? PABColorTheme.purpleColor : Colors.white),
    );
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
        return (controller.data.value.education!.isEmpty)
            ? Container(
                color: Color(0xffF5F5F5),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        Text(
                          "Highest Postgraduation",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 9),
                        Container(
                          width: double.infinity,
                          padding:
                              const EdgeInsets.only(left: 17.0, right: 17.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white)),
                          child: DropdownButton(
                              items: Qualification.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item,
                                      style: PABTextTheme.content
                                          .copyWith(color: Colors.black)),
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
                              dropdownColor: Colors.white,
                              underline: const SizedBox(),
                              isExpanded: true,
                              hint: Text('Select',
                                  style: PABTextTheme.content
                                      .copyWith(color: Colors.black))),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Course",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 9),
                        CustomSearchableDropDown(
                          items: controller.courseData,
                          label: 'Enter Postgraduation Course',
                          labelStyle: PABTextTheme.content
                              .copyWith(color: Colors.black),
                          dropdownItemStyle: PABTextTheme.content
                              .copyWith(color: Colors.black),
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                        // Container(
                        //   width: double.infinity,
                        //   padding:
                        //       const EdgeInsets.only(left: 17.0, right: 17.0),
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(10),
                        //       border: Border.all(color: Colors.white)),
                        //   child: DropdownButton(
                        //       items: Course.map((item) {
                        //         return DropdownMenuItem(
                        //           child: Text(item,
                        //               style: PABTextTheme.content
                        //                   .copyWith(color: Colors.black)),
                        //           value: item.toString(),
                        //         );
                        //       }).toList(),
                        //       onChanged: (newVal) {
                        //         setState(() {
                        //           _course = newVal as String;
                        //         });
                        //       },
                        //       value: _course,
                        //       icon: const Icon(Icons.arrow_drop_down),
                        //       dropdownColor: Colors.white,
                        //       underline: const SizedBox(),
                        //       isExpanded: true,
                        //       hint: Text('Select',
                        //           style: PABTextTheme.content
                        //               .copyWith(color: Colors.black))),
                        // ),
                        const SizedBox(height: 16),
                        Text(
                          "Specialization",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 9),
                        CustomSearchableDropDown(
                          items: controller.specializationData,
                          label: 'Enter Specialization',
                          labelStyle: PABTextTheme.content
                              .copyWith(color: Colors.black),
                          dropdownItemStyle: PABTextTheme.content
                              .copyWith(color: Colors.black),
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                              _specializationSelection =
                                  value['name'].toString();
                            } else {
                              _specializationSelection = null;
                            }
                          },
                        ),
                        // Container(
                        //   width: double.infinity,
                        //   padding:
                        //       const EdgeInsets.only(left: 17.0, right: 17.0),
                        //   decoration: BoxDecoration(
                        //       color: Colors.white,
                        //       borderRadius: BorderRadius.circular(10),
                        //       border: Border.all(color: Colors.white)),
                        //   child: DropdownButton(
                        //       items: Specialization.map((item) {
                        //         return DropdownMenuItem(
                        //           child: Text(item,
                        //               style: PABTextTheme.content
                        //                   .copyWith(color: Colors.black)),
                        //           value: item.toString(),
                        //         );
                        //       }).toList(),
                        //       onChanged: (newVal) {
                        //         setState(() {
                        //           _specialization = newVal as String;
                        //         });
                        //       },
                        //       value: _specialization,
                        //       icon: const Icon(Icons.arrow_drop_down),
                        //       dropdownColor: Colors.white,
                        //       underline: const SizedBox(),
                        //       isExpanded: true,
                        //       hint: Text('Select',
                        //           style: PABTextTheme.content
                        //               .copyWith(color: Colors.black))),
                        // ),
                        const SizedBox(height: 16),
                        Text(
                          "University/Institute",
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
                          style: PABTextTheme.content
                              .copyWith(color: Colors.black),
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
                              hintText: "Enter University Name",
                              hintStyle: PABTextTheme.content.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Course Type",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 9),
                        Column(
                          children: [
                            CustomRadioButton("Full Time", 1),
                            SizedBox(height: 12),
                            CustomRadioButton("Part Time", 2),
                            SizedBox(height: 12),
                            CustomRadioButton(
                                "Correspondence/Distance Learning", 3),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Passed Out Year",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 9),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: text1Controller,
                          style: PABTextTheme.content
                              .copyWith(color: Colors.black),
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
                              hintText: "Enter Year",
                              hintStyle: PABTextTheme.content.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Marks in Percentage or CGPA",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 9),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: text2Controller,
                          style: PABTextTheme.content
                              .copyWith(color: Colors.black),
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
                              hintText: "Enter CGPA",
                              hintStyle: PABTextTheme.content.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                        ),
                        const SizedBox(height: 32),
                        Container(
                          padding: const EdgeInsets.only(bottom: 32),
                          width: Get.width,
                          child: TextButton(
                              child: Text(
                                'Save Changes',
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
                                    textController.text != "" &&
                                    courseType != null &&
                                    text1Controller.text != "" &&
                                    text2Controller.text != "") {
                                  final x = await APIService.educationDetails(
                                      _qualification!,
                                      _courseSelection!,
                                      _specializationSelection!,
                                      textController.text,
                                      courseType!,
                                      text1Controller.text,
                                      text2Controller.text, []);
                                  if (x) {
                                    controller.fetchData();
                                  }
                                } else {
                                  Get.snackbar("Incomplete",
                                      "Fill all fields to complete",
                                      backgroundColor: Colors.white);
                                }
                              }),
                        ),
                      ]),
                ))
            : Container(
                color: Color(0xffF5F5F5),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      const SizedBox(height: 24),
                      ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: Get.height * 2,
                              minHeight: 66 *
                                  controller.data.value.education!.length
                                      .toDouble()),
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller.data.value.education!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    width: Get.width,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 16),
                                    margin: const EdgeInsets.only(bottom: 16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .data
                                              .value
                                              .education![index]
                                              .highestgraduation!,
                                          style: PABTextTheme.content.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          controller.data.value
                                                  .education![index].course! +
                                              "  " +
                                              controller
                                                  .data
                                                  .value
                                                  .education![index]
                                                  .specialization!,
                                          style: PABTextTheme.content.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(height: 17),
                                        const Divider(),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  Get.to(
                                                      () =>
                                                          const EditEducation(),
                                                      arguments: [
                                                        controller
                                                            .data
                                                            .value
                                                            .education![index]
                                                            .highestgraduation,
                                                        controller
                                                            .data
                                                            .value
                                                            .education![index]
                                                            .course,
                                                        controller
                                                            .data
                                                            .value
                                                            .education![index]
                                                            .specialization,
                                                        controller
                                                            .data
                                                            .value
                                                            .education![index]
                                                            .institute,
                                                        controller
                                                            .data
                                                            .value
                                                            .education![index]
                                                            .courseType,
                                                        controller
                                                            .data
                                                            .value
                                                            .education![index]
                                                            .passedoutyear,
                                                        controller
                                                            .data
                                                            .value
                                                            .education![index]
                                                            .marks,
                                                        controller
                                                            .data
                                                            .value
                                                            .education![index]
                                                            .id
                                                      ]);
                                                },
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 11),
                                                    child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SvgPicture.asset(
                                                              "assets/logos/education_edit_icon.svg"),
                                                          Text(
                                                            "Edit",
                                                            style: PABTextTheme
                                                                .content
                                                                .copyWith(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        12),
                                                          ),
                                                        ])),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () async {
                                                  final x = await APIService
                                                      .deleteEducation(
                                                          controller
                                                              .data
                                                              .value
                                                              .education![index]
                                                              .id!);
                                                  if (x) {
                                                    controller.fetchData();
                                                  }
                                                },
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 11),
                                                    child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SvgPicture.asset(
                                                              "assets/logos/education_remove_icon.svg"),
                                                          Text(
                                                            "Remove",
                                                            style: PABTextTheme
                                                                .content
                                                                .copyWith(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        12),
                                                          ),
                                                        ])),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ));
                              })),
                      const SizedBox(height: 14),
                      Container(
                        padding: const EdgeInsets.only(bottom: 32),
                        width: Get.width,
                        child: TextButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(EvaIcons.plusCircleOutline),
                                const SizedBox(width: 8),
                                Text(
                                  'Add Education',
                                  style: PABTextTheme.content.copyWith(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 31),
                              primary: Colors.white,
                              backgroundColor: PABColorTheme.primaryColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            onPressed: () async {
                              Get.to(() => const AddEducation(),
                                  arguments: controller.data.value.education);
                            }),
                      ),
                    ])));
      }
    });
  }
}

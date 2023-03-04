import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pabjobs/common/custom_searchable_dropdown.dart';

import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/career_profile/career_profile_controller.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class ScreenD extends StatefulWidget {
  const ScreenD({
    Key? key,
  }) : super(key: key);
  @override
  State<ScreenD> createState() => _ScreenDState();
}

class _ScreenDState extends State<ScreenD> {
  CareerProfileController controller = Get.put(CareerProfileController());

  String? jobType;
  String? employementType;
  String? shift;

  String? _industrySelection;
  String? _designationSelection;
  String? _myLocationSelection;

  String? _ctc;
  List CTC = [
    "0 - 3 LPA",
    "3 - 5 LPA",
    "5 - 7 LPA",
    "7 - 10 LPA",
    "10 - 15 LPA",
    "15 - 20 LPA",
    "20+ LPA",
  ];

  int _value = 0;
  Widget CustomRadioButton(String _text, int _index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _value = _index;
          jobType = _text;
          if (controller.data.value.careerprofile!.isNotEmpty) {
            controller.defaultJobTypeSelection(_value);
          }
        });
      },
      child: Container(
        width: Get.width * .33,
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

  int _value1 = 0;
  Widget CustomRadioButton1(String _text1, int _index1) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _value1 = _index1;
          if (controller.data.value.careerprofile!.isNotEmpty) {
            controller.defaultEmployementTypeSelection(_value1);
          }
          employementType = _text1;
        });
      },
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Center(
          child: Text(
            _text1,
            style: PABTextTheme.content.copyWith(
              color: (_value1 == _index1) ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
      style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor:
              (_value1 == _index1) ? PABColorTheme.purpleColor : Colors.white),
    );
  }

  int _value2 = 0;
  Widget CustomRadioButton2(String _text2, int _index2) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _value2 = _index2;
          if (controller.data.value.careerprofile!.isNotEmpty) {
            controller.defaultShiftSelection(_value2);
          }
          shift = _text2;
        });
      },
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Center(
          child: Text(
            _text2,
            style: PABTextTheme.content.copyWith(
              color: (_value2 == _index2) ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
      style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor:
              (_value2 == _index2) ? PABColorTheme.purpleColor : Colors.white),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      controller.fetchData();
    });
    print(controller.data.value);
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
        // default JobType selection
        if (controller.data.value.careerprofile!.isEmpty) {
        } else {
          if (controller.data.value.careerprofile![0].desiredJobType ==
              "Permanent") {
            _value = 1;
          } else if (controller.data.value.careerprofile![0].desiredJobType ==
              "Contratual") {
            _value = 2;
          } else {
            _value = 0;
          }
        }

        // default employement selection
        if (controller.data.value.careerprofile!.isEmpty) {
        } else {
          if (controller.data.value.careerprofile![0].desiredEmployementType ==
              "Full Time") {
            _value1 = 1;
          } else if (controller
                  .data.value.careerprofile![0].desiredEmployementType ==
              "Part Time") {
            _value1 = 2;
          } else if (controller
                  .data.value.careerprofile![0].desiredEmployementType ==
              "Freelancer") {
            _value1 = 3;
          } else if (controller
                  .data.value.careerprofile![0].desiredEmployementType ==
              "Work From Home") {
            _value1 = 4;
          } else if (controller
                  .data.value.careerprofile![0].desiredEmployementType ==
              "Work Abroad") {
            _value1 = 5;
          } else if (controller
                  .data.value.careerprofile![0].desiredEmployementType ==
              "Internships") {
            _value1 = 6;
          } else {
            _value1 = 0;
          }
        }

        // default shift status selection
        if (controller.data.value.careerprofile!.isEmpty) {
        } else {
          if (controller.data.value.careerprofile![0].desiredPrefferedShift ==
              "Any Shift") {
            _value2 = 1;
          } else if (controller
                  .data.value.careerprofile![0].desiredPrefferedShift ==
              "Day Shift") {
            _value2 = 2;
          } else if (controller
                  .data.value.careerprofile![0].desiredPrefferedShift ==
              "Night Shift") {
            _value2 = 3;
          } else {
            _value2 = 0;
          }
        }
        return Container(
            color: Color(0xffF5F5F5),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const SizedBox(height: 24),
                  Text(
                    "Desired Industry",
                    textAlign: TextAlign.left,
                    style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 9),
                  CustomSearchableDropDown(
                    items: controller.data1_,
                    label: (controller.data.value.careerprofile!.isNotEmpty)
                        ? controller
                            .data.value.careerprofile![0].desiredIndustry
                        : 'Enter industry',
                    labelStyle:
                        PABTextTheme.content.copyWith(color: Colors.black),
                    dropdownItemStyle:
                        PABTextTheme.content.copyWith(color: Colors.black),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    dropDownMenuItems: controller.data1_.map((item) {
                      return item['Category'];
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        _industrySelection = value['Category'].toString();
                        print(_industrySelection);
                      } else {
                        _industrySelection = null;
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Designation",
                    textAlign: TextAlign.left,
                    style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 9),
                  CustomSearchableDropDown(
                    items: controller.data2_,
                    label: (controller.data.value.careerprofile!.isNotEmpty)
                        ? controller.data.value.careerprofile![0].desiredRoleUrl
                        : 'Please Enter Desired Designation',
                    labelStyle:
                        PABTextTheme.content.copyWith(color: Colors.black),
                    dropdownItemStyle:
                        PABTextTheme.content.copyWith(color: Colors.black),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    dropDownMenuItems: controller.data2_.map((item) {
                      return item['Designation'];
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        _designationSelection = value['Designation'].toString();
                        print(_designationSelection);
                      } else {
                        _designationSelection = null;
                      }
                    },
                  ),

                  const SizedBox(height: 16),
                  Text(
                    "Choose Job Type",
                    textAlign: TextAlign.left,
                    style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 9),
                  Row(
                    children: [
                      CustomRadioButton("Permanent", 1),
                      const Spacer(),
                      CustomRadioButton("Contractual", 2),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Choose Employement Type",
                    textAlign: TextAlign.left,
                    style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 9),
                  Column(
                    children: [
                      CustomRadioButton1("Full Time", 1),
                      SizedBox(height: 12),
                      CustomRadioButton1("Part Time", 2),
                      SizedBox(height: 12),
                      CustomRadioButton1("Freelancer", 3),
                      SizedBox(height: 12),
                      CustomRadioButton1("Work From Home", 4),
                      SizedBox(height: 12),
                      CustomRadioButton1("Work Abroad", 5),
                      SizedBox(height: 12),
                      CustomRadioButton1("Internships", 6),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Choose Preffered Shift",
                    textAlign: TextAlign.left,
                    style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 9),
                  Column(
                    children: [
                      CustomRadioButton2("Any Shift", 1),
                      SizedBox(height: 12),
                      CustomRadioButton2("Day Shift", 2),
                      SizedBox(height: 12),
                      CustomRadioButton2("Night Shift", 3),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Expected CTC",
                    textAlign: TextAlign.left,
                    style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 9),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white)),
                    child: DropdownButton(
                        items: CTC.map((item) {
                          return DropdownMenuItem(
                            child: Text(item,
                                style: PABTextTheme.content
                                    .copyWith(color: Colors.black)),
                            value: item.toString(),
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            _ctc = newVal;
                            print(_ctc);
                          });
                        },
                        value: _ctc,
                        icon: const Icon(Icons.arrow_drop_down),
                        dropdownColor: Colors.white,
                        underline: const SizedBox(),
                        isExpanded: true,
                        hint: Text(
                            (controller.data.value.careerprofile!.isNotEmpty)
                                ? controller.data.value.careerprofile![0]
                                    .desiredExpectedSalaryinLakhs!
                                : 'Choose Expected CTC',
                            style: PABTextTheme.content
                                .copyWith(color: Colors.black))),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Desired Location",
                    textAlign: TextAlign.left,
                    style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 9),
                  // Container(
                  //   width: double.infinity,
                  //   padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(10),
                  //       border: Border.all(color: Colors.white)),
                  //   child: DropdownButton(
                  //       items: controller.data_.map((item) {
                  //         return DropdownMenuItem(
                  //           child: Text(item['location'],
                  //               style: PABTextTheme.content
                  //                   .copyWith(color: Colors.black)),
                  //           value: item['location'].toString(),
                  //         );
                  //       }).toList(),
                  //       onChanged: (String? newVal) {
                  //         setState(() {
                  //           _myLocationSelection = newVal;
                  //           print(_myLocationSelection);
                  //         });
                  //       },
                  //       value: _myLocationSelection,
                  //       icon: const Icon(Icons.arrow_drop_down),
                  //       dropdownColor: Colors.white,
                  //       underline: const SizedBox(),
                  //       isExpanded: true,
                  //       hint: Text('Location',
                  //           style: PABTextTheme.content
                  //               .copyWith(color: Colors.black))),
                  // ),
                  CustomSearchableDropDown(
                    items: controller.data_,
                    label: (controller.data.value.careerprofile!.isNotEmpty)
                        ? controller
                            .data.value.careerprofile![0].desiredLocation
                            .toString()
                            .replaceAll(RegExp(r'[^\w\s]+'), '  ')
                        : 'Select Location',
                    labelStyle:
                        PABTextTheme.content.copyWith(color: Colors.black),
                    dropdownItemStyle:
                        PABTextTheme.content.copyWith(color: Colors.black),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                    dropDownMenuItems: controller.data_.map((item) {
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
                  // CustomSearchableDropDown(
                  //   items: controller.data_,
                  //   backgroundColor: Colors.white,
                  //   label: (controller.data.value.careerprofile!.isEmpty)
                  //       ? 'Select Locations'
                  //       : controller
                  //           .data.value.careerprofile![0].desiredLocation
                  //           .toString()
                  //           .replaceAll(new RegExp(r'[^\w\s]+'), ''),
                  //   multiSelectTag: 'Location',
                  //   multiSelectValuesAsWidget: true,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.white),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   multiSelect: true,
                  //   prefixIcon: const Padding(
                  //     padding: EdgeInsets.all(0.0),
                  //     child: Icon(Icons.search),
                  //   ),
                  //   dropDownMenuItems: controller.data_.map((item) {
                  //     return item['location'];
                  //   }).toList(),
                  //   onChanged: (value) {
                  //     // print(value.toString());
                  //     if (value != null) {
                  //       _myLocationSelection = jsonDecode(value);
                  //       print(_myLocationSelection);
                  //       mylocationsSelectedList =
                  //           _myLocationSelection!.map((item) {
                  //         return item['location'];
                  //       }).toList();
                  //       print(mylocationsSelectedList);
                  //     } else {
                  //       _myLocationSelection = [];
                  //     }
                  //   },
                  // ),
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
                            borderRadius: BorderRadius.all(Radius.circular(31)),
                          ),
                        ),
                        onPressed: () async {
                          APIService.careerProfile(
                              (_industrySelection == null)
                                  ? (controller
                                          .data.value.careerprofile!.isEmpty)
                                      ? ""
                                      : controller.data.value.careerprofile![0]
                                          .desiredIndustry!
                                  : _industrySelection!,
                              (_designationSelection == null)
                                  ? (controller
                                          .data.value.careerprofile!.isEmpty)
                                      ? ""
                                      : controller.data.value.careerprofile![0]
                                          .desiredRoleUrl!
                                  : _designationSelection!,
                              (jobType == null)
                                  ? (controller
                                          .data.value.careerprofile!.isEmpty)
                                      ? ""
                                      : controller.data.value.careerprofile![0]
                                          .desiredJobType!
                                  : jobType!,
                              (employementType == null)
                                  ? (controller
                                          .data.value.careerprofile!.isEmpty)
                                      ? ""
                                      : controller.data.value.careerprofile![0]
                                          .desiredEmployementType!
                                  : employementType!,
                              (shift == null)
                                  ? (controller
                                          .data.value.careerprofile!.isEmpty)
                                      ? ""
                                      : controller.data.value.careerprofile![0]
                                          .desiredPrefferedShift!
                                  : shift!,
                              (_ctc == null)
                                  ? (controller
                                          .data.value.careerprofile!.isEmpty)
                                      ? ""
                                      : controller.data.value.careerprofile![0]
                                          .desiredExpectedSalaryinLakhs!
                                  : _ctc!,
                              (_myLocationSelection == null)
                                  ? (controller
                                          .data.value.careerprofile!.isEmpty)
                                      ? ""
                                      : controller.data.value.careerprofile![0]
                                          .desiredLocation!
                                  : _myLocationSelection!);
                        }),
                  ),
                ])));
      }
    });
  }
}

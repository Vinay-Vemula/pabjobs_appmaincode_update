// ignore_for_file: unused_field, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

import 'package:pabjobs/common/textfield.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/common/custom_searchable_dropdown.dart';
import 'package:pabjobs/pages/job_seeker/add_details/add_education_details/add_education_details.dart';
import 'package:pabjobs/pages/job_seeker/add_details/add_experience_details/add_experience_details_controller.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class AddExperienceDetails extends StatefulWidget {
  const AddExperienceDetails({Key? key}) : super(key: key);

  @override
  State<AddExperienceDetails> createState() => _AddExperienceDetailsState();
}

class _AddExperienceDetailsState extends State<AddExperienceDetails> {
  AddExperienceDetailsController controller =
      Get.put(AddExperienceDetailsController());

  final TextEditingController textController = TextEditingController();
  final TextEditingController text1Controller = TextEditingController();
  final TextEditingController text2Controller = TextEditingController();
  String? _myDesignationSelection;
  String? _myCategorySelection;

  DateTime _selectedDate = DateTime.now();

  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(1950),
            //what will be the previous supported year in picker
            lastDate: DateTime
                .now()) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop

        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;
      });
    });
  }

  DateTime _selectedDate1 = DateTime.now();
  void _pickDateDialog1() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(1950),
            //what will be the previous supported year in picker
            lastDate: DateTime
                .now()) //what will be the up to supported date in picker
        .then((pickedDate1) {
      //then usually do the future job
      if (pickedDate1 == null) {
        //if user tap cancel then this function will stop

        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate1 = pickedDate1;
      });
    });
  }

  String? _text;

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
          child: SingleChildScrollView(
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/bg_primaryColor.svg",
                  width: Get.width,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 92),
                      Text(
                        "Tell us more\nabout your experience",
                        style: PABTextTheme.headline1.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Tell about your experience years , designation and\nabout job profiles",
                        style: PABTextTheme.headline2
                            .copyWith(color: Colors.white54),
                      ),
                      const SizedBox(height: 56),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Experience",
                                style: PABTextTheme.headline1.copyWith(
                                    fontSize: 12, color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                              Textfield(
                                controller: textController,
                                hintText: "Years",
                                textInputType: TextInputType.text,
                                obscure: false,
                                Icon: const SizedBox(),
                              ),
                            ],
                          )),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Months",
                                  style: PABTextTheme.headline1.copyWith(
                                      fontSize: 12, color: Colors.white),
                                ),
                                const SizedBox(height: 8),
                                Textfield(
                                  controller: text1Controller,
                                  hintText: "Months",
                                  textInputType: TextInputType.text,
                                  obscure: false,
                                  Icon: const SizedBox(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Your Designation",
                        style: PABTextTheme.headline1
                            .copyWith(fontSize: 12, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      CustomSearchableDropDown(
                        items: controller.designation,
                        label: 'Present Designation',
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
                        dropDownMenuItems: controller.designation.map((item) {
                          return item['Designation'];
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            _myDesignationSelection =
                                value['Designation'].toString();
                            print(_myDesignationSelection);
                          } else {
                            _myDesignationSelection = null;
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
                      //     items: controller.designation.map((item) {
                      //       return DropdownMenuItem(
                      //         child: Text(item['Designation'],
                      //             style: PABTextTheme.content
                      //                 .copyWith(color: Colors.white)),
                      //         value: item['Designation'].toString(),
                      //       );
                      //     }).toList(),
                      //     onChanged: (newVal) {
                      //       setState(() {
                      //         _myDesignationSelection = newVal as String;
                      //       });
                      //     },
                      //     value: _myDesignationSelection,
                      //     icon: const Icon(Icons.arrow_drop_down),
                      //     dropdownColor: Colors.black,
                      //     underline: const SizedBox(),
                      //     isExpanded: true,
                      //     hint: Text('Designation',
                      //         style: PABTextTheme.content
                      //             .copyWith(color: Colors.white)),
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                      Text(
                        "Your Organization Category",
                        style: PABTextTheme.headline1
                            .copyWith(fontSize: 12, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      CustomSearchableDropDown(
                        items: controller.category,
                        label: 'Present Organization Category',
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
                        dropDownMenuItems: controller.category.map((item) {
                          return item['Category'];
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            _myCategorySelection = value['Category'].toString();
                            print(_myCategorySelection);
                          } else {
                            _myCategorySelection = null;
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
                      //     items: controller.category.map((item) {
                      //       return DropdownMenuItem(
                      //         child: Text(item['Category'],
                      //             style: PABTextTheme.content
                      //                 .copyWith(color: Colors.white)),
                      //         value: item['Category'].toString(),
                      //       );
                      //     }).toList(),
                      //     onChanged: (newVal) {
                      //       setState(() {
                      //         _myCategorySelection = newVal as String;
                      //       });
                      //     },
                      //     value: _myCategorySelection,
                      //     icon: const Icon(Icons.arrow_drop_down),
                      //     dropdownColor: Colors.black,
                      //     underline: const SizedBox(),
                      //     isExpanded: true,
                      //     hint: Text('Category',
                      //         style: PABTextTheme.content
                      //             .copyWith(color: Colors.white)),
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                      Text(
                        "Is This Your Current Company ?",
                        style: PABTextTheme.headline1
                            .copyWith(fontSize: 12, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      CustomRadioButton(
                        unSelectedBorderColor: Colors.white,
                        buttonTextStyle: ButtonTextStyle(
                            selectedColor: Colors.white,
                            unSelectedColor: Colors.white,
                            textStyle:
                                PABTextTheme.content.copyWith(fontSize: 16)),
                        autoWidth: false,
                        enableButtonWrap: true,
                        wrapAlignment: WrapAlignment.center,
                        unSelectedColor: PABColorTheme.backgrndColor,
                        buttonLables: const [
                          "Yes",
                          "No",
                        ],
                        buttonValues: const [
                          "Yes",
                          "No",
                        ],
                        radioButtonValue: (value) {
                          _text = value.toString();
                        },
                        horizontal: false,
                        width: Get.width * 0.41,
                        height: 50,
                        selectedColor: PABColorTheme.primaryColor,
                        padding: 10,
                        enableShape: true,
                      ),
                      // Row(
                      //   children: [

                      //     CustomRadioButton("Yes", 1),
                      //     const Spacer(),
                      //     CustomRadioButton("No", 2),
                      //   ],
                      // ),
                      const SizedBox(height: 20),
                      Text(
                        "Started Working From",
                        style: PABTextTheme.headline1
                            .copyWith(fontSize: 12, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: Get.width,
                        child: OutlinedButton(
                            child: _selectedDate == null
                                ? Text('dd-mm-yy',
                                    style: PABTextTheme.content
                                        .copyWith(color: Colors.white38))
                                : Text(DateFormat.yMMMd().format(_selectedDate),
                                    style: PABTextTheme.content
                                        .copyWith(color: Colors.white)),
                            style: OutlinedButton.styleFrom(
                              alignment: Alignment.centerLeft,
                              side: const BorderSide(color: Colors.white),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 18),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            onPressed: _pickDateDialog),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Worked Till",
                        style: PABTextTheme.headline1
                            .copyWith(fontSize: 12, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: Get.width,
                        child: OutlinedButton(
                            child: _selectedDate == null
                                ? Text('dd-mm-yy',
                                    style: PABTextTheme.content
                                        .copyWith(color: Colors.white38))
                                : Text(
                                    DateFormat.yMMMd().format(_selectedDate1),
                                    style: PABTextTheme.content
                                        .copyWith(color: Colors.white)),
                            style: OutlinedButton.styleFrom(
                              alignment: Alignment.centerLeft,
                              side: const BorderSide(color: Colors.white),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 18),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            onPressed: _pickDateDialog1),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Describe Your Job Profile",
                        style: PABTextTheme.headline1
                            .copyWith(fontSize: 12, color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Textfield(
                        controller: text2Controller,
                        hintText: "About Your Job Profile",
                        textInputType: TextInputType.text,
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
                              Get.to(
                                () => const AddEducationDetails(),
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
                              if (_myDesignationSelection != null &&
                                  _myCategorySelection != null &&
                                  _text! != null &&
                                  text2Controller.text != "") {
                                APIService.employementDetails(
                                    _myDesignationSelection!,
                                    _myCategorySelection!,
                                    _text!,
                                    _selectedDate.toString(),
                                    _selectedDate1.toString(),
                                    text2Controller.text, []);
                                Get.to(
                                  () => const AddEducationDetails(),
                                );
                              } else {
                                Get.snackbar(
                                    "Incomplete", "Fill all fields to complete",
                                    backgroundColor: Colors.white);
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
      }
    });
  }
}

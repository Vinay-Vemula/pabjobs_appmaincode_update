import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/common/custom_searchable_dropdown.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/personal_details/personal_details_controller.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class ScreenE extends StatefulWidget {
  ScreenE({
    Key? key,
  }) : super(key: key);
  @override
  State<ScreenE> createState() => _ScreenEState();
}

class _ScreenEState extends State<ScreenE> {
  ProfileDetailsController controller = Get.put(ProfileDetailsController());

  final TextEditingController textController = TextEditingController();
  final TextEditingController text1Controller = TextEditingController();
  final TextEditingController text2Controller = TextEditingController();
  final TextEditingController text4Controller = TextEditingController();

  String? _addressProof;
  List<String> AddressProof = [
    "Adhaar Card",
    "Driving License",
    "Pan Card",
    "Voter Card"
  ];

  List? _languages;
  List<String> Languages = [
    "Assamese",
    "Bangala",
    "Bengali",
    "Bodo",
    "Dogri",
    "Gujarati",
    "Hindi",
    "Kashmiri",
    "Kannada",
    "konkani",
    "Maithili",
    "Malayalam",
    "Manipuri",
    "Marathi",
    "Nepali",
    "Oriya",
    "Punjabi",
    "Tamil",
    "Telugu",
    "Santhali",
    "Sindhi",
    "Sanskrit",
    "Urdu",
    "English",
  ];

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

  String? gender;
  int _value = 0;
  Widget CustomRadioButton(String _text, int _index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _value = _index;
          controller.defaultGenderSelection(_value);
          print(_value);
          gender = _text;
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

  String? maritalStatus;
  int _value1 = 0;
  Widget CustomRadioButton1(String _text1, int _index1) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _value1 = _index1;
          controller.defaultMaritalSelection(_value1);
          maritalStatus = _text1;
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

  String? passport;
  int _value2 = 0;
  Widget CustomRadioButton2(String _text2, int _index2) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _value2 = _index2;
          controller.defaultpassportSelection(_value2);
          passport = _text2;
        });
      },
      child: Container(
        width: Get.width * .33,
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
// default gender selection
        if (controller.data.value.personaldetails!.gender == "Male") {
          _value = 1;
        } else if (controller.data.value.personaldetails!.gender == "Female") {
          _value = 2;
        } else {
          _value = 0;
        }

        // default marital status selection
        if (controller.data.value.personaldetails!.maritalStatus == "Married") {
          _value1 = 1;
        } else if (controller.data.value.personaldetails!.maritalStatus ==
            "Unmarried") {
          _value1 = 2;
        } else if (controller.data.value.personaldetails!.maritalStatus ==
            "Others") {
          _value1 = 3;
        } else {
          _value1 = 0;
        }

        // default marital status selection
        if (controller.data.value.personaldetails!.passport == "Yes") {
          _value2 = 1;
        } else if (controller.data.value.personaldetails!.passport == "No") {
          _value2 = 2;
        } else {
          _value2 = 0;
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
                    "Date Of birth",
                    textAlign: TextAlign.left,
                    style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 9),
                  Container(
                    width: Get.width,
                    child: OutlinedButton(
                        child: _selectedDate1 == null
                            ? Text('dd-mm-yy',
                                style: PABTextTheme.content
                                    .copyWith(color: Colors.black))
                            : Text(
                                '${DateFormat.yMMMd().format(_selectedDate1)}',
                                style: PABTextTheme.content
                                    .copyWith(color: Colors.black)),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          alignment: Alignment.centerLeft,
                          side: BorderSide(color: Colors.white),
                          padding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 18),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        onPressed: _pickDateDialog1),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Gender",
                    textAlign: TextAlign.left,
                    style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 9),
                  Row(
                    children: [
                      CustomRadioButton("Male", 1),
                      const Spacer(),
                      CustomRadioButton("Female", 2),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Permanent Address",
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
                        hintText:
                            (controller.data.value.personaldetails!.address !=
                                    "")
                                ? controller.data.value.personaldetails!.address
                                : "Enter Address",
                        hintStyle: PABTextTheme.content.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Hometown",
                    textAlign: TextAlign.left,
                    style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 9),
                  TextField(
                    keyboardType: TextInputType.text,
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
                        hintText: (controller
                                    .data.value.personaldetails!.hometown !=
                                "")
                            ? controller.data.value.personaldetails!.hometown
                            : "Enter Hometown",
                        hintStyle: PABTextTheme.content.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "PIN-Code",
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
                        hintText: (controller
                                    .data.value.personaldetails!.pincode !=
                                null)
                            ? controller.data.value.personaldetails!.pincode
                                .toString()
                            : "Enter PIN-Code",
                        hintStyle: PABTextTheme.content.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Marital Status",
                    textAlign: TextAlign.left,
                    style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 9),
                  Column(
                    children: [
                      CustomRadioButton1("Married", 1),
                      SizedBox(height: 12),
                      CustomRadioButton1("Unmarried", 2),
                      SizedBox(height: 12),
                      CustomRadioButton1("Others", 3),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Address Proof",
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
                        items: AddressProof.map((item) {
                          return DropdownMenuItem(
                            child: Text(item,
                                style: PABTextTheme.content
                                    .copyWith(color: Colors.black)),
                            value: item.toString(),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            _addressProof = newVal as String;
                          });
                        },
                        value: _addressProof,
                        icon: const Icon(Icons.arrow_drop_down),
                        dropdownColor: Colors.white,
                        underline: const SizedBox(),
                        isExpanded: true,
                        hint: (controller
                                    .data.value.personaldetails!.addressProof !=
                                "")
                            ? Text(
                                controller
                                    .data.value.personaldetails!.addressProof!,
                                style: PABTextTheme.content
                                    .copyWith(color: Colors.black))
                            : Text('Select Address Proof',
                                style: PABTextTheme.content
                                    .copyWith(color: Colors.black))),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Address Proof Number",
                    textAlign: TextAlign.left,
                    style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 9),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: text4Controller,
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
                        hintText: (controller.data.value.personaldetails!
                                    .adressProofNumber !=
                                "")
                            ? controller
                                .data.value.personaldetails!.adressProofNumber
                            : "Enter Address Proof Number",
                        hintStyle: PABTextTheme.content.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Do you have passport",
                    textAlign: TextAlign.left,
                    style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 9),
                  Row(
                    children: [
                      CustomRadioButton2("Yes", 1),
                      const Spacer(),
                      CustomRadioButton2("No", 2),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Languages",
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
                  //       items: Languages.map((item) {
                  //         return DropdownMenuItem(
                  //           child: Text(item,
                  //               style: PABTextTheme.content
                  //                   .copyWith(color: Colors.black)),
                  //           value: item.toString(),
                  //         );
                  //       }).toList(),
                  //       onChanged: (newVal) {
                  //         setState(() {
                  //           _languages = newVal as String;
                  //         });
                  //       },
                  //       value: _languages,
                  //       icon: const Icon(Icons.arrow_drop_down),
                  //       dropdownColor: Colors.white,
                  //       underline: const SizedBox(),
                  //       isExpanded: true,
                  //       hint:
                  //           (controller.data.value.personaldetails!.languages !=
                  //                   [])
                  //               ? Text(
                  //                   controller.data.value.personaldetails!
                  //                       .languages[0]
                  //                       .toString(),
                  //                   style: PABTextTheme.content
                  //                       .copyWith(color: Colors.black))
                  //               : Text('Add Languages',
                  //                   style: PABTextTheme.content
                  //                       .copyWith(color: Colors.black))),
                  // ),
                  CustomSearchableDropDown(
                    items: Languages,
                    backgroundColor: Colors.white,
                    label: (controller.data.value.skills!.isEmpty)
                        ? 'Add Languages'
                        : controller.data.value.personaldetails!.languages
                            .toString()
                            .replaceAll(new RegExp(r'[^\w\s]+'), ''),
                    multiSelectTag: 'Languages',
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
                    dropDownMenuItems: Languages.map((item) {
                      return item;
                    }).toList(),
                    onChanged: (value) {
                      // print(value.toString());
                      if (value != null) {
                        _languages = jsonDecode(value);
                        print(_languages);
                      } else {
                        _languages = [];
                      }
                    },
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
                            borderRadius: BorderRadius.all(Radius.circular(31)),
                          ),
                        ),
                        onPressed: () async {
                          if (_selectedDate1 != null &&
                              gender != null &&
                              textController.text != "" &&
                              text1Controller.text != "" &&
                              text2Controller.text != "" &&
                              text4Controller.text != "" &&
                              _addressProof! != null &&
                              passport! != null &&
                              _languages! != null) {
                            APIService.profileDetails(
                                _selectedDate1.toString(),
                                gender!,
                                textController.text,
                                text1Controller.text,
                                text2Controller.text,
                                maritalStatus!,
                                _addressProof!,
                                text4Controller.text,
                                passport!,
                                _languages!);
                          } else {
                            Get.snackbar(
                                "Incomplete", "Fill all fields to complete",
                                backgroundColor: Colors.white);
                          }
                        }),
                  ),
                ])));
      }
    });
  }
}

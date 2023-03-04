import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/common/custom_searchable_dropdown.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/employment/edit_employement_details/edit_employement_details_controller.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class AddEmployementDetails extends StatefulWidget {
  AddEmployementDetails({Key? key}) : super(key: key);
  @override
  State<AddEmployementDetails> createState() => _AddEmployementDetailsState();
}

class _AddEmployementDetailsState extends State<AddEmployementDetails> {
  final employmentDetails = Get.arguments;

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

  String? currentCompany;
  int _value = 0;
  Widget CustomRadioButton(String _text, int _index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _value = _index;
          currentCompany = _text;
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

  EditEmployementController controller = Get.put(EditEmployementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Color(0xffF5F5F5),
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
                          "Employement Details",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ])),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Experience",
                                style: PABTextTheme.headline1.copyWith(
                                    fontSize: 12, color: Colors.black),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                keyboardType: TextInputType.text,
                                controller: text1Controller,
                                style: PABTextTheme.content
                                    .copyWith(color: Colors.black),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 17, vertical: 17),
                                    labelStyle: PABTextTheme.content
                                        .copyWith(color: Colors.black),
                                    suffixIconColor: Colors.black,
                                    hintText: "Year",
                                    hintStyle: PABTextTheme.content.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
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
                                      fontSize: 12, color: Colors.black),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  keyboardType: TextInputType.text,
                                  controller: text2Controller,
                                  style: PABTextTheme.content
                                      .copyWith(color: Colors.black),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 17, vertical: 17),
                                      labelStyle: PABTextTheme.content
                                          .copyWith(color: Colors.black),
                                      suffixIconColor: Colors.black,
                                      hintText: "Months",
                                      hintStyle: PABTextTheme.content.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal)),
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
                            .copyWith(fontSize: 12, color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      CustomSearchableDropDown(
                        items: controller.data2_,
                        label: 'Present Designation',
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
                            _myDesignationSelection =
                                value['Designation'].toString();
                            print(_myDesignationSelection);
                          } else {
                            _myDesignationSelection = null;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Your Organization Category",
                        style: PABTextTheme.headline1
                            .copyWith(fontSize: 12, color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      CustomSearchableDropDown(
                        items: controller.data1_,
                        label: 'Present Organiztion Category',
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
                            _myCategorySelection = value['Category'].toString();
                            print(_myCategorySelection);
                          } else {
                            _myCategorySelection = null;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Is This Your Current Company ?",
                        style: PABTextTheme.headline1
                            .copyWith(fontSize: 12, color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          CustomRadioButton("Yes", 1),
                          const Spacer(),
                          CustomRadioButton("No", 2),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Started Working From",
                        style: PABTextTheme.headline1
                            .copyWith(fontSize: 12, color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: Get.width,
                        child: OutlinedButton(
                            child: _selectedDate == null
                                ? Text('dd-mm-yy',
                                    style: PABTextTheme.content
                                        .copyWith(color: Colors.black))
                                : Text(
                                    '${DateFormat.yMMMd().format(_selectedDate)}',
                                    style: PABTextTheme.content
                                        .copyWith(color: Colors.black)),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
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
                            .copyWith(fontSize: 12, color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: Get.width,
                        child: OutlinedButton(
                            child: _selectedDate == null
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
                            .copyWith(fontSize: 12, color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
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
                            hintText: "About Your Job Profile",
                            hintStyle: PABTextTheme.content.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                      ),
                      const SizedBox(height: 28),
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
                              if (_myDesignationSelection != null &&
                                  _myCategorySelection != null &&
                                  currentCompany != null &&
                                  textController.text != "") {
                                final x = await APIService.employementDetails(
                                    _myDesignationSelection!,
                                    _myCategorySelection!,
                                    currentCompany!,
                                    _selectedDate.toString(),
                                    _selectedDate1.toString(),
                                    textController.text,
                                    employmentDetails);
                                if (x) {
                                  controller.fetchData();
                                  Get.back();
                                }
                              } else {
                                Get.snackbar(
                                    "Incomplete", "Fill all fields to complete",
                                    backgroundColor: Colors.white);
                              }
                            }),
                      ),
                    ])))));
  }
}

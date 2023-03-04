import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/employment/project/edit_project_controller.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class AddCertificateDetails extends StatefulWidget {
  const AddCertificateDetails({Key? key}) : super(key: key);
  @override
  State<AddCertificateDetails> createState() => _EditCertificateDetailsState();
}

class _EditCertificateDetailsState extends State<AddCertificateDetails> {
  final certificateDetails = Get.arguments;
  EditProjectController controller = Get.put(EditProjectController());

  final TextEditingController textController = TextEditingController();
  final TextEditingController text1Controller = TextEditingController();
  final TextEditingController text2Controller = TextEditingController();

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
                          "Accomplishment - Certification",
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
                        "Certification Name",
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
                            hintText: "Enter Certification Name",
                            hintStyle: PABTextTheme.content.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Certification Completion ID",
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
                            hintText: "Enter Course Completion ID",
                            hintStyle: PABTextTheme.content.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Certification URL",
                        textAlign: TextAlign.left,
                        style: PABTextTheme.headline1.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 9),
                      TextField(
                        keyboardType: TextInputType.text,
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
                            hintText: "Enter Completion URL",
                            hintStyle: PABTextTheme.content.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Certificate Validity From",
                        style: PABTextTheme.headline1.copyWith(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
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
                              side: BorderSide(color: Colors.white),
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
                        "Certificate Validity To",
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
                              side: BorderSide(color: Colors.white),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 18),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            onPressed: _pickDateDialog1),
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
                              APIService.certificationDetails(
                                  textController.text,
                                  text1Controller.text,
                                  text2Controller.text,
                                  _selectedDate.toString(),
                                  _selectedDate1.toString(),
                                  certificateDetails);
                              controller.fetchUserDetails();
                              Get.back();
                            }),
                      ),
                    ])))));
  }
}

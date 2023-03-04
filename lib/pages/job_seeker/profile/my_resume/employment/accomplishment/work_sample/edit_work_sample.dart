import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/employment/accomplishment/work_sample/work_sample_controller.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class EditWorkSample extends StatefulWidget {
  const EditWorkSample({Key? key}) : super(key: key);

  @override
  State<EditWorkSample> createState() => _EditWorkSampleState();
}

class _EditWorkSampleState extends State<EditWorkSample> {
  final projectDetails = Get.arguments;

  WorkSampleController controller = Get.put(WorkSampleController());

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
  void initState() {
    super.initState();
    // print(projectDetails);
    // textController.text = projectDetails[0];
    // text1Controller.text = projectDetails[1];
    // (projectDetails[2] != null)
    //     ? _selectedDate = projectDetails[2]
    //     : _selectedDate = DateTime.now();

    // (projectDetails[3] != null)
    //     ? _selectedDate1 = projectDetails[3]
    //     : _selectedDate1 = DateTime.now();

    // text2Controller.text = projectDetails[4];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                color: const Color(0xffF5F5F5),
                height: Get.height,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
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
                            "Accomplishment - Work Sample",
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
                          "Work Title",
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
                              hintText: "Enter Title",
                              hintStyle: PABTextTheme.content.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "URL",
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
                              hintText: "",
                              hintStyle: PABTextTheme.content.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Link to your Projects (e.g. Github links etc.).",
                          style: PABTextTheme.headline1.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Duration From",
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
                          "Duration To",
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
                        const SizedBox(height: 20),
                        Text(
                          "Description",
                          style: PABTextTheme.headline1
                              .copyWith(fontSize: 12, color: Colors.black),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          maxLines: 4,
                          keyboardType: TextInputType.multiline,
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
                              hintText: "Describe Here",
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
                                if (textController.text != "" &&
                                    text1Controller.text != "" &&
                                    text2Controller.text != "") {
                                  final x =
                                      await APIService.editAcccomplishment(
                                    projectDetails[5],
                                    textController.text,
                                    text1Controller.text,
                                    _selectedDate.toString(),
                                    _selectedDate1.toString(),
                                    text2Controller.text,
                                  );
                                  if (x) {
                                    controller.fetchUserDetails();
                                    Get.back();
                                  }
                                } else {
                                  Get.snackbar("Incomplete",
                                      "Fill all fields to complete",
                                      backgroundColor: Colors.white);
                                  // }
                                }
                              }),
                        ),
                      ]),
                ))));
  }
}

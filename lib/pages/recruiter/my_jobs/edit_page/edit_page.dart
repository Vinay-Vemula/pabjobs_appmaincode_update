import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pabjobs/pages/recruiter/my_jobs/edit_page/edit_page_controller.dart';
import 'package:pabjobs/pages/recruiter/my_jobs/my_jobs_page.dart';

import '../../../../common/applicant_listing_big_text.dart';
import '../../../../common/custom_searchable_dropdown.dart';
import '../../../../common/post_job_contents.dart';
import '../../../../entities/api_service_recruiter.dart';
import '../../../../theme/color_theme.dart';
import '../../../../theme/text_theme.dart';
import '../my_job_controller.dart';

class EditPage extends StatefulWidget {
  // String? jobTitle;
  // int? noOfPosition;
  // String? education;
  // String? description;
  // String? jobType;
  // String? experience;
  // String? maxSalary;
  // String? region;
  // DateTime? deadline;
  // List<String>? skills;
  // List<String>? location;
  EditPage(
      {
      // this.jobTitle,
      // this.noOfPosition,
      // this.education,
      // this.description,
      // this.jobType,
      // this.experience,
      // this.maxSalary,
      // this.region,
      // this.deadline,
      // this.skills,
      // this.location,
      Key? key})
      : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  MyJobController myJobsController = Get.put(MyJobController());
  EditPageController controller = Get.put(EditPageController());
  var id = Get.arguments;
  late TextEditingController jobTitleController =
      TextEditingController(text: controller.myJobData.value.job!.title);
  late TextEditingController positionAvailableController =
      TextEditingController(
          text: controller.myJobData.value.job!.maxPositions.toString());
  late TextEditingController educationController =
      TextEditingController(text: controller.myJobData.value.job!.education);
  late TextEditingController jobDescriptionController =
      TextEditingController(text: controller.myJobData.value.job!.description);
  String? _jobType;
  int _value = 0;
  Widget CustomRadioButton(String _text, int? _index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _value = _index!;
          _jobType = _text.toLowerCase();
          if (controller.myJobData.value.job!.jobType != null) {
            controller.defaultJobTypeSelection(_value);
          }
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

  String? _experience;
  List Experience = [
    "0-2 years",
    "2-5 years",
    "5-10 years",
    "10-15 years",
    "15+ years"
  ];
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
  List? _mySkillsSelection;
  List? mySkillsSelectedList = [];
  List? _myLocationSelection;
  List? myLocationSelectedList = [];
  List<String> region = ['Select Your Region', 'India'];
  String? selectedRegion = 'Select Your Region';
  late DateTime _selectedDate1 = controller.myJobData.value.job!.deadline!;
  void _pickDateDialog1() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime.now(),
            //what will be the previous supported year in picker
            lastDate: DateTime(
                2050)) //what will be the up to supported date in picker
        .then((pickedDate1) {
      //then usually do the future job
      if (pickedDate1 == null) {
        //if user tap cancel then this function will stop

        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate1 = pickedDate1;
        print(_selectedDate1);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    controller.fetchData(id);
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
        // print('jobType = ${controller.myJobData.value.job!.jobType}');
        // print('experience = ${controller.myJobData.value.job!.experience}');
        // print('maxSalary = ${controller.myJobData.value.job!.salary}');
        // print('skills = ${controller.myJobData.value.job!.skillsets}');
        // print('region = ${controller.myJobData.value.job!.country}');
        // print('location = ${controller.myJobData.value.job!.cities}');
        // print('deadline = ${controller.myJobData.value.job!.deadline}');
        //
        /// default jobType selection
        if (controller.myJobData.value.job!.jobType != null &&
            controller.myJobData.value.job!.jobType == "full time") {
          _value = 1;
        } else if (controller.myJobData.value.job!.jobType != null &&
            controller.myJobData.value.job!.jobType == "part time") {
          _value = 2;
        } else if (controller.myJobData.value.job!.jobType != null &&
            controller.myJobData.value.job!.jobType == "freelancer") {
          _value = 3;
        } else {
          _value = 0;
        }

        return Scaffold(
          backgroundColor: PABColorTheme.recruiterPageColor,
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Spacing before appBar
                const SizedBox(height: 46),

                ///Heading
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xff0A0413),
                          )),
                      ALBigText(text: 'Edit Job'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Job Title
                        PostJobContents(
                          heading: 'Job Title',
                          hintText: 'Enter Your Designation here',
                          postJobController: jobTitleController,
                        ),

                        ///Positions available
                        PostJobContents(
                          heading: 'Positions available',
                          hintText: 'No Of Positions Available',
                          postJobController: positionAvailableController,
                          keyboardType: TextInputType.number,
                        ),

                        ///Job Type
                        Text(
                          "Choose Job Type",
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
                            const SizedBox(height: 6),
                            CustomRadioButton("Part Time", 2),
                            const SizedBox(height: 6),
                            CustomRadioButton("Freelancer", 3),
                          ],
                        ),
                        const SizedBox(height: 16),

                        ///Experience

                        Text(
                          "Experience",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 9),
                        //Drop Down
                        Container(
                          width: double.infinity,
                          padding:
                              const EdgeInsets.only(left: 17.0, right: 17.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white)),
                          child: DropdownButton(
                              items: Experience.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item,
                                      style: PABTextTheme.content
                                          .copyWith(color: Colors.black)),
                                  value: item.toString(),
                                );
                              }).toList(),
                              onChanged: (String? newVal) {
                                setState(() {
                                  _experience = newVal;
                                  print(_experience);
                                });
                              },
                              value: _experience ??
                                  controller.myJobData.value.job!.experience,
                              icon: const Icon(Icons.arrow_drop_down),
                              dropdownColor: Colors.white,
                              underline: const SizedBox(),
                              isExpanded: true,
                              hint: Text('Select Experience',
                                  style: PABTextTheme.content
                                      .copyWith(color: Colors.black))),
                        ),
                        const SizedBox(height: 16),

                        ///Maximum salary
                        Text(
                          "Maximum salary",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 9),
                        //Drop Down
                        Container(
                          width: double.infinity,
                          padding:
                              const EdgeInsets.only(left: 17.0, right: 17.0),
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
                              value: _ctc ??
                                  controller.myJobData.value.job!.salary,
                              icon: const Icon(Icons.arrow_drop_down),
                              dropdownColor: Colors.white,
                              underline: const SizedBox(),
                              isExpanded: true,
                              hint: Text('Enter Max Salary',
                                  style: PABTextTheme.content
                                      .copyWith(color: Colors.black))),
                        ),
                        const SizedBox(height: 16),

                        ///Technical Skills
                        Text(
                          "Technical Skills",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 9),
                        // Searchable Drop Down
                        CustomSearchableDropDown(
                          items: controller.skilldata,
                          backgroundColor: Colors.white,
                          label:
                              controller.myJobData.value.job!.skillsets!.isEmpty
                                  ? 'Choose Skills'
                                  : controller.myJobData.value.job!.skillsets
                                      .toString()
                                      .replaceAll('[', '')
                                      .replaceAll(',', ' / ')
                                      .replaceAll(']', ''),
                          multiSelectTag: 'Skills',
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
                          dropDownMenuItems: controller.skilldata.map((item) {
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
                        const SizedBox(height: 16),

                        ///Region
                        Text(
                          "Region",
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
                              items: region.map((item) {
                                return DropdownMenuItem(
                                  child: Text(item,
                                      style: PABTextTheme.content
                                          .copyWith(color: Colors.black)),
                                  value: item.toString(),
                                );
                              }).toList(),
                              onChanged: (String? newVal) {
                                setState(() {
                                  selectedRegion = newVal;
                                  print(selectedRegion);
                                });
                              },
                              value: selectedRegion == 'Select Your Region'
                                  ? controller.myJobData.value.job!.country
                                  : selectedRegion,
                              icon: const Icon(Icons.arrow_drop_down),
                              dropdownColor: Colors.white,
                              underline: const SizedBox(),
                              isExpanded: true,
                              hint: Text('Select Your Region',
                                  style: PABTextTheme.content
                                      .copyWith(color: Colors.black))),
                        ),
                        const SizedBox(height: 16),

                        ///Locations
                        Text(
                          "Locations",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 9),
                        // Searchable Drop Down
                        CustomSearchableDropDown(
                          items: controller.locationData,
                          backgroundColor: Colors.white,
                          label: controller.myJobData.value.job!.cities!.isEmpty
                              ? 'Choose Location'
                              : controller.myJobData.value.job!.cities
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(',', ' / ')
                                  .replaceAll(']', ''),
                          multiSelectTag: 'Location',
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
                          dropDownMenuItems:
                              controller.locationData.map((item) {
                            // print('location : ${item['location']}');
                            return item['location'];
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              _myLocationSelection = jsonDecode(value);
                              print(_myLocationSelection);
                              myLocationSelectedList =
                                  _myLocationSelection!.map((item) {
                                return item['location'];
                              }).toList();
                              print(myLocationSelectedList);
                            } else {
                              _myLocationSelection = [];
                            }
                          },
                        ),
                        const SizedBox(height: 16),

                        ///Deadline
                        Text(
                          "Deadline",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 9),
                        //Date calendar
                        SizedBox(
                          width: Get.width,
                          child: OutlinedButton(
                              child: _selectedDate1 ==
                                      controller.myJobData.value.job!.deadline!
                                  ? Text(
                                      DateFormat.yMMMd().format(controller
                                          .myJobData.value.job!.deadline!),
                                      style: PABTextTheme.content
                                          .copyWith(color: Colors.black))
                                  : Text(
                                      DateFormat.yMMMd().format(_selectedDate1),
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
                        const SizedBox(height: 16),

                        ///Education
                        PostJobContents(
                          heading: 'Education',
                          hintText: 'Educations required',
                          postJobController: educationController,
                        ),

                        ///Job Description
                        PostJobContents(
                          heading: 'Job Description',
                          hintText: 'Describe here',
                          height: 112,
                          postJobController: jobDescriptionController,
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),

                /// update Button
                const SizedBox(height: 32),
                Container(
                  width: Get.width,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    color: const Color(0xff54347D),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      if (_myLocationSelection != null &&
                          _mySkillsSelection != null &&
                          selectedRegion != null) {
                        String? deadline = DateFormat.yMMMd()
                            .format(_selectedDate1)
                            .toString();
                        bool x = await ApiServiceRecruiter.editJob(
                            jobTitleController.text,
                            positionAvailableController.text,
                            _jobType,
                            _experience,
                            _ctc,
                            (mySkillsSelectedList != null)
                                ? mySkillsSelectedList
                                : controller.myJobData.value.job!.cities,
                            (selectedRegion != null)
                                ? selectedRegion
                                : controller.myJobData.value.job!.country,
                            (myLocationSelectedList != null)
                                ? myLocationSelectedList
                                : controller.myJobData.value.job!.skillsets,
                            deadline,
                            educationController.text,
                            jobDescriptionController.text,
                            id);
                        if (x) {
                          Get.back();
                          myJobsController.fetchPostedJobsData();
                          // const MyJobsPage();
                          Get.back();
                          Get.snackbar('Successful',
                              'Job is updated successfully, Reload Page to see changes',
                              backgroundColor: Colors.white);
                        }

                        ///another part
                      } else {
                        Get.snackbar(
                          'Message',
                          'Skills, Location, Region fields must be filled',
                          backgroundColor: Colors.white,
                          colorText: Colors.red,
                        );
                      }
                    },
                    child: ALBigText(
                      text: 'Update Job',
                      color: Colors.white,
                      fontThickness: FontWeight.w500,
                      size: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      }
    });
  }
}

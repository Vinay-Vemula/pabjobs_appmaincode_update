import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pabjobs/common/checkbox_group.dart';
import 'package:pabjobs/common/filter_contents.dart';
import 'package:pabjobs/pages/job_seeker/filter/filter_controller.dart';
import 'package:pabjobs/pages/job_seeker/filter/filter_listing.dart';
import 'package:pabjobs/pages/job_seeker/filter/search_controller.dart';
// import 'package:grouped_buttons_ns/grouped_buttons_ns.dart';
// import 'package:flut_grouped_buttons/flut_grouped_buttons.dart';

import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  FilterController controller = Get.put(FilterController());

  final TextEditingController textController = TextEditingController();

  List companiescheckedlist = [];
  List experiencecheckedlist = [];
  List industrycheckedlist = [];
  List designationcheckedlist = [];
  List locationcheckedlist = [];
  List skillscheckedlist = [];
  List salarycheckedlist = [];
  List educationcheckedlist = [];

  List<String> companiesList = [];
  List<String> experienceList = [];
  List<String> industryList = [];
  List<String> designationList = [];
  List<String> locationList = [];
  List<String> skillsList = [];
  List<String> salaryList = [];
  List<String> educationList = [];

  String selected = "";

  List _data = [];
  Future<List> readLocationJson() async {
    final String response =
        await rootBundle.loadString('assets/json/locations.json');
    final data = await json.decode(response);
    _data = data;
    return _data;
  }

  List _data1 = [];
  Future<List> readSkillsJson() async {
    final String response =
        await rootBundle.loadString('assets/json/Skill.json');
    final data1 = await json.decode(response);
    _data1 = data1;
    print(_data1);
    return _data1;
  }

  List<String> top_companies = [
    "Perfex Technologies",
    "Zucol Services",
    "Amazon",
    "NCC",
    "Ashok Leyland",
  ];

  List experience = [
    "0-2 years",
    "2-5 years",
    "5-10 years",
    "10-15 years",
    "15+ years",
  ];

  List<String> industry = [
    "IT",
    "Marketing",
    "Content Writing",
  ];

  List<String> salary = [
    "0 - 10k",
    "10k - 20k",
    "20k - 30k",
    "30k - 40k",
    "40k - 60k",
    "60k - 100k++",
  ];

  List<String> education = [
    "Graduation",
    "Any Graduate",
    "B.Tech/B.E.",
    "B.Com",
  ];

  List<String> designation = [
    "Web Developer",
    "Full Stack Developer",
    "Flutter Developer",
    "Mobile Developer",
    "Developer",
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      selected = "topcompanies";
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  // const Divider(
                  //   color: Colors.black26,
                  //   thickness: 5,
                  // ),
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
                                      selected = "topcompanies";
                                    });
                                  },
                                  child: Container(
                                    width: Get.width * 0.4,
                                    color: (selected == "topcompanies")
                                        ? Colors.white
                                        : const Color(0xffF5F5F5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 13),
                                    child: Text("Top Companies",
                                        style: PABTextTheme.headline1.copyWith(
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
                                        style: PABTextTheme.headline1.copyWith(
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
                                    // filterList = location;
                                  },
                                  child: Container(
                                    width: Get.width * 0.4,
                                    color: (selected == "location")
                                        ? Colors.white
                                        : const Color(0xffF5F5F5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 13),
                                    child: Text("Location",
                                        style: PABTextTheme.headline1.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12)),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected = "industry";
                                    });
                                    // filterList = industry;
                                  },
                                  child: Container(
                                    width: Get.width * 0.4,
                                    color: (selected == "industry")
                                        ? Colors.white
                                        : const Color(0xffF5F5F5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 13),
                                    child: Text("Industry",
                                        style: PABTextTheme.headline1.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12)),
                                  ),
                                ),
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
                                        style: PABTextTheme.headline1.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12)),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // filterList = education;
                                    setState(() {
                                      selected = "education";
                                    });
                                  },
                                  child: Container(
                                    width: Get.width * 0.4,
                                    color: (selected == "education")
                                        ? Colors.white
                                        : const Color(0xffF5F5F5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 13),
                                    child: Text("Education",
                                        style: PABTextTheme.headline1.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12)),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selected = "salary";
                                    });
                                    // filterList = salary;
                                  },
                                  child: Container(
                                    width: Get.width * 0.4,
                                    color: (selected == "salary")
                                        ? Colors.white
                                        : const Color(0xffF5F5F5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 13),
                                    child: Text("Salary",
                                        style: PABTextTheme.headline1.copyWith(
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
                                        style: PABTextTheme.headline1.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12)),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          child: (() {
                            if (selected == "topcompanies") {
                              return Expanded(
                                child: Container(
                                  color: Colors.white,
                                  width: Get.width * 0.58,
                                  height: Get.height - 93,
                                  child: CheckboxGroup(
                                    labelStyle: PABTextTheme.content.copyWith(
                                        color: Colors.black, fontSize: 12),
                                    labels: top_companies,
                                    onChange: (bool isChecked1, String label1,
                                            int index1) =>
                                        print(
                                            "isChecked: $isChecked1   label: $label1  index: $index1"),
                                    onSelected: (List checked1) =>
                                        companiescheckedlist = checked1,
                                    selectedList: companiesList,
                                  ),
                                ),
                              );
                            } else if (selected == "experience") {
                              return Expanded(
                                child: Container(
                                  color: Colors.white,
                                  width: Get.width * 0.58,
                                  height: Get.height - 93,
                                  child: CheckboxGroup(
                                    labelStyle: PABTextTheme.content.copyWith(
                                        color: Colors.black, fontSize: 12),
                                    labels: experience,
                                    onChange: (bool isChecked2, String label2,
                                            int index2) =>
                                        print(
                                            "isChecked: $isChecked2   label: $label2  index: $index2"),
                                    onSelected: (List checked2) =>
                                        experiencecheckedlist = checked2,
                                    selectedList: experienceList,
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
                            } else if (selected == "industry") {
                              return Expanded(
                                child: Container(
                                  color: Colors.white,
                                  width: Get.width * 0.58,
                                  height: Get.height - 93,
                                  child: CheckboxGroup(
                                    labelStyle: PABTextTheme.content.copyWith(
                                        color: Colors.black, fontSize: 12),
                                    labels: industry,
                                    onChange: (bool isChecked4, String label4,
                                            int index4) =>
                                        print(
                                            "isChecked: $isChecked4   label: $label4  index: $index4"),
                                    onSelected: (List checked4) =>
                                        industrycheckedlist = checked4,
                                    selectedList: industryList,
                                  ),
                                ),
                              );
                            } else if (selected == "designation") {
                              return Expanded(
                                child: Container(
                                  color: Colors.white,
                                  width: Get.width * 0.58,
                                  height: Get.height - 93,
                                  child: CheckboxGroup(
                                    labelStyle: PABTextTheme.content.copyWith(
                                        color: Colors.black, fontSize: 12),
                                    labels: designation,
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
                            } else if (selected == "education") {
                              return Expanded(
                                child: Container(
                                  color: Colors.white,
                                  width: Get.width * 0.58,
                                  height: Get.height - 93,
                                  child: CheckboxGroup(
                                    labelStyle: PABTextTheme.content.copyWith(
                                        color: Colors.black, fontSize: 12),
                                    labels: education,
                                    onChange: (bool isChecked, String label,
                                            int index) =>
                                        print(
                                            "isChecked: $isChecked   label: $label  index: $index"),
                                    onSelected: (List checked) =>
                                        educationcheckedlist = checked,
                                    selectedList: educationList,
                                  ),
                                ),
                              );
                            } else if (selected == "salary") {
                              return Expanded(
                                child: Container(
                                  color: Colors.white,
                                  width: Get.width * 0.58,
                                  height: Get.height - 93,
                                  child: CheckboxGroup(
                                    labelStyle: PABTextTheme.content.copyWith(
                                        color: Colors.black, fontSize: 12),
                                    labels: salary,
                                    onChange: (bool isChecked, String label,
                                            int index) =>
                                        print(
                                            "isChecked: $isChecked   label: $label  index: $index"),
                                    onSelected: (List checked) =>
                                        salarycheckedlist = checked,
                                    selectedList: salaryList,
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
                      setState(() {
                        designationcheckedlist = [];
                        companiescheckedlist = [];
                        educationcheckedlist = [];
                        experiencecheckedlist = [];
                        industrycheckedlist = [];
                        locationcheckedlist = [];
                        skillscheckedlist = [];
                        salarycheckedlist = [];
                        companiesList = [];
                        experienceList = [];
                        industryList = [];
                        designationList = [];
                        locationList = [];
                        skillsList = [];
                        salaryList = [];
                        educationList = [];
                      });
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
                      Get.to(() => const FilterListing(), arguments: [
                        designationcheckedlist,
                        companiescheckedlist,
                        educationcheckedlist,
                        experiencecheckedlist,
                        industrycheckedlist,
                        locationcheckedlist,
                        skillscheckedlist,
                        salarycheckedlist
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

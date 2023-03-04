import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:pabjobs/pages/job_seeker/profile/my_resume/about_me/about_me.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/career_profile/career_profile.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/education/education.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/employment/employement.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/my_resume_controller.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/personal_details/personal_details.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class MyResume extends StatefulWidget {
  const MyResume({
    Key? key,
  }) : super(key: key);

  @override
  State<MyResume> createState() => _MyResumeState();
}

class _MyResumeState extends State<MyResume>
    with AutomaticKeepAliveClientMixin<MyResume> {
  // MyResumeController controller = Get.put(MyResumeController());

  //  @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //   controller.fetchData();
  //   });
  // }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return
        // Obx(() {
        //   if (controller.isLoading.value && controller.isJsonLoading.value) {
        //     return Container(
        //       color: PABColorTheme.backgrndColor,
        //       height: Get.height,
        //       child: const Center(
        //         child: CircularProgressIndicator(
        //           strokeWidth: 3,
        //           color: Colors.white,
        //         ),
        //       ),
        //     );
        //   } else {
        //     return
        DefaultTabController(
            length: 5,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: PABColorTheme.backgrndColor,
                title: const Text('My Resume'),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(119),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 36),
                    child: TabBar(
                      indicator: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(16), // Creates border
                          color: const Color(0xff2A2A2A)),
                      isScrollable: true,
                      tabs: [
                        Tab(
                            icon: SvgPicture.asset("assets/logos/about_me.svg"),
                            text: 'About Me'),
                        Tab(
                            icon: SvgPicture.asset(
                                "assets/logos/employement_icon.svg"),
                            text: 'Employement'),
                        Tab(
                            icon: SvgPicture.asset(
                                "assets/logos/education_icon.svg"),
                            text: 'Education'),
                        Tab(
                            icon: SvgPicture.asset(
                                "assets/logos/career_profile_icon.svg"),
                            text: 'Desired Career Profile'),
                        Tab(
                            icon: SvgPicture.asset(
                                "assets/logos/profile_details_icon.svg"),
                            text: 'Personal Details'),
                      ],
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  ScreenA(),
                  ScreenB(),
                  ScreenC(),
                  ScreenD(),
                  ScreenE(),
                ],
              ),
            ));
  }
}
//     );
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pabjobs/pages/job_seeker/profile/my_resume/employment/accomplishment/edit_accomplishment.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/employment/edit_employement_details/edit_employement_details_controller.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/employment/edit_employement_details/edit_employment_details.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/employment/project/project.dart';
import 'package:pabjobs/theme/text_theme.dart';

class ScreenB extends StatefulWidget {
  ScreenB({
    Key? key,
  }) : super(key: key);
  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: const Color(0xffF5F5F5),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 24),
            Text(
              "Employment",
              textAlign: TextAlign.left,
              style: PABTextTheme.headline1.copyWith(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 9),
            InkWell(
              onTap: () {
                Get.to(() => EmploymentDetails());
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      offset: Offset(
                        5,
                        5,
                      ),
                    )
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 23.0),
                child: Row(
                  children: [
                    Text(
                      "Click to enter/edit details",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Transform.rotate(
                        angle: 180 * pi / 180,
                        child: const Icon(Icons.arrow_back_ios, size: 20)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Project",
              textAlign: TextAlign.left,
              style: PABTextTheme.headline1.copyWith(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 9),
            InkWell(
              onTap: () {
                Get.to(() => ProjectDetails());
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      offset: Offset(
                        5,
                        5,
                      ),
                    )
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 23.0),
                child: Row(
                  children: [
                    Text(
                      "Click to enter/edit details",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Transform.rotate(
                        angle: 180 * pi / 180,
                        child: const Icon(Icons.arrow_back_ios, size: 20)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Accomplishment",
              textAlign: TextAlign.left,
              style: PABTextTheme.headline1.copyWith(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 9),
            InkWell(
              onTap: () {
                Get.to(() => AccomplishmentDetails());
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                      offset: Offset(
                        5,
                        5,
                      ),
                    )
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 23.0),
                child: Row(
                  children: [
                    Text(
                      "Click to enter/edit details",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Transform.rotate(
                        angle: 180 * pi / 180,
                        child: const Icon(Icons.arrow_back_ios, size: 20)),
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}

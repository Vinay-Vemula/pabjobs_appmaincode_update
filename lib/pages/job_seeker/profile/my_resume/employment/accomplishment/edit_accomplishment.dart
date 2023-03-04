import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/employment/accomplishment/research/research_paper.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/employment/accomplishment/certificate/certificate.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/employment/accomplishment/patent/patent.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/employment/accomplishment/presentation/presentation.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/employment/accomplishment/work_sample/work_sample.dart';
import 'package:pabjobs/theme/text_theme.dart';

class AccomplishmentDetails extends StatefulWidget {
  AccomplishmentDetails({Key? key}) : super(key: key);
  @override
  State<AccomplishmentDetails> createState() => _AccomplishmentDetailsState();
}

class _AccomplishmentDetailsState extends State<AccomplishmentDetails> {
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
                          child:
                              Icon(Icons.arrow_back_ios, color: Colors.black)),
                      const SizedBox(width: 25),
                      Text(
                        "Accomplishment",
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
                      "Work Sample",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 9),
                    InkWell(
                      onTap: () {
                        Get.to(() => WorkSample());
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
                                child:
                                    const Icon(Icons.arrow_back_ios, size: 20)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "White Paper / Research Publication",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 9),
                    InkWell(
                      onTap: () {
                        Get.to(() => ResearchPaper());
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
                                child:
                                    const Icon(Icons.arrow_back_ios, size: 20)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Presentation",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 9),
                    InkWell(
                      onTap: () {
                        Get.to(() => Presentation());
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
                                child:
                                    const Icon(Icons.arrow_back_ios, size: 20)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Patent",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 9),
                    InkWell(
                      onTap: () {
                        Get.to(() => Patent());
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
                                child:
                                    const Icon(Icons.arrow_back_ios, size: 20)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Certification",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 9),
                    InkWell(
                      onTap: () {
                        Get.to(() => EditCertificateDetails());
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
                                child:
                                    const Icon(Icons.arrow_back_ios, size: 20)),
                          ],
                        ),
                      ),
                    ),
                  ])),
            )));
  }
}

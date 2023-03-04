import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:pabjobs/pages/common/sign_up/sign_up.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class SelectUserType extends StatefulWidget {
  const SelectUserType({Key? key}) : super(key: key);

  @override
  State<SelectUserType> createState() => _SelectUserTypeState();
}

class _SelectUserTypeState extends State<SelectUserType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PABColorTheme.backgrndColor,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 124),
            Text(
              "Are you a Job Seeker Or Recruiter",
              style: PABTextTheme.headline1
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              "Mention yours before you register",
              style: PABTextTheme.headline2.copyWith(color: Colors.white54),
            ),
            const SizedBox(height: 42),
            InkWell(
              onTap: () {
                Get.off(
                  () => const SignUp(
                    userType: "applicant",
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 24),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        PABColorTheme.purpleColor,
                        PABColorTheme.purpleGradientColor,
                      ],
                    )),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 27),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Job Seeker",
                              style: PABTextTheme.headline1
                                  .copyWith(fontSize: 20, color: Colors.white)),
                          Text("Find the right jobs for you",
                              style: PABTextTheme.headline2
                                  .copyWith(color: Colors.white)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.8),
                      child: SvgPicture.asset(
                          "assets/images/job_seeker_avatar.svg"),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.off(
                  () => const SignUp(
                    userType: "recruiter",
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 24),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        PABColorTheme.purpleColor,
                        PABColorTheme.purpleGradientColor,
                      ],
                    )),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 27),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Recruiter",
                              style: PABTextTheme.headline1
                                  .copyWith(fontSize: 20, color: Colors.white)),
                          Text("Hire the person for your job",
                              style: PABTextTheme.headline2
                                  .copyWith(color: Colors.white)),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.8),
                      child: SvgPicture.asset(
                          "assets/images/recruiter_avatar.svg"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

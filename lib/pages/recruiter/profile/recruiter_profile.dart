// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:pabjobs/common/constant.dart';
import 'package:pabjobs/pages/recruiter/my_jobs/my_jobs_page.dart';
import 'package:pabjobs/pages/recruiter/profile/change_password/change_password.dart';
import 'package:pabjobs/pages/recruiter/profile/recruiter_profile_controller.dart';
import 'package:pabjobs/splash_screen.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

import 'company_profile/company_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static Box<String> userInfo = Hive.box<String>(Constant.dbName);

  Clear() {
    userInfo.clear();
  }

  RecruiterProfileController recruiterController =
      Get.put(RecruiterProfileController());

  @override
  void initState() {
    super.initState();
    recruiterController.fetchProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (recruiterController.isLoading.value) {
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
        print(
            'image url: ${recruiterController.profileData.value.profileImage}');
        return Scaffold(
            body: Stack(
          children: [
            Container(
              width: Get.width,
              color: PABColorTheme.backgrndColor,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 87),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: (recruiterController
                                    .profileData.value.profileImage ==
                                null)
                            ? Image.asset("assets/images/profile_dp.png",
                                fit: BoxFit.cover, height: 80, width: 80)
                            : Image.network(
                                recruiterController
                                    .profileData.value.profileImage!,
                                fit: BoxFit.cover,
                                height: 80,
                                width: 80),
                      ))),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      recruiterController.profileData.value.companyname == null
                          ? "Unknown Company Name"
                          : recruiterController.profileData.value.companyname!,
                      style: PABTextTheme.headline1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Center(
                    child: Text(
                      recruiterController.profileData.value.websitelink == null
                          ? "www.unknownCompany.com"
                          : recruiterController.profileData.value.websitelink!,
                      style:
                          PABTextTheme.headline2.copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Center(
                    child: Text(
                      recruiterController.profileData.value.organizationType ==
                              null
                          ? "Unknown Organisation Type"
                          : recruiterController
                              .profileData.value.organizationType!,
                      style: PABTextTheme.headline2
                          .copyWith(color: Colors.white54),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox.expand(
              child: DraggableScrollableSheet(
                // snap: true,
                initialChildSize: .65,
                minChildSize: .65,
                maxChildSize: .72,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      height: Get.height * 0.7,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: const BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24.0),
                            topRight: Radius.circular(24.0),
                          )),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            Container(
                                width: 39,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                )),
                                child: const Divider(
                                  thickness: 5,
                                )),
                            const SizedBox(height: 25),
                            InkWell(
                              onTap: () {
                                Get.to(() => const CompanyProfile());
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    )),
                                child: ListTile(
                                  leading: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xffE7D4FF),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        )),
                                    height: 42,
                                    width: 42,
                                    child: SvgPicture.asset(
                                      'assets/logos/edit_account_circle.svg',
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                  title: Text('Company Profile',
                                      style: PABTextTheme.content.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  trailing: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Transform.rotate(
                                        angle: 180 * pi / 180,
                                        child: const Icon(Icons.arrow_back_ios,
                                            color: Color(0xffC8C8C8))),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                            InkWell(
                              onTap: () {
                                Get.to(() => MyJobsPage());
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    )),
                                child: ListTile(
                                  leading: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xffD4E8FF),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        )),
                                    height: 42,
                                    width: 42,
                                    child: SvgPicture.asset(
                                      'assets/logos/my_jobs_logo.svg',
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                  title: Text('My Jobs',
                                      style: PABTextTheme.content.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  trailing: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Transform.rotate(
                                        angle: 180 * pi / 180,
                                        child: const Icon(Icons.arrow_back_ios,
                                            color: Color(0xffC8C8C8))),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                            InkWell(
                              onTap: () {
                                Get.to(() => const RecruiterChangePassword());
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    )),
                                child: ListTile(
                                  leading: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xffD4FFEB),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        )),
                                    height: 42,
                                    width: 42,
                                    child: SvgPicture.asset(
                                      'assets/logos/change_password_logo.svg',
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                  title: Text('Change Password',
                                      style: PABTextTheme.content.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  trailing: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Transform.rotate(
                                        angle: 180 * pi / 180,
                                        child: const Icon(Icons.arrow_back_ios,
                                            color: Color(0xffC8C8C8))),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                            InkWell(
                              onTap: () {
                                Clear();
                                Get.offAll(() => const SplashScreen());
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16),
                                    )),
                                child: ListTile(
                                  leading: Container(
                                    decoration: const BoxDecoration(
                                        color: Color(0xffF5F5F5),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(12),
                                        )),
                                    height: 42,
                                    width: 42,
                                    child: SvgPicture.asset(
                                      'assets/logos/logout_icon.svg',
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                  title: Text('Logout',
                                      style: PABTextTheme.content.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  trailing: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Transform.rotate(
                                        angle: 180 * pi / 180,
                                        child: const Icon(Icons.arrow_back_ios,
                                            color: Color(0xffC8C8C8))),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  );
                },
              ),
            )
          ],
        ));
      }
    });
  }
}

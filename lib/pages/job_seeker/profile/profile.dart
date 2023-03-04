import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:pabjobs/common/constant.dart';
import 'package:pabjobs/pages/job_seeker/applied_jobs/applied_jobs.dart';
import 'package:pabjobs/pages/job_seeker/homepage/job_alert/job_alert.dart';
import 'package:pabjobs/pages/job_seeker/profile/change_password/change_password.dart';
import 'package:pabjobs/pages/job_seeker/profile/edit_profile/edit_profile_details.dart';
import 'package:pabjobs/pages/job_seeker/profile/my_resume/my_resume.dart';
import 'package:pabjobs/pages/job_seeker/profile/profile_controller.dart';
import 'package:pabjobs/splash_screen.dart';

import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  ProfileController controller = Get.put(ProfileController());

  static Box<String> userInfo = Hive.box<String>(Constant.dbName);

  Clear() {
    userInfo.clear();
    String? token = userInfo.get('token');
    // print(token);
  }

  @override
  void initState() {
    super.initState();
    controller.fetchUserDetails();
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
                          child: (controller.data.value.profileImage == null)
                              ? Image.asset("assets/images/profile_dp.png",
                                  fit: BoxFit.cover, height: 80, width: 80)
                              : (controller.data.value.profileImage == "")
                                  ? Image.asset("assets/images/profile_dp.png",
                                      fit: BoxFit.cover, height: 80, width: 80)
                                  : Image.network(
                                      controller.data.value.profileImage!,
                                      fit: BoxFit.cover,
                                      height: 80,
                                      width: 80),
                        ))),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        controller.data.value.name!,
                        style: PABTextTheme.headline1.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Center(
                      child: Text(
                        controller.data.value.email!,
                        style: PABTextTheme.headline2
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Center(
                      child: Text(
                        "+91 " + controller.data.value.contactNumber.toString(),
                        style: PABTextTheme.headline2
                            .copyWith(color: Colors.white54),
                      ),
                    ),
                  ]),
            ),
            SizedBox.expand(
              child: DraggableScrollableSheet(
                snap: true,
                initialChildSize: .60,
                minChildSize: .60,
                maxChildSize: .80,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        height: Get.height * 0.8,
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
                                  Get.to(() => const EditProfileDetails());
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
                                    title: Text('Edit Profile',
                                        style: PABTextTheme.content.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    trailing: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Transform.rotate(
                                          angle: 180 * pi / 180,
                                          child:
                                              const Icon(Icons.arrow_back_ios)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 14),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const MyResume());
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
                                        'assets/logos/my_resume_icon.svg',
                                        height: 20,
                                        width: 20,
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                    title: Text('My Resume',
                                        style: PABTextTheme.content.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    trailing: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Transform.rotate(
                                          angle: 180 * pi / 180,
                                          child:
                                              const Icon(Icons.arrow_back_ios)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 14),
                              InkWell(
                                onTap: () {
                                  Get.to(() => ChangePassword());
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
                                          color: Color(0xffFFF9D4),
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
                                    title: Text('Change Password',
                                        style: PABTextTheme.content.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    trailing: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Transform.rotate(
                                          angle: 180 * pi / 180,
                                          child:
                                              const Icon(Icons.arrow_back_ios)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 14),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const AppliedJobs(
                                        backButton: 'yes',
                                      ));
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
                                        'assets/logos/applied_jobs_icon.svg',
                                        height: 20,
                                        width: 20,
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                    title: Text('Applied Jobs',
                                        style: PABTextTheme.content.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    trailing: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Transform.rotate(
                                          angle: 180 * pi / 180,
                                          child:
                                              const Icon(Icons.arrow_back_ios)),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 14),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const JobAlerts());
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
                                          color: Color(0xffFFB2C4),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          )),
                                      height: 42,
                                      width: 42,
                                      child: SvgPicture.asset(
                                        'assets/logos/job_alert_icon.svg',
                                        height: 20,
                                        width: 20,
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                    title: Text('Job Alert',
                                        style: PABTextTheme.content.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    trailing: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Transform.rotate(
                                          angle: 180 * pi / 180,
                                          child:
                                              const Icon(Icons.arrow_back_ios)),
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
                                          child:
                                              const Icon(Icons.arrow_back_ios)),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      )
                      // )
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

import 'package:pabjobs/common/time_ago.dart';
import 'package:pabjobs/pages/recruiter/my_jobs/view_page/view_page_controller.dart';

import '../../../../common/applicant_listing_big_text.dart';
import '../../../../common/applicant_listing_small_text.dart';
import '../../../../theme/color_theme.dart';

class ViewPage extends StatefulWidget {
  String image;
  String jobTitle;
  String companyName;
  List<String> location;
  DateTime createdAt;
  int jobOpening;
  String salary;
  String jobType;
  String experience;
  String numberOfApplicants;
  String education;
  String jobDescription;
  String rolesAndResponsibilities;
  String industryType;
  String email;
  String phone;
  List<String> skills;

  ViewPage(
      {required this.image,
      required this.jobTitle,
      required this.companyName,
      required this.location,
      required this.createdAt,
      required this.jobOpening,
      required this.salary,
      required this.jobType,
      required this.experience,
      required this.numberOfApplicants,
      required this.education,
      required this.jobDescription,
      required this.rolesAndResponsibilities,
      required this.industryType,
      required this.email,
      required this.phone,
      required this.skills,
      Key? key})
      : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  bool isFavorite = false;
  ViewPageController controller = Get.put(ViewPageController());

  //time Stamp is taken to time from createdAt
  late int time = widget.createdAt.millisecondsSinceEpoch;
  var id = Get.arguments;
  @override
  void initState() {
    super.initState();
    controller.fetchViewContents(id);
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
          backgroundColor: PABColorTheme.backgrndColor,
          body: SafeArea(
            child: Stack(
              children: [
                ///Back Button
                Positioned(
                  left: 20,
                  top: 54,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),

                ///Bg Container
                Positioned(
                  left: 0,
                  right: 0,
                  top: 124,
                  bottom: 0,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      /// Background Container white
                      Container(
                        padding: const EdgeInsets.only(
                            top: 250, left: 25, right: 25),
                        width: Get.width,
                        height: Get.height,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///Number of Applicants
                              ALBigText(
                                text: 'Number of Applicants',
                                size: 14,
                                fontThickness: FontWeight.bold,
                              ),
                              const SizedBox(height: 6),
                              ALBigText(
                                text: widget.numberOfApplicants,
                                size: 12,
                                fontThickness: FontWeight.w400,
                              ),
                              const SizedBox(height: 12),

                              ///Education
                              ALBigText(
                                text: 'Education',
                                size: 14,
                                fontThickness: FontWeight.bold,
                              ),
                              const SizedBox(height: 6),
                              Wrap(
                                children: [
                                  ALBigText(
                                    text: widget.education,
                                    size: 12,
                                    fontThickness: FontWeight.w400,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),

                              ///Job description
                              ALBigText(
                                text: 'Job description',
                                size: 14,
                                fontThickness: FontWeight.bold,
                              ),
                              const SizedBox(height: 6),
                              Wrap(
                                children: [
                                  ALBigText(
                                    text: widget.jobDescription,
                                    size: 12,
                                    fontThickness: FontWeight.w400,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),

                              ///Roles and Responsibilities
                              ALBigText(
                                text: 'Roles and Responsibilities',
                                size: 14,
                                fontThickness: FontWeight.bold,
                              ),
                              const SizedBox(height: 6),
                              Wrap(
                                children: [
                                  ALBigText(
                                    text: widget.rolesAndResponsibilities == ' '
                                        ? "Not Updated"
                                        : widget.rolesAndResponsibilities,
                                    size: 12,
                                    fontThickness: FontWeight.w400,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),

                              ///Industry Type
                              ALBigText(
                                text: 'Industry Type',
                                size: 14,
                                fontThickness: FontWeight.bold,
                              ),
                              const SizedBox(height: 6),
                              ALBigText(
                                text: widget.industryType,
                                size: 12,
                                fontThickness: FontWeight.w400,
                              ),
                              const SizedBox(height: 12),

                              ///Email
                              ALBigText(
                                text: 'E mail',
                                size: 14,
                                fontThickness: FontWeight.bold,
                              ),
                              const SizedBox(height: 6),
                              ALBigText(
                                text: widget.email,
                                size: 12,
                                fontThickness: FontWeight.w400,
                              ),
                              const SizedBox(height: 12),

                              ///Mobile No
                              ALBigText(
                                text: 'Mobile No',
                                size: 14,
                                fontThickness: FontWeight.bold,
                              ),
                              const SizedBox(height: 6),
                              ALBigText(
                                text: widget.phone,
                                size: 12,
                                fontThickness: FontWeight.w400,
                              ),
                              const SizedBox(height: 12),

                              ///KeySkills
                              ALBigText(
                                text: 'Key Skills',
                                size: 14,
                                fontThickness: FontWeight.bold,
                              ),
                              const SizedBox(height: 6),
                              Wrap(
                                ///Skills are passed to here
                                spacing: 12,
                                runSpacing: 12,
                                children: List.generate(
                                  widget.skills.length,
                                  (index) => Container(
                                    height: 28,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 6),
                                    decoration: BoxDecoration(
                                      // color: Colors.black,
                                      color: const Color(0xffFAFAFA),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: ALSmallText(
                                      text: widget.skills[index],
                                      // color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 55),
                            ],
                          ),
                        ),
                      ),

                      ///Avatar
                      Positioned(
                        top: -30,
                        left: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: controller
                                      .contents.value.postedby!.profileImage !=
                                  null
                              ? controller.contents.value.postedby!
                                          .profileImage !=
                                      ""
                                  ? ClipOval(
                                      child: Image.network(
                                        controller.contents.value.postedby!
                                            .profileImage!,
                                        height: 57,
                                        width: 57,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Image.asset(widget.image)
                              : Image.asset(widget.image),
                          // Image.asset(widget.image),
                        ),
                      ),

                      ///Non Scrollable Area
                      Positioned(
                        top: 35,
                        left: 0,
                        right: 0,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ///job Name
                            ALBigText(
                              text: widget.jobTitle,
                              size: 18,
                              fontThickness: FontWeight.bold,
                            ),

                            ///company Name
                            ALBigText(
                              text: widget.companyName,
                              size: 14,
                              fontThickness: FontWeight.bold,
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: Get.width,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/location-view-icon.svg'),
                                      const SizedBox(width: 5),
                                      Container(
                                        padding: const EdgeInsets.only(left: 1),
                                        width: 65,
                                        height: 15,
                                        child: Marquee(
                                          text: widget.location.isEmpty
                                              ? 'No Location Updated'
                                              : widget.location
                                                  .toString()
                                                  .replaceAll(',', ' / ')
                                                  .replaceAll('[', '')
                                                  .replaceAll(']', '      '),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                          velocity: 30,
                                          pauseAfterRound:
                                              const Duration(seconds: 2),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(
                                      'assets/images/dot_symbol.svg'),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/access-timer.svg'),
                                      const SizedBox(width: 5),
                                      ALBigText(
                                        text:
                                            '${TimeAgo.timeAgoSinceDate(time)}',
                                        size: 12,
                                        fontThickness: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                  SvgPicture.asset(
                                      'assets/images/dot_symbol.svg'),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/credit-card.svg'),
                                      const SizedBox(width: 5),
                                      ALBigText(
                                        text: widget.jobOpening.toString() +
                                            ' Job Openings',
                                        size: 12,
                                        fontThickness: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              indent: 20,
                              endIndent: 20,
                              // color: Colors.black,
                              color: Color(0xfffafafa),
                              thickness: 1,
                              height: 30,
                            ),

                            ///Salary - job type - experience
                            Container(
                              width: Get.width,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ///Salary
                                  Column(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/salary-icon.svg'),
                                      const SizedBox(height: 8),
                                      ALBigText(
                                        text: 'Salary',
                                        size: 12,
                                        fontThickness: FontWeight.w600,
                                        color: const Color(0xff212121),
                                      ),
                                      ALBigText(
                                        text: '₹ ' + widget.salary.toString(),
                                        color: const Color(0xff212121),
                                      )
                                    ],
                                  ),

                                  ///JobType
                                  Column(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/fulltime-icon.svg'),
                                      const SizedBox(height: 8),
                                      ALBigText(
                                        text: 'Job Type',
                                        size: 12,
                                        fontThickness: FontWeight.w600,
                                        color: const Color(0xff212121),
                                      ),
                                      ALBigText(
                                        text: widget.jobType,
                                        color: const Color(0xff212121),
                                      )
                                    ],
                                  ),

                                  ///Experience
                                  Column(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/experience-icon.svg'),
                                      const SizedBox(height: 8),
                                      ALBigText(
                                        text: 'Experience',
                                        size: 12,
                                        fontThickness: FontWeight.w600,
                                        color: const Color(0xff212121),
                                      ),
                                      ALBigText(
                                        text: widget.experience,
                                        color: const Color(0xff212121),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}

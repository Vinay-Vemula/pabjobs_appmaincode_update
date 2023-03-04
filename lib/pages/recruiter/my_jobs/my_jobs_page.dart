import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pabjobs/common/applicant_listing_big_text.dart';
import 'package:pabjobs/common/my_jobs_card.dart';
import 'package:pabjobs/entities/api_service_recruiter.dart';
import 'package:pabjobs/pages/recruiter/add_optinal_details/add_optional_details.dart';
import 'package:pabjobs/pages/recruiter/my_jobs/edit_page/edit_page.dart';
import 'package:pabjobs/pages/recruiter/my_jobs/view_page/view_page.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:get/get.dart';

import '../post_job/post_job_page.dart';
import 'applicant_listing/applicant_listing_controlle.dart';
import 'applicant_listing/applicant_listing_page.dart';
import 'my_job_controller.dart';

class MyJobsPage extends StatefulWidget {
  const MyJobsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyJobsPage> createState() => _MyJobsPageState();
}

class _MyJobsPageState extends State<MyJobsPage> {
  MyJobController controller = Get.put(MyJobController());
  final applicantController = Get.put(ApplicantListingController());
  // var id = controller.jobData[index].id
  var id = Get.arguments;
  @override
  void initState() {
    super.initState();
    controller.fetchPostedJobsData();
    // applicantController.fetchApplicantData(id);
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
        return SafeArea(
          child: Scaffold(
            backgroundColor: PABColorTheme.recruiterPageColor,
            body: Column(
              children: [
                ///AppBar
                Container(
                  padding: const EdgeInsets.only(
                      left: 22, right: 22, top: 59, bottom: 26),
                  height: 125,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///My Jobs Text
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/Job.svg',
                            color: Colors.white,
                            width: 19.27,
                            height: 17.41,
                          ),
                          const SizedBox(width: 10),
                          ALBigText(
                            text: 'My Jobs',
                            color: Colors.white,
                            size: 18,
                            fontThickness: FontWeight.bold,
                          )
                        ],
                      ),

                      ///Post Job Button
                      InkWell(
                        onTap: () {
                          Get.to(() => const PostJob());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xff31283D),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/Post add icon.png',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(width: 8),
                              ALBigText(
                                text: 'Post a Job',
                                color: Colors.white,
                                size: 12,
                                fontThickness: FontWeight.w500,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                ///Body
                controller.jobData.isEmpty
                    ? Expanded(
                        child: SizedBox(
                            height: Get.height,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ALBigText(text: 'No Jobs Found'),
                                  const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => const PostJob());
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: PABColorTheme.darkbuttonColor,
                                      ),
                                      child: ALBigText(
                                        text: 'Post a Job',
                                        color: Colors.white,
                                        size: 12,
                                        fontThickness: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ))) //no jobs found
                    : Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          itemCount: controller.jobData.length,
                          // itemExtent: 2,
                          itemBuilder: (context, index) => Column(
                            children: [
                              MyJobsCard(
                                jobTitle:
                                    controller.jobData[index].title.toString(),
                                openings: controller.jobData[index].maxPositions
                                    .toString(),
                                index: index,
                                onTap: () => Get.to(
                                  () => ApplicantListingPage(
                                    pageTitle: controller.jobData[index].title
                                        .toString(),
                                  ),
                                  arguments: controller.jobData[index].id,
                                ),
                                onTapView: () => Get.to(
                                  ViewPage(
                                    image: 'assets/logos/company_logo.png',
                                    jobTitle: controller.jobData[index].title!,
                                    companyName: controller
                                        .jobData[index].recruiter!.companyname!,
                                    location: controller.jobData[index].cities!,
                                    createdAt: controller
                                        .jobData[index].dateOfPosting!,
                                    jobOpening:
                                        controller.jobData[index].maxPositions!,
                                    salary: controller.jobData[index].salary!,
                                    jobType: controller.jobData[index].jobType!,
                                    experience:
                                        controller.jobData[index].experience!,
                                    numberOfApplicants: applicantController
                                        .applicant.length
                                        .toString(),
                                    education:
                                        controller.jobData[index].education!,
                                    jobDescription:
                                        controller.jobData[index].description!,
                                    rolesAndResponsibilities: ' ',
                                    industryType: controller.jobData[index]
                                        .recruiter!.organizationType!,
                                    email: controller
                                        .jobData[index].recruiter!.email!,
                                    phone: controller.jobData[index].recruiter!
                                        .contactNumber!
                                        .toString(),
                                    skills:
                                        controller.jobData[index].skillsets!,
                                  ),
                                  arguments: controller.jobData[index].id,
                                ),
                                onTapEdit: () => {
                                  Get.to(
                                    () => EditPage(
                                        // jobTitle:
                                        //     controller.jobData[index].title!,
                                        // noOfPosition: controller
                                        //     .jobData[index].maxPositions!,
                                        // education:
                                        //     controller.jobData[index].education!,
                                        // description: controller
                                        //     .jobData[index].description!,
                                        // jobType: controller
                                        //             .jobData[index].jobType ==
                                        //         null
                                        //     ? null
                                        //     : controller.jobData[index].jobType!,
                                        // experience:
                                        //     controller.jobData[index].experience!,
                                        // maxSalary:
                                        //     controller.jobData[index].salary!,
                                        // skills:
                                        //     controller.jobData[index].skillsets!,
                                        // region:
                                        //     controller.jobData[index].country!,
                                        // location:
                                        //     controller.jobData[index].cities!,
                                        // deadline:
                                        //     controller.jobData[index].deadline!,
                                        ),
                                    arguments: controller.jobData[index].id,
                                  ),
                                  // print(controller.jobData[index].deadline!),
                                },
                                onTapDelete: () async {
                                  await ApiServiceRecruiter.deleteJobById(
                                      controller.jobData[index].id!);
                                  setState(() {
                                    controller.fetchPostedJobsData();
                                    Get.snackbar('Message',
                                        '${controller.jobData[index].title!} deleted successfully',
                                        backgroundColor: Colors.white);
                                  });
                                },
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ), //job cards
              ],
            ),
          ),
        );
      }
    });
  }
}

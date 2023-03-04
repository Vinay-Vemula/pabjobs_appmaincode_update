import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import 'package:pabjobs/common/applied_jobs_card.dart';
import 'package:pabjobs/pages/job_seeker/applied_jobs/applied_jobs_controller.dart';
import 'package:pabjobs/pages/job_seeker/homepage/job_details.dart/job_details.dart';
import 'package:pabjobs/pages/job_seeker/homepage/job_details.dart/job_details_controller.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class AppliedJobs extends StatefulWidget {
  final String backButton;
  const AppliedJobs({Key? key, required this.backButton}) : super(key: key);

  @override
  State<AppliedJobs> createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  AppliedJobsController controller = Get.put(AppliedJobsController());
  JobDetailsController jobDetailsController = Get.put(JobDetailsController());

  @override
  void initState() {
    super.initState();
    controller.fetchAppliedJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Container(
          color: const Color(0xffF5F5F5),
          height: Get.height,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: PABColorTheme.backgrndColor,
            ),
          ),
        );
      } else {
        return (controller.appliedJobs.isEmpty)
            ? Scaffold(
                appBar: (widget.backButton == "yes")
                    ? AppBar(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        iconTheme: const IconThemeData(color: Colors.black),
                        title: Text("Applied Jobs",
                            style: PABTextTheme.headline1.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      )
                    : const PreferredSize(
                        preferredSize: Size.fromHeight(70), child: SizedBox()),
                body: Container(
                    color: Colors.white,
                    height: Get.height,
                    width: Get.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/No_list_found.png",
                              width: 280, height: 280),
                          Text("We cannot find any",
                              style: PABTextTheme.content
                                  .copyWith(color: Colors.black)),
                          Text("Applied Jobs",
                              style: PABTextTheme.headline1
                                  .copyWith(color: Colors.black)),
                        ])),
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xffF5F5F5),
                  elevation: 0,
                  iconTheme: const IconThemeData(color: Colors.black),
                  title: Text("Applied Jobs",
                      style: PABTextTheme.headline1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
                body: Container(
                    color: const Color(0xffF5F5F5),
                    width: Get.width,
                    height: Get.height,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: SingleChildScrollView(
                        child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            // maxHeight: Get.height * 2,
                            minHeight:
                                100 * controller.appliedJobs.length.toDouble()),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.appliedJobs.length,
                            itemBuilder: (context, index) {
                              DateTime now = controller
                                  .appliedJobs[index].dateOfApplication!;
                              String date = Jiffy(now).format('do MMM yy');

                              return AppliedJobCard(
                                name: controller.appliedJobs[index].job!.title!,
                                description:
                                    (controller.appliedJobs[index].recruiter ==
                                            null)
                                        ? "Unknown"
                                        : controller.appliedJobs[index]
                                            .recruiter!.companyname!,
                                jobtype:
                                    controller.appliedJobs[index].job!.jobType!,
                                place: "  " +
                                    controller
                                        .appliedJobs[index].job!.cities![0],
                                salary: "₹ " +
                                    controller.appliedJobs[index].job!.salary
                                        .toString(),
                                appliedDate: "Applied On " + date,
                                callback: () {
                                  Get.to(() => const JobDetails(),
                                      arguments: controller
                                          .appliedJobs[index].job!.id);
                                },
                                image: (controller
                                            .appliedJobs[index].recruiter ==
                                        null)
                                    ? Image.asset(
                                        "assets/logos/company_logo.png")
                                    : (controller.appliedJobs[index].recruiter!
                                                .profileImage !=
                                            "")
                                        ? Image.network(controller
                                            .appliedJobs[index]
                                            .recruiter!
                                            .profileImage!)
                                        : Image.asset(
                                            "assets/logos/company_logo.png"),
                              );
                            }),
                      ),
                    ))));
      }
    });
  }
}

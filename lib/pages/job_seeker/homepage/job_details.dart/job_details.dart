import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/pages/job_seeker/common/reusable_scaffold.dart';
import 'package:pabjobs/pages/job_seeker/homepage/job_details.dart/job_details_controller.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({Key? key}) : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  JobDetailsController controller = Get.put(JobDetailsController());

  var Jobid = Get.arguments;

  @override
  void initState() {
    super.initState();
    print(Jobid);
    controller.FetchJobDetailsbyId(Jobid);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Container(
          color: Color(0xffF5F5F5),
          height: Get.height,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: PABColorTheme.backgrndColor,
            ),
          ),
        );
      } else {
        DateTime now = controller.data.value.job!.dateOfPosting!;
        String date = Jiffy(now).format('do MMM yy');

        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                color: PABColorTheme.backgrndColor,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: Get.width,
                          height: Get.height * 0.15,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          color: PABColorTheme.backgrndColor,
                          // child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       const SizedBox(height: 54),
                          //       Row(
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             ClipRRect(
                          //               borderRadius:
                          //                   BorderRadius.circular(263),
                          //               child: Container(
                          //                 height: 50,
                          //                 width: 50,
                          //                 color: PABColorTheme.backgrndColor,
                          //                 child: InkWell(
                          //                     onTap: () {
                          //                       Get.back();
                          //                     },
                          //                     child: const Icon(
                          //                         Icons.arrow_back_ios_new,
                          //                         color: Colors.white)),
                          //               ),
                          //             )
                          //             // const Spacer(),
                          //             // InkWell(
                          //             //   onTap: () {},
                          //             //   child: Image.asset(
                          //             //     "assets/logos/Icon feather-heart.png",
                          //             //     height: 20,
                          //             //     width: 20,
                          //             //   ),
                          //             // ),
                          //           ]),
                          //     ]),
                        ),
                        Container(
                          // height: Get.height + 330,
                          constraints: BoxConstraints(
                            minHeight: Get.height * .8,
                          ),
                          width: Get.width,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.0),
                                topRight: Radius.circular(24.0),
                              )),

                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 39),
                                Text(controller.data.value.job!.title!,
                                    style: PABTextTheme.headline1.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(
                                    (controller.data.value.postedby == null)
                                        ? "Unknown"
                                        : controller
                                            .data.value.postedby!.companyname!,
                                    style: PABTextTheme.headline1.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(height: 9),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.only(right: 6),
                                        child: SvgPicture.asset(
                                            "assets/logos/Icon material-location-on.svg",
                                            color: Colors.black)),
                                    Text(
                                      controller.data.value.job!.cities![0],
                                      style: PABTextTheme.headline1.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w100,
                                          fontSize: 11),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 13),
                                      height: 4,
                                      width: 4,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffC8C8C8),
                                      ),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(right: 6),
                                        child: SvgPicture.asset(
                                            "assets/logos/clock_icon.svg",
                                            color: Colors.black)),
                                    Text(
                                      date,
                                      style: PABTextTheme.headline1.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w100,
                                          fontSize: 11),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 41),
                                Row(
                                  children: [
                                    Container(
                                      child: Expanded(
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                                child: Container(
                                                    height: 60,
                                                    width: 60,
                                                    color: Colors.black,
                                                    child: SvgPicture.asset(
                                                        "assets/logos/salary_icon.svg"))),
                                            const SizedBox(height: 8),
                                            Text(
                                              "Salary",
                                              style: PABTextTheme.headline1
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12,
                                                      color: Colors.black),
                                            ),
                                            Text(
                                              "₹ " +
                                                  controller
                                                      .data.value.job!.salary
                                                      .toString(),
                                              style: PABTextTheme.headline1
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Expanded(
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                                child: Container(
                                                    height: 60,
                                                    width: 60,
                                                    color: Colors.black,
                                                    child: SvgPicture.asset(
                                                        "assets/logos/job_type_icon.svg"))),
                                            const SizedBox(height: 8),
                                            Text(
                                              "Job Type",
                                              style: PABTextTheme.headline1
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12,
                                                      color: Colors.black),
                                            ),
                                            Text(
                                              controller
                                                  .data.value.job!.jobType!,
                                              style: PABTextTheme.headline1
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(60),
                                              child: Container(
                                                  height: 60,
                                                  width: 60,
                                                  color: Colors.black,
                                                  child: SvgPicture.asset(
                                                      "assets/logos/experience_icon.svg"))),
                                          const SizedBox(height: 8),
                                          Text(
                                            "Experience",
                                            style: PABTextTheme.headline1
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12,
                                                    color: Colors.black),
                                          ),
                                          Text(
                                            controller
                                                .data.value.job!.experience!,
                                            style: PABTextTheme.headline1
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 36),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Job description",
                                    style: PABTextTheme.headline1.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                (controller.data.value.postedby == null)
                                    ? Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Nil",
                                          style: PABTextTheme.headline1
                                              .copyWith(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                  color: Colors.black),
                                        ),
                                      )
                                    : Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Please find below job description if interested please do share your updated resume along with contact information to " +
                                              controller
                                                  .data.value.postedby!.email!,
                                          style: PABTextTheme.headline1
                                              .copyWith(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                  color: Colors.black),
                                        ),
                                      ),
                                const SizedBox(height: 24),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Key Skills",
                                    style: PABTextTheme.headline1.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Container(
                                  height: 28,
                                  constraints: BoxConstraints(
                                    minWidth: Get.width * .8,
                                  ),
                                  width: Get.width,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            // physics:
                                            // const NeverScrollableScrollPhysics(),
                                            itemCount: controller.data.value
                                                .job!.skillsets!.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin: const EdgeInsets.only(
                                                    right: 6),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 26,
                                                        vertical: 7),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffFAFAFA),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Text(
                                                  controller.data.value.job!
                                                      .skillsets![index],
                                                  style: PABTextTheme.headline1
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Roles and Responsibilities",
                                    style: PABTextTheme.headline1.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    controller.data.value.job!.description!,
                                    style: PABTextTheme.headline1.copyWith(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(height: 120)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: Get.width * 0.4,
                      top: Get.height * 0.11,
                      child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 50,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(263),
                              child: Container(
                                height: 60,
                                width: 60,
                                color: Colors.white,
                                child: (controller.data.value.postedby == null)
                                    ? Container(
                                        color: const Color(0xffF5F5F5),
                                        child: Image.asset(
                                            "assets/logos/company_logo.png"))
                                    : (controller.data.value.postedby!
                                                .profileImage !=
                                            null)
                                        ? Image.network(controller
                                            .data.value.postedby!.profileImage!)
                                        : Container(
                                            color: const Color(0xffF5F5F5),
                                            child: Image.asset(
                                                "assets/logos/company_logo.png")),
                              ))),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 45, left: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(263),
                        child: Container(
                          height: 50,
                          width: 50,
                          color: PABColorTheme.backgrndColor,
                          child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(Icons.arrow_back_ios_new,
                                  color: Colors.white)),
                        ),
                      )),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        padding: const EdgeInsets.only(left: 40, right: 10),
                        width: Get.width,
                        child: TextButton(
                            child: Text(
                              'Apply Now',
                              style: PABTextTheme.content
                                  .copyWith(color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 31),
                              primary: Colors.white,
                              backgroundColor: PABColorTheme.purpleCardColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(31)),
                              ),
                            ),
                            onPressed: () async {
                              bool x = await APIService.applyjob(Jobid);
                              if (x) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                20.0)), //this right here
                                        child: Container(
                                          height: 423,
                                          child: Padding(
                                            padding: const EdgeInsets.all(43),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                      height: 140,
                                                      color: Colors.white,
                                                      child: SvgPicture.asset(
                                                          "assets/logos/job_applied_successfully.svg")),
                                                  const SizedBox(height: 39),
                                                  Text(
                                                    "Job Applied Successfully",
                                                    style: PABTextTheme
                                                        .headline1
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    "We'll update you when the recruiter\nupdates your application",
                                                    style: PABTextTheme
                                                        .headline1
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                      width: Get.width,
                                                      child: TextButton(
                                                          child: Text(
                                                            'Go to homepage',
                                                            style: PABTextTheme
                                                                .content
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                          style: TextButton
                                                              .styleFrom(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        15,
                                                                    horizontal:
                                                                        31),
                                                            primary:
                                                                Colors.white,
                                                            backgroundColor:
                                                                PABColorTheme
                                                                    .purpleCardColor,
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          31)),
                                                            ),
                                                          ),
                                                          onPressed: () async {
                                                            Get.offAll(() =>
                                                                const ReusableScaffold());
                                                          }))
                                                ]),
                                          ),
                                        ),
                                      );
                                    });
                              }
                            }))),
              ],
            ),
            // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          ),
        );
      }
    });
  }
}

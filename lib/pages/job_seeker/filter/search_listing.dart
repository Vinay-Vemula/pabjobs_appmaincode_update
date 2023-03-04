import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pabjobs/common/job_alert_card.dart';
import 'package:pabjobs/pages/job_seeker/filter/filter_page.dart';
import 'package:pabjobs/pages/job_seeker/filter/search_controller.dart';
import 'package:pabjobs/pages/job_seeker/filter/search_page.dart';
import 'package:pabjobs/pages/job_seeker/homepage/job_details.dart/job_details.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class SearchListing extends StatefulWidget {
  const SearchListing({Key? key}) : super(key: key);

  @override
  State<SearchListing> createState() => _SearchListingState();
}

class _SearchListingState extends State<SearchListing> {
  SearchController controller = Get.put(SearchController());
  final TextEditingController textController = TextEditingController();

  var search = Get.arguments;

  @override
  void initState() {
    super.initState();
    controller.FetchSearchJobDetails(search);
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
              body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: Get.height * .25,
                  color: PABColorTheme.backgrndColor,
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 25),
                          Text("Search",
                              style: PABTextTheme.headline1.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Container(
                          width: Get.width,
                          height: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Color(0xff3B3642),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 29),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const SearchPage());
                                },
                                child: SvgPicture.asset(
                                    "assets/logos/Icon feather-search.svg"),
                              ),
                              const SizedBox(width: 18),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const SearchPage());
                                },
                                child: Text(
                                  "Search Jobs, Job Type, Location",
                                  style: PABTextTheme.headline2.copyWith(
                                    color: Colors.white54,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const FilterPage());
                                },
                                child: Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: SvgPicture.asset(
                                          "assets/logos/filter_icon.svg"),
                                    )),
                              ),
                              const SizedBox(width: 6),
                            ],
                          )),
                    ],
                  ),
                ),
                (controller.data2.value.posts!.isEmpty)
                    ? Container(
                        color: Colors.white,
                        height: Get.height * .75,
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
                              Text("Jobs",
                                  style: PABTextTheme.headline1
                                      .copyWith(color: Colors.black)),
                            ]))
                    : Container(
                        height: Get.height * .75,
                        color: const Color(0xffF5F5F5),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: SingleChildScrollView(
                              child: Column(
                            children: [
                              const SizedBox(height: 20),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                    minHeight: 100 *
                                        controller.data2.value.posts!.length
                                            .toDouble()),
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        controller.data2.value.posts!.length,
                                    itemBuilder: (context, index) {
                                      return JobAlertCard(
                                        name: controller
                                            .data2.value.posts![index].title
                                            .toString(),
                                        description: (controller.data2.value
                                                    .posts![index].recruiter ==
                                                null)
                                            ? "Unknown"
                                            : controller
                                                .data2
                                                .value
                                                .posts![index]
                                                .recruiter!
                                                .companyname
                                                .toString(),
                                        jobtype: (() {
                                          if (controller.data2.value
                                                  .posts![index].jobType ==
                                              null) {
                                            return Text("",
                                                style: PABTextTheme.headline1
                                                    .copyWith(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        fontSize: 11));
                                          } else if (controller.data2.value
                                                  .posts![index].jobType!
                                                  .toString() ==
                                              "JobType.FULL_TIME") {
                                            return Text("Full Time",
                                                style: PABTextTheme.headline1
                                                    .copyWith(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        fontSize: 11));
                                          } else if (controller.data2.value
                                                  .posts![index].jobType!
                                                  .toString() ==
                                              "JobType.PART_TIME") {
                                            return Text("Full Time",
                                                style: PABTextTheme.headline1
                                                    .copyWith(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        fontSize: 11));
                                          } else if (controller.data2.value
                                                  .posts![index].jobType!
                                                  .toString() ==
                                              "JobType.FREELANCER") {
                                            return Text("Freelancer",
                                                style: PABTextTheme.headline1
                                                    .copyWith(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        fontSize: 11));
                                          } else {
                                            return Text("",
                                                style: PABTextTheme.headline1
                                                    .copyWith(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        fontSize: 11));
                                          }
                                        }()),
                                        place: controller.data2.value
                                            .posts![index].cities![0]
                                            .toString(),
                                        salary: controller
                                            .data2.value.posts![index].salary
                                            .toString(),
                                        callback: () {
                                          Get.to(() => const JobDetails(),
                                              arguments: controller.data2.value
                                                  .posts![index].id);
                                        },
                                        image: (controller.data2.value
                                                    .posts![index].recruiter ==
                                                null)
                                            ? Image.asset(
                                                "assets/logos/company_logo.png")
                                            : (controller
                                                        .data2
                                                        .value
                                                        .posts![index]
                                                        .recruiter!
                                                        .profileImage ==
                                                    null)
                                                ? Image.asset(
                                                    "assets/logos/company_logo.png")
                                                : (controller
                                                            .data2
                                                            .value
                                                            .posts![index]
                                                            .recruiter!
                                                            .profileImage ==
                                                        "")
                                                    ? Image.asset(
                                                        "assets/logos/company_logo.png")
                                                    : Image.network(controller
                                                        .data2
                                                        .value
                                                        .posts![index]
                                                        .recruiter!
                                                        .profileImage
                                                        .toString()),
                                      );
                                    }),
                              ),
                            ],
                          )),
                        ))
              ],
            ),
          )),
        );
      }
    });
  }
}

// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pabjobs/common/applicant_listing_card.dart';
import 'package:pabjobs/pages/recruiter/filter/search_controller.dart';
import 'package:pabjobs/pages/recruiter/filter/filter_page.dart';
import 'package:pabjobs/pages/recruiter/filter/search_page.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class SearchListingR extends StatefulWidget {
  const SearchListingR({Key? key}) : super(key: key);

  @override
  State<SearchListingR> createState() => _SearchListingRState();
}

class _SearchListingRState extends State<SearchListingR> {
  SearchRController controller = Get.put(SearchRController());
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
                                  Get.to(() => const SearchPageR());
                                },
                                child: SvgPicture.asset(
                                    "assets/logos/Icon feather-search.svg"),
                              ),
                              const SizedBox(width: 18),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const SearchPageR());
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
                                  Get.to(() => const FilterPageR());
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
                              Text("Candidates",
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
                              child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxHeight: Get.height * 2,
                                minHeight: 100 *
                                    controller.data2.value.posts!.length
                                        .toDouble()),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.data2.value.posts!.length,
                                itemBuilder: (context, index) {
                                  return ApplicantListingCard(
                                    avatarImage: controller.data2.value
                                                .posts![index].profileImage ==
                                            null
                                        ? null
                                        : controller.data2.value.posts![index]
                                            .profileImage,
                                    education: controller.data2.value
                                            .posts![index].education!.isEmpty
                                        ? null
                                        : controller.data2.value.posts![index]
                                            .education![0]!.course!,
                                    experience: controller
                                        .data2.value.posts![index].experience,
                                    id: controller.data2.value.posts![index].id,
                                    jobType: controller.data2.value
                                                .posts![index].experience ==
                                            'experienced'
                                        ? controller.data2.value.posts![index]
                                            .employment![1]!.designation![0]
                                            .toString()
                                        : controller.data2.value.posts![index]
                                            .experience,
                                    location: controller
                                        .data2
                                        .value
                                        .posts![index]
                                        .personaldetails!
                                        .hometown,
                                    name: controller
                                        .data2.value.posts![index].name,
                                    onTap: () {},
                                    resumeName: controller.data2.value
                                        .posts![index].resume!.filename,
                                    resumeUrl: controller
                                        .data2.value.posts![index].resume!.url,
                                    status: '',
                                  );
                                }),
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

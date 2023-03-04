import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/constant.dart';
import '../../../common/recruiter_homepage_card.dart';
import '../../../entities/candidate_details_model_pagination.dart';
import '../../../theme/text_theme.dart';
import '../filter/filter_page.dart';
import '../my_jobs/applicant_details/applicant_details_page.dart';
import '../post_job/post_job_page.dart';
import '../profile/company_profile/company_profile.dart';
import 'hompage_controller.dart';

class RecruiterHomePagePaginated extends StatefulWidget {
  const RecruiterHomePagePaginated({Key? key}) : super(key: key);

  @override
  State<RecruiterHomePagePaginated> createState() =>
      _RecruiterHomePagePaginatedState();
}

class _RecruiterHomePagePaginatedState
    extends State<RecruiterHomePagePaginated> {
  RHomePageController controller = Get.put(RHomePageController());
  final ScrollController _scrollController = ScrollController();

  Widget errorDialog({required double size}) {
    return SizedBox(
      height: Get.height * 0.4,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('An error occurred when fetching the posts.',
              textAlign: TextAlign.center,
              style: PABTextTheme.content.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black)),
          // const SizedBox(
          //   height: 5,
          // ),
          TextButton(
              onPressed: () {
                setState(() {
                  controller.loading(true);
                  controller.error(false);
                  controller.fetchJobDetails();
                });
              },
              child: Text(
                "Retry",
                style: PABTextTheme.content.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.purpleAccent),
              )),
          const SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller.fetchData();
    _scrollController.addListener(() {
      var nextPageTrigger = _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels >= nextPageTrigger &&
          !controller.loading.value) {
        print('Scroll Controller Called');
        controller.loading(true);
        controller.fetchJobDetails();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            toolbarHeight: 100,
            elevation: 0,
            title: Container(
              width: Get.width,
              height: 100,
              color: PABColorTheme.backgrndColor,
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Shimmer.fromColors(
                          baseColor: Colors.white.withOpacity(.9),
                          highlightColor: Colors.grey,
                          child: Container(
                            width: Get.width * 0.09166666666666666,
                            height: Get.height * 0.044836956521739135,
                            decoration: BoxDecoration(
                              color: const Color(0xffF5F5F5).withOpacity(.2),
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ));
                    } else {
                      return InkWell(
                        onTap: () {
                          Get.to(() => const CompanyProfile());
                        },
                        child: Container(
                          width: Get.width * 0.09166666666666666,
                          height: Get.height * 0.044836956521739135,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white,
                                width: Get.width * 0.005092592592592592),
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: (controller.profileData.value.profileImage ==
                                    null)
                                ? (controller.profileData.value.profileImage ==
                                        "")
                                    ? Image.asset(
                                        "assets/logos/company_logo.png",
                                        fit: BoxFit.cover,
                                        height:
                                            Get.height * 0.03985507246376812,
                                        width: Get.width * 0.08148148148148147,
                                      )
                                    : Image.asset(
                                        "assets/logos/company_logo.png",
                                        fit: BoxFit.cover,
                                        height:
                                            Get.height * 0.03985507246376812,
                                        width: Get.width * 0.08148148148148147,
                                      )
                                : Image.network(
                                    controller.profileData.value.profileImage!,
                                    fit: BoxFit.cover,
                                    height: Get.height * 0.03985507246376812,
                                    width: Get.width * 0.08148148148148147,
                                  ),
                          ),
                        ),
                      );
                    }
                  }),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: Get.width * 0.4074074074074074,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          if (controller.isLoading.value) {
                            return Shimmer.fromColors(
                                baseColor: Colors.white.withOpacity(.9),
                                highlightColor: Colors.grey,
                                child: Container(
                                  width: 150,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffF5F5F5)
                                          .withOpacity(.2),
                                      borderRadius: BorderRadius.circular(24)),
                                ));
                          } else {
                            return InkWell(
                              onTap: () {
                                Get.to(() => const CompanyProfile());
                              },
                              child: Text(
                                controller.profileData.value.companyname == null
                                    ? "Unknown"
                                    : controller.profileData.value.companyname!,
                                style: PABTextTheme.headline1.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          }
                        }),
                        InkWell(
                          onTap: () {
                            Get.to(() => const CompanyProfile());
                          },
                          child: Container(
                            child: Text(
                              "Update Company Profile",
                              style: PABTextTheme.headline2
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.to(() => const PostJob());
                    },
                    child: Container(
                      height: Get.height * 0.049818840579710144,
                      width: Get.width * 0.2699074074074074,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            Get.width * 0.030555555555555555),
                        color: const Color(0xff31283D),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              "assets/logos/add_rectangle_button.svg"),
                          const SizedBox(width: 8),
                          Text(
                            "Post a Job",
                            style: PABTextTheme.headline2.copyWith(
                                color: Colors.white,
                                fontSize: Get.width * 0.030555555555555555),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(top: 20, left: 27, bottom: 5),
                  decoration: const BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Text(
                    'Candidates',
                    style: PABTextTheme.content.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )),
            pinned: true,
            backgroundColor: PABColorTheme.backgrndColor,
            expandedHeight: Get.height * 0.32382246376811596,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: PABColorTheme.backgrndColor,

                /// Search Bar
                child: Container(
                  color: PABColorTheme.backgrndColor,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      const SizedBox(height: 32),
                      const SizedBox(height: 32),
                      Container(
                          width: Get.width,
                          height: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xff3B3642),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 29),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const FilterPageR());
                                },
                                child: SvgPicture.asset(
                                    "assets/logos/Icon feather-search.svg"),
                              ),
                              const SizedBox(width: 18),
                              InkWell(
                                onTap: () {
                                  Get.to(() => const FilterPageR());
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
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          Obx(() {
            if (controller.isLoading.value) {
              ///Shimmer effect
              return SliverToBoxAdapter(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 100 * 4),

                  ///Shimmer List View
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                          baseColor: Colors.black.withOpacity(.5),
                          highlightColor: Colors.grey,
                          child: Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xffF5F5F5).withOpacity(.2),
                            ),
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(bottom: 16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ///Avatar and Name row
                                    SizedBox(
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: Get.width *
                                                0.09166666666666666 /
                                                2,
                                            backgroundColor:
                                                const Color(0xffF5F5F5)
                                                    .withOpacity(.2),
                                          ),

                                          const SizedBox(width: 14),

                                          ///Name and Designation Button
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: 15,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                              0xffF5F5F5)
                                                          .withOpacity(.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                              const SizedBox(height: 6),
                                              Container(
                                                  height: 10,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                              0xffF5F5F5)
                                                          .withOpacity(.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    ///View Button
                                    TextButton(
                                      onPressed: () {},
                                      child: Container(width: 60),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            const Color(0xffF5F5F5)
                                                .withOpacity(.2),
                                          ),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ))),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 30,
                                  thickness: 1,
                                  color:
                                      const Color(0xffF5F5F5).withOpacity(.2),
                                ),

                                ///Details
                                Column(
                                  children: [
                                    ///Education
                                    Row(
                                      children: [
                                        Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffF5F5F5)
                                                    .withOpacity(.2),
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        const SizedBox(width: 10),
                                        Container(
                                            height: 10,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffF5F5F5)
                                                    .withOpacity(.2),
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                      ],
                                    ),
                                    const SizedBox(height: 7),

                                    Row(
                                      children: [
                                        Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffF5F5F5)
                                                    .withOpacity(.2),
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        const SizedBox(width: 10),
                                        Container(
                                            height: 10,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffF5F5F5)
                                                    .withOpacity(.2),
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                      ],
                                    ),
                                    const SizedBox(height: 7),

                                    Row(
                                      children: [
                                        Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffF5F5F5)
                                                    .withOpacity(.2),
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        const SizedBox(width: 10),
                                        Container(
                                            height: 10,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffF5F5F5)
                                                    .withOpacity(.2),
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ));
                    },
                  ),
                ),
              );
            } else {
              if (controller.posts.isEmpty) {
                if (controller.loading.value) {
                  return const SliverToBoxAdapter(
                      child: Center(
                          child: CircularProgressIndicator(
                    color: Color(0xff0A0413),
                  )));
                } else if (controller.error.value) {
                  return SliverToBoxAdapter(
                      child: Center(child: Text('Error!!!')));
                }
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index == controller.posts.length) {
                      if (controller.error.value) {
                        return const Center(child: Text('Some error Occurred'));
                      } else {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    }
                    final Post1 post = controller.posts[index];
                    return RecruiterHomePageCard(
                      profilePicture: post.profileImage != null
                          ? post.profileImage != ""
                              ? post.profileImage
                              : null
                          : null,
                      name: post.name!.isNotEmpty ? post.name : 'No Name',
                      designation: post.employment!.isNotEmpty
                          ? post.employment![0].designation != null
                              ? post.employment![0].designation!.isNotEmpty
                                  ? post.employment![0].designation![0]
                                  : 'Not updated'
                              : 'Not updated'
                          : 'Not updated',
                      education: post.education!.isNotEmpty
                          ? post.education![0].course
                          : null,
                      place: post.currentlocation!.isNotEmpty
                          ? post.currentlocation![0]
                          : 'Not Updated',
                      experience: post.experience,
                      onTapView: () {
                        Get.to(ApplicantDetailsPage(
                            image: post.profileImage,
                            name: post.name!.isNotEmpty ? post.name : 'No Name',
                            designation: post.employment!.isNotEmpty
                                ? post.employment![0].designation!.isNotEmpty
                                    ? post.employment![0].designation![0]
                                    : 'Not Updated'
                                : 'Not Updated',
                            education: post.education!.isNotEmpty
                                ? post.education![0].course
                                : null,
                            location: post.currentlocation!.isNotEmpty
                                ? post.currentlocation![0]
                                : null,
                            experience: post.experience == null
                                ? 'Not Updated'
                                : post.experience
                                    .toString()
                                    .replaceAll('Experience.', '')
                                    .replaceAll('EMPTY', 'Not Updated')
                                    .replaceAll('FRESHER', 'Fresher')
                                    .replaceAll('EXPERIENCED', 'Experienced'),
                            age: post.personaldetails!.age,
                            dob: post.personaldetails!.dateofbirth.toString(),
                            employmentType: post.careerprofile!.isEmpty
                                ? 'Not Updated'
                                : post.careerprofile![0].desiredEmployementType
                                    .toString()
                                    .replaceAll('Type.', '')
                                    .replaceAll('EMPTY', 'Not Updated')
                                    .replaceAll('TYPE_FULL_TIME', 'Full Time')
                                    .replaceAll('TYPE_PART_TIME', 'Part Time'),
                            jobType: post.careerprofile!.isNotEmpty
                                ? post.careerprofile![0].desiredJobType != null
                                    ? post.careerprofile![0].desiredJobType
                                        .toString()
                                        .replaceAll('DesiredJobType.', '')
                                        .replaceAll('PERMANENT', 'Permanent')
                                    : 'Not Updated'
                                : 'Not Updated',
                            email: post.email,
                            gender: post.personaldetails!.gender == null
                                ? 'Not Updated'
                                : post.personaldetails!.gender
                                    .toString()
                                    .replaceAll('Gender.', '')
                                    .replaceAll('FEMALE', 'Female')
                                    .replaceAll('MALE', 'Male'),
                            pinCode: post.personaldetails!.pincode,
                            maritalStatus: post.personaldetails!.maritalStatus
                                .toString()
                                .replaceAll('MaritalStatus.', '')
                                .replaceAll('EMPTY', 'Not updated'),
                            preferredLocation: post.careerprofile!.isNotEmpty
                                ? post.careerprofile![0].desiredLocation!
                                        .isNotEmpty
                                    ? post.careerprofile![0].desiredLocation.toString()
                                    : 'Not Updated'
                                : 'Not Updated',
                            addressProof: post.personaldetails!.addressProof,
                            addressProofNumber: post.personaldetails!.adressProofNumber.toString(),
                            expectedCTC: post.careerprofile!.isEmpty ? 'Not Updated' : post.careerprofile![0].desiredExpectedSalaryinLakhs,
                            desiredIndustry: post.careerprofile!.isEmpty ? 'Not Updated' : post.careerprofile![0].desiredIndustry,
                            preferredShift: post.careerprofile!.isEmpty ? 'Not Updated' : post.careerprofile![0].desiredPrefferedShift.toString().replaceAll('null', 'Not Updated'),
                            languagesKnown: post.personaldetails!.languages,
                            skills: post.skills,
                            jobLocation: post.careerprofile!.isNotEmpty
                                ? post.careerprofile![0].desiredLocation!.isNotEmpty
                                    ? post.careerprofile![0].desiredLocation![0].toString()
                                    : 'Not Updated'
                                : 'Not Updated'));
                      },
                    );
                  },
                  childCount: controller.posts.length +
                      (controller.isLastPage.value ? 0 : 1),
                ),
              );
            }
          }),
          SliverToBoxAdapter(child: SizedBox(height: Get.width * 0.18)),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "You have reached bottom",
                style: PABTextTheme.headline1.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 6))
        ],
      ),
    );
  }
}

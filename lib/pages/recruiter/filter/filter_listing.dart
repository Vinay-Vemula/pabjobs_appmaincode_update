import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pabjobs/common/recruiter_homepage_card.dart';
import 'package:pabjobs/entities/candidate_details_model.dart';
import 'package:pabjobs/pages/recruiter/filter/filter_page.dart';
import 'package:pabjobs/pages/recruiter/filter/search_page.dart';
import 'package:pabjobs/pages/recruiter/my_jobs/applicant_details/applicant_details_page.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

import 'filter_listing_controller.dart';

class FilterListingR extends StatefulWidget {
  const FilterListingR({Key? key}) : super(key: key);

  @override
  State<FilterListingR> createState() => _FilterListingRState();
}

class _FilterListingRState extends State<FilterListingR> {
  FilterListingRController controller = Get.put(FilterListingRController());
  final TextEditingController textController = TextEditingController();

  var filter = Get.arguments;

  @override
  void initState() {
    super.initState();
    controller.fetchFilterListDetails(
      filter[0],
      filter[1],
      filter[2],
      filter[3],
    );
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
                          Text("Filter",
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
                              color: const Color(0xff3B3642),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 29),
                              InkWell(
                                onTap: () {
                                  Get.off(() => const FilterPageR());
                                },
                                child: SvgPicture.asset(
                                    "assets/logos/Icon feather-search.svg"),
                              ),
                              const SizedBox(width: 18),
                              InkWell(
                                onTap: () {
                                  Get.off(() => const FilterPageR());
                                  // showSearch(
                                  //     context: context,
                                  //     // delegate to customize the search bar
                                  //     delegate: CustomSearchDelegate());
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
                                  Get.off(() => const FilterPageR());
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
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  // maxHeight: Get.height * 2,
                                  minHeight: 100 *
                                          controller.data2.value.posts!.length
                                              .toDouble() +
                                      100),
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      controller.data2.value.posts!.length,
                                  itemBuilder: (context, index) {
                                    return RecruiterHomePageCard(
                                      profilePicture: controller.data2.value
                                                  .posts![index].profileImage !=
                                              null
                                          ? controller.data2.value.posts![index]
                                                      .profileImage !=
                                                  ""
                                              ? controller.data2.value
                                                  .posts![index].profileImage
                                              : null
                                          : null,
                                      name: controller.data2.value.posts![index]
                                              .name!.isNotEmpty
                                          ? controller
                                              .data2.value.posts![index].name
                                          : 'No Name',
                                      designation: controller
                                              .data2
                                              .value
                                              .posts![index]
                                              .employment!
                                              .isNotEmpty
                                          ? controller
                                                      .data2
                                                      .value
                                                      .posts![index]
                                                      .employment![0]!
                                                      .designation !=
                                                  null
                                              ? controller
                                                      .data2
                                                      .value
                                                      .posts![index]
                                                      .employment![0]!
                                                      .designation!
                                                      .isNotEmpty
                                                  ? controller
                                                                  .data2
                                                                  .value
                                                                  .posts![index]
                                                                  .employment![0]!
                                                                  .designation![
                                                              0] ==
                                                          null
                                                      ? controller
                                                                  .data2
                                                                  .value
                                                                  .posts![index]
                                                                  .employment![
                                                                      0]!
                                                                  .designation![
                                                                      0]
                                                                  .toString() ==
                                                              "null"
                                                          ? controller
                                                              .data2
                                                              .value
                                                              .posts![index]
                                                              .employment![0]!
                                                              .designation![0]
                                                              .toString()
                                                          : 'Not updated'
                                                      : 'Not updated'
                                                  : 'Not updated'
                                              : 'Not updated'
                                          : 'Not updated',
                                      education: controller
                                              .data2
                                              .value
                                              .posts![index]
                                              .education!
                                              .isNotEmpty
                                          ? controller.data2.value.posts![index]
                                              .education![0]!.course
                                          : null,
                                      place: controller
                                              .data2
                                              .value
                                              .posts![index]
                                              .currentlocation!
                                              .isNotEmpty
                                          ? controller.data2.value.posts![index]
                                              .currentlocation![0]
                                          : 'Not Updated',
                                      experience: controller
                                          .data2.value.posts![index].experience,
                                      onTapView: () {
                                        Get.to(ApplicantDetailsPage(
                                            image: controller.data2.value
                                                .posts![index].profileImage,
                                            name: controller.data2.value.posts![index].name!.isNotEmpty
                                                ? controller.data2.value
                                                    .posts![index].name
                                                    .toString()
                                                : 'No Name',
                                            designation: controller
                                                    .data2
                                                    .value
                                                    .posts![index]
                                                    .employment!
                                                    .isNotEmpty
                                                ? controller
                                                        .data2
                                                        .value
                                                        .posts![index]
                                                        .employment![0]!
                                                        .designation!
                                                        .isNotEmpty
                                                    ? controller
                                                                .data2
                                                                .value
                                                                .posts![index]
                                                                .employment![0]!
                                                                .designation ==
                                                            null
                                                        ? controller.data2.value.posts![index].employment![0]!.designation![0] ==
                                                                null
                                                            ? controller
                                                                .data2
                                                                .value
                                                                .posts![index]
                                                                .employment![0]!
                                                                .designation![0]
                                                                .toString()
                                                            : 'Not Updated'
                                                        : 'Not Updated'
                                                    : 'Not Updated'
                                                : 'Not Updated',
                                            education: controller
                                                    .data2
                                                    .value
                                                    .posts![index]
                                                    .education!
                                                    .isNotEmpty
                                                ? controller
                                                    .data2
                                                    .value
                                                    .posts![index]
                                                    .education![0]!
                                                    .course
                                                    .toString()
                                                : null,
                                            location: controller.data2.value.posts![index].currentlocation!.isNotEmpty ? controller.data2.value.posts![index].currentlocation![0].toString() : null,
                                            experience: controller.data2.value.posts![index].experience == null ? 'Not Updated' : controller.data2.value.posts![index].experience.toString().replaceAll('Experience.', '').replaceAll('EMPTY', 'Not Updated').replaceAll('FRESHER', 'Fresher').replaceAll('EXPERIENCED', 'Experienced'),
                                            age: controller.data2.value.posts![index].personaldetails!.age,
                                            dob: controller.data2.value.posts![index].personaldetails!.dateofbirth.toString(),
                                            employmentType: controller.data2.value.posts![index].careerprofile!.isEmpty ? 'Not Updated' : controller.data2.value.posts![index].careerprofile![0]!.desiredEmployementType.toString().replaceAll('Type.', '').replaceAll('EMPTY', 'Not Updated').replaceAll('TYPE_FULL_TIME', 'Full Time').replaceAll('TYPE_PART_TIME', 'Part Time'),
                                            jobType: controller.data2.value.posts![index].careerprofile!.isNotEmpty
                                                ? controller.data2.value.posts![index].careerprofile![0]!.desiredJobType != null
                                                    ? controller.data2.value.posts![index].careerprofile![0]!.desiredJobType.toString().replaceAll('DesiredJobType.', '').replaceAll('PERMANENT', 'Permanent')
                                                    : 'Not Updated'
                                                : 'Not Updated',
                                            email: controller.data2.value.posts![index].email.toString(),
                                            gender: controller.data2.value.posts![index].personaldetails!.gender == null ? 'Not Updated' : controller.data2.value.posts![index].personaldetails!.gender.toString().replaceAll('Gender.', '').replaceAll('FEMALE', 'Female').replaceAll('MALE', 'Male'),
                                            pinCode: controller.data2.value.posts![index].personaldetails!.pincode,
                                            maritalStatus: controller.data2.value.posts![index].personaldetails!.maritalStatus.toString().replaceAll('MaritalStatus.', '').replaceAll('EMPTY', 'Not updated'),
                                            preferredLocation: controller.data2.value.posts![index].careerprofile!.isNotEmpty
                                                ? controller.data2.value.posts![index].careerprofile![0]!.desiredLocation!.isNotEmpty
                                                    ? controller.data2.value.posts![index].careerprofile![0]!.desiredLocation.toString()
                                                    : 'Not Updated'
                                                : 'Not Updated',
                                            addressProof: controller.data2.value.posts![index].personaldetails!.addressProof.toString(),
                                            addressProofNumber: controller.data2.value.posts![index].personaldetails!.adressProofNumber.toString(),
                                            expectedCTC: controller.data2.value.posts![index].careerprofile!.isEmpty ? 'Not Updated' : controller.data2.value.posts![index].careerprofile![0]!.desiredExpectedSalaryinLakhs.toString(),
                                            desiredIndustry: controller.data2.value.posts![index].careerprofile!.isEmpty ? 'Not Updated' : controller.data2.value.posts![index].careerprofile![0]!.desiredIndustry.toString(),
                                            preferredShift: controller.data2.value.posts![index].careerprofile!.isEmpty ? 'Not Updated' : controller.data2.value.posts![index].careerprofile![0]!.desiredPrefferedShift.toString().replaceAll('null', 'Not Updated'),
                                            languagesKnown: controller.data2.value.posts![index].personaldetails!.languages,
                                            skills: controller.data2.value.posts![index].skills,
                                            jobLocation: controller.data2.value.posts![index].careerprofile!.isNotEmpty
                                                ? controller.data2.value.posts![index].careerprofile![0]!.desiredLocation!.isNotEmpty
                                                    ? controller.data2.value.posts![index].careerprofile![0]!.desiredLocation![0].toString()
                                                    : 'Not Updated'
                                                : 'Not Updated'));
                                      },
                                    );
                                  })),
                        )),
              ],
            ),
          )),
        );
      }
    });
  }
}

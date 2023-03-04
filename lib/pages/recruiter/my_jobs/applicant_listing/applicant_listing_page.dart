import 'package:flutter/material.dart';
import 'package:pabjobs/common/applicant_listing_big_text.dart';
import 'package:pabjobs/pages/recruiter/my_jobs/applicant_details/applicant_details_page.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:get/get.dart';
import '../../../../common/applicant_listing_card.dart';
import '../../../../theme/text_theme.dart';
import 'applicant_listing_controlle.dart';

class ApplicantListingPage extends StatefulWidget {
  String pageTitle;
  ApplicantListingPage({required this.pageTitle, Key? key}) : super(key: key);

  @override
  State<ApplicantListingPage> createState() => _ApplicantListingPageState();
}

class _ApplicantListingPageState extends State<ApplicantListingPage> {
  final applicantListingController = Get.put(ApplicantListingController());

  var id = Get.arguments;

  @override
  void initState() {
    super.initState();
    applicantListingController.fetchApplicantData(id);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (applicantListingController.isLoading.value) {
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
          backgroundColor: PABColorTheme.recruiterPageColor,
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                ///Spacing before appBar
                const SizedBox(height: 46),

                ///Heading 'Node JS Developer'
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xff0A0413),
                          )),
                      ALBigText(text: widget.pageTitle),
                    ],
                  ),
                ),

                ///Applicant Listing
                Expanded(
                  child: GetX<ApplicantListingController>(
                    builder: (controller) {
                      /// here we make the list of applicants
                      return SizedBox(
                        child: controller.applicant.isEmpty
                            ? Container(
                                color: Colors.white,
                                height: Get.height,
                                width: Get.width,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/images/No_list_found.png",
                                          width: 280,
                                          height: 280),
                                      Text("We cannot find any",
                                          style: PABTextTheme.content
                                              .copyWith(color: Colors.black)),
                                      Text("Applicants",
                                          style: PABTextTheme.headline1
                                              .copyWith(color: Colors.black)),
                                      const SizedBox(height: 50),
                                      SizedBox(
                                          width: Get.width * .6,
                                          child: TextButton(
                                              child: Text(
                                                'Go Back',
                                                style: PABTextTheme.content
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                              style: TextButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15,
                                                        horizontal: 31),
                                                primary: Colors.white,
                                                backgroundColor: PABColorTheme
                                                    .purpleCardColor,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(31)),
                                                ),
                                              ),
                                              onPressed: () async {
                                                Get.back();
                                              }))
                                    ]),
                              )
                            : ListView.builder(
                                itemCount: controller.applicant.length,
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    /// this is the custom widget for making each card
                                    ApplicantListingCard(
                                      avatarImage: controller.applicant[index]
                                                  .jobApplicant!.profileImage ==
                                              null
                                          ? null
                                          : controller.applicant[index]
                                              .jobApplicant!.profileImage!,
                                      name: controller
                                          .applicant[index].jobApplicant!.name!,
                                      resumeUrl: controller.applicant[index]
                                          .jobApplicant!.resume!.url,
                                      resumeName: controller.applicant[index]
                                          .jobApplicant!.resume!.filename,
                                      jobType: controller.applicant[index]
                                                  .jobApplicant!.experience! ==
                                              'experienced'
                                          ? controller
                                              .applicant[index]
                                              .jobApplicant!
                                              .employment![1]
                                              .designation![0]
                                          : controller.applicant[index]
                                              .jobApplicant!.experience!,
                                      id: controller.applicant[index].id!,
                                      education: controller.applicant[index]
                                              .jobApplicant!.education!.isEmpty
                                          ? null
                                          : controller
                                              .applicant[index]
                                              .jobApplicant!
                                              .education![0]
                                              .course
                                              .toString(),
                                      location: controller
                                          .applicant[index]
                                          .jobApplicant!
                                          .personaldetails!
                                          .hometown!,
                                      experience: controller.applicant[index]
                                          .jobApplicant!.experience!,
                                      status:
                                          controller.applicant[index].status!,
                                      onTap: () =>
                                          Get.to(() => ApplicantDetailsPage(
                                                image: controller
                                                            .applicant[index]
                                                            .jobApplicant!
                                                            .profileImage ==
                                                        null
                                                    ? null
                                                    : controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .profileImage,
                                                name: controller
                                                    .applicant[index]
                                                    .jobApplicant!
                                                    .name!,
                                                education: controller
                                                    .applicant[index]
                                                    .jobApplicant!
                                                    .education![0]
                                                    .course,
                                                location: controller
                                                    .applicant[index]
                                                    .jobApplicant!
                                                    .personaldetails!
                                                    .hometown!,
                                                experience: controller
                                                    .applicant[index]
                                                    .jobApplicant!
                                                    .experience!,
                                                age: controller
                                                            .applicant[index]
                                                            .jobApplicant!
                                                            .personaldetails!
                                                            .age ==
                                                        null
                                                    ? null
                                                    : controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .personaldetails!
                                                        .age,
                                                dob: controller
                                                            .applicant[index]
                                                            .jobApplicant!
                                                            .personaldetails!
                                                            .dateofbirth ==
                                                        null
                                                    ? null
                                                    : controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .personaldetails!
                                                        .dateofbirth
                                                        .toString(),
                                                employmentType: controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .careerprofile!
                                                        .isEmpty
                                                    ? null
                                                    : controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .careerprofile![0]
                                                        .desiredEmployementType!,
                                                jobType: controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .careerprofile!
                                                        .isEmpty
                                                    ? null
                                                    : controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .careerprofile![0]
                                                        .desiredJobType!,
                                                designation: controller
                                                            .applicant[index]
                                                            .jobApplicant!
                                                            .experience! ==
                                                        'experienced'
                                                    ? controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .employment![1]
                                                        .designation![0]
                                                    : controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .experience!,
                                                email: controller
                                                    .applicant[index]
                                                    .jobApplicant!
                                                    .email,
                                                gender: controller
                                                    .applicant[index]
                                                    .jobApplicant!
                                                    .personaldetails!
                                                    .gender,
                                                pinCode: controller
                                                    .applicant[index]
                                                    .jobApplicant!
                                                    .personaldetails!
                                                    .pincode,
                                                maritalStatus: controller
                                                    .applicant[index]
                                                    .jobApplicant!
                                                    .personaldetails!
                                                    .maritalStatus,
                                                preferredLocation: controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .careerprofile!
                                                        .isEmpty
                                                    ? null
                                                    : controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .careerprofile![0]
                                                        .desiredLocation!,
                                                addressProof: controller
                                                    .applicant[index]
                                                    .jobApplicant!
                                                    .personaldetails!
                                                    .addressProof!,
                                                addressProofNumber: controller
                                                    .applicant[index]
                                                    .jobApplicant!
                                                    .personaldetails!
                                                    .adressProofNumber!,
                                                expectedCTC: controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .careerprofile!
                                                        .isEmpty
                                                    ? null
                                                    : controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .careerprofile![0]
                                                        .desiredExpectedSalaryinLakhs!,
                                                desiredIndustry: controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .careerprofile!
                                                        .isEmpty
                                                    ? null
                                                    : controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .careerprofile![0]
                                                        .desiredIndustry!,
                                                preferredShift: controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .careerprofile!
                                                        .isEmpty
                                                    ? null
                                                    : controller
                                                        .applicant[index]
                                                        .jobApplicant!
                                                        .careerprofile![0]
                                                        .desiredPrefferedShift!,
                                                languagesKnown: controller
                                                    .applicant[index]
                                                    .jobApplicant!
                                                    .personaldetails!
                                                    .languages!,
                                                skills: controller
                                                    .applicant[index]
                                                    .jobApplicant!
                                                    .skills,
                                                jobLocation: 'Unknown',
                                              )),
                                    ),
                                    const SizedBox(height: 12)
                                  ],
                                ),
                              ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      }
    });
  }
}

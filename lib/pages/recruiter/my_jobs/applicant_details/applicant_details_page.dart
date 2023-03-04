import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pabjobs/common/applicant_listing_big_text.dart';

import '../../../../common/applicant_listing_small_text.dart';

class ApplicantDetailsPage extends StatelessWidget {
  String? image;
  String? name;
  String? designation;
  String? education;
  String? location;
  String? experience;
  int? age;
  String? dob;
  String? employmentType;
  String? jobType;
  String? email;
  String? gender;
  int? pinCode;
  String? maritalStatus;
  String? preferredLocation;
  String? addressProof;
  String? addressProofNumber;
  String? expectedCTC;
  String? desiredIndustry;
  String? preferredShift;
  List<String?>? languagesKnown;
  List<String?>? skills;
  String? jobLocation;
  ApplicantDetailsPage({
    required this.image,
    required this.name,
    required this.designation,
    required this.education,
    required this.location,
    required this.experience,
    required this.age,
    required this.dob,
    required this.employmentType,
    required this.jobType,
    required this.email,
    required this.gender,
    required this.pinCode,
    required this.maritalStatus,
    required this.preferredLocation,
    required this.addressProof,
    required this.addressProofNumber,
    required this.expectedCTC,
    required this.desiredIndustry,
    required this.preferredShift,
    required this.languagesKnown,
    required this.skills,
    required this.jobLocation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(jobType);
    // print(dob);
    String date2;
    if (dob == "Not Updated") {
      date2 = "Not Updated";
    } else if (dob == "null") {
      date2 = "Not Updated";
    } else if (dob == null) {
      date2 = "Not Updated";
    } else {
      DateTime? date = DateTime.parse(dob!);
      date2 = DateFormat.yMMMd().format(date);
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
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
          Positioned(
            left: 0,
            right: 0,
            top: 128,
            bottom: 0,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                /// Background Container white
                Container(
                  padding: const EdgeInsets.only(top: 114, left: 25, right: 25),
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
                        ///Education
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/Education.svg'),
                            const SizedBox(width: 14),
                            ALBigText(
                              text: education == null
                                  ? 'Not Updated'
                                  : education!,
                              size: 15,
                              fontThickness: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        ///Location
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/Location.svg'),
                            const SizedBox(width: 14),
                            ALBigText(
                              text:
                                  location == null ? 'Not Updated' : location!,
                              size: 15,
                              fontThickness: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        ///Experience
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/Experience.svg'),
                            const SizedBox(width: 14),
                            ALBigText(
                              text: experience!,
                              size: 15,
                              fontThickness: FontWeight.w500,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        ///Age
                        ALBigText(
                          text: 'Age',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        ALSmallText(
                          text: age == null ? 'Not Updated' : age.toString(),
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 12),

                        ///DOB
                        ALBigText(
                          text: 'Date Of Birth',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        ALSmallText(
                          text: dob == null ? 'Not Updated' : date2,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 12),

                        ///Employment type
                        ALBigText(
                          text: 'Employment Type',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        ALSmallText(
                          text:
                              employmentType == null ? '---' : employmentType!,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 12),

                        ///Job Type
                        ALBigText(
                          text: 'Job Type',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        ALSmallText(
                          text: jobType == null ? '---' : jobType!,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 12),

                        ///Email
                        ALBigText(
                          text: 'E-Mail',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        ALSmallText(
                          text: email == null ? 'Not given' : email!,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 12),

                        ///Gender
                        ALBigText(
                          text: 'Gender',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        ALSmallText(
                          text: gender == null ? 'Not given' : gender!,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 12),

                        ///PinCode
                        ALBigText(
                          text: 'Pin Code',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        ALSmallText(
                          text: pinCode == null
                              ? 'Not Updated'
                              : pinCode!.toString(),
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 12),

                        ///Marital Status
                        ALBigText(
                          text: 'Marital Status',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        ALSmallText(
                          text: maritalStatus == null
                              ? 'Not given'
                              : maritalStatus!,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 12),

                        /// Preferred Location
                        ALBigText(
                          text: 'Preferred Location',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        ALSmallText(
                          text: preferredLocation == null
                              ? '---'
                              : preferredLocation!,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 12),

                        ///Address Proof
                        ALBigText(
                          text: 'Address Proof',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        ALSmallText(
                          text: addressProof!.isEmpty
                              ? 'Not Updated'
                              : addressProof!,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 12),

                        ///Address Proof Number
                        ALBigText(
                          text: 'Address Proof Number',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        ALSmallText(
                          text: addressProofNumber!.isEmpty
                              ? 'Not Updated'
                              : addressProofNumber!
                                  .replaceAll('AdressProofNumber.', '')
                                  .replaceAll('EMPTY', 'Not Updated'),
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 12),

                        ///Expected CTC
                        ALBigText(
                          text: 'Expected CTC',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        ALSmallText(
                          text: expectedCTC!.isEmpty
                              ? 'Not Updated'
                              : expectedCTC!,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 12),

                        ///Desired Industry
                        ALBigText(
                          text: 'Desired Industry',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        ALSmallText(
                          text: desiredIndustry!.isEmpty
                              ? 'Not Updated'
                              : desiredIndustry!,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 12),

                        ///Preferred Shift
                        ALBigText(
                          text: 'Preferred Shift',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        ALSmallText(
                          text: preferredShift!.isEmpty
                              ? 'Not Updated'
                              : preferredShift!,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 12),

                        ///Languages Known
                        ALBigText(
                          text: 'Languages Known',
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 6),
                        Wrap(
                          ///languages are passed to here
                          spacing: 12,
                          runSpacing: 12,
                          children: List.generate(
                            // 1,
                            languagesKnown!.isEmpty
                                ? 1
                                : languagesKnown!.length,
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
                                text: languagesKnown!.isEmpty
                                    ? 'Not Updated'
                                    : languagesKnown![index].toString(),
                                // color: Colors.white,
                              ),
                            ),
                          ),
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
                            skills!.isEmpty ? 1 : skills!.length,
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
                                text: skills!.isEmpty
                                    ? 'Not Updated'
                                    : skills![index].toString(),
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

                ///Profile Picture
                Positioned(
                  top: -30,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: image == null
                        ? Image.asset('assets/images/profile_dp.png')
                        : ClipOval(
                            child: Image.network(
                              image!,
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),

                ///Name,JobName,JobLocation,Status
                Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ///Name
                        ALBigText(
                          text: name == null ? 'Not given' : name!,
                          size: 18,
                          fontThickness: FontWeight.bold,
                        ),

                        ///jobName
                        ALBigText(
                          text: designation == null ? '---' : designation!,
                          size: 14,
                          fontThickness: FontWeight.bold,
                        ),
                        const SizedBox(height: 8),

                        ///status
                        const Divider(
                          indent: 16,
                          endIndent: 16,
                          // color: Colors.black,
                          color: Color(0xfffafafa),
                          thickness: 1,
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

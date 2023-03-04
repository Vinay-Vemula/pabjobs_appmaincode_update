import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

import 'applicant_listing_big_text.dart';
import 'applicant_listing_small_text.dart';

class RecruiterHomePageCard extends StatelessWidget {
  final String? profilePicture;
  final String? name;
  final String? designation;
  final String? education;
  final String? place;
  final dynamic experience;
  final VoidCallback? onTapView;
  const RecruiterHomePageCard({
    Key? key,
    required this.profilePicture,
    required this.name,
    required this.designation,
    required this.education,
    required this.place,
    required this.experience,
    required this.onTapView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      // padding: const EdgeInsets.only(bottom: 16),
      margin: const EdgeInsets.only(
        bottom: 12,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// First Row Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Avatar and Name row
                SizedBox(
                  child: Row(
                    children: [
                      ///Avatar
                      profilePicture == null
                          ? CircleAvatar(
                              radius: Get.width * 0.09166666666666666 / 2,
                              backgroundColor: Colors.black,
                              child: Image.asset(
                                'assets/images/profile_dp.png',
                                height: 36,
                                width: 36,
                                fit: BoxFit.cover,
                              ),
                            )
                          : CircleAvatar(
                              radius: Get.width * 0.09166666666666666 / 2,
                              backgroundColor: Colors.black,
                              child: ClipOval(
                                child: Image.network(
                                  profilePicture!,
                                  height: 36,
                                  width: 36,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      const SizedBox(width: 14),

                      ///Name and Designation Button
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          name == null
                              ? ALBigText(text: 'Unknown')
                              : SizedBox(
                                  width: Get.width * 0.3425925925925925,
                                  child: Text(
                                    // 'Sireen Ibnu Kabeer',
                                    name!.toUpperCase(),
                                    overflow: TextOverflow.ellipsis,
                                    // maxLines: 2,
                                    style: PABTextTheme.headline1.copyWith(
                                      fontSize: 14,
                                      color: const Color(0xff0A0413),
                                      fontWeight: FontWeight.w800,
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                          designation == null
                              ? const ALSmallText(
                                  text: 'Unknown', fontWeight: FontWeight.w600)
                              : SizedBox(
                                  width: Get.width * 0.3425925925925925,
                                  child: ALSmallText(
                                      text: designation!,
                                      fontWeight: FontWeight.w600),
                                )
                        ],
                      ),
                    ],
                  ),
                ),

                ///View Button
                TextButton(
                  onPressed: onTapView,
                  child: const ALSmallText(
                      text: 'View Details', color: Colors.white),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff74707B)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                ),
              ],
            ),
            const Divider(
              height: 30,
              thickness: 1,
              color: PABColorTheme.recruiterPageColor,
            ),

            ///Details
            Column(
              children: [
                ///Education
                Row(
                  children: [
                    SvgPicture.asset('assets/images/Education.svg'),
                    // const Icon(
                    //   FeatherIcons.bookOpen,
                    //   color: PABColorTheme.applicantListContentColor,
                    //   size: 14,
                    // ),
                    const SizedBox(width: 10),
                    education == null
                        ? const ALSmallText(text: 'Not Updated')
                        : education == ""
                            ? const ALSmallText(text: 'Not Updated')
                            : ALSmallText(text: education!),
                  ],
                ),
                const SizedBox(height: 7),

                ///Location
                Row(
                  children: [
                    SvgPicture.asset('assets/images/Location.svg'),
                    // const Icon(
                    //   Icons.location_on_outlined,
                    //   color: PABColorTheme.applicantListContentColor,
                    //   size: 14,
                    // ),
                    const SizedBox(width: 14),
                    place == null || place == ''
                        ? const ALSmallText(text: 'Unknown')
                        : ALSmallText(text: place!),
                  ],
                ),
                const SizedBox(height: 7),

                ///Experience
                Row(
                  children: [
                    SvgPicture.asset('assets/images/Experience.svg'),
                    // const Icon(
                    //   Icons.access_time_outlined,
                    //   color: PABColorTheme.applicantListContentColor,
                    //   size: 14,
                    // ),
                    const SizedBox(width: 10),
                    experience == ''
                        ? const ALSmallText(text: 'Not Updated')
                        : experience == 'fresher'
                            ? const ALSmallText(text: 'Fresher')
                            : experience == 'experienced'
                                ? const ALSmallText(text: 'Experienced')
                                : experience == null
                                    ? const ALSmallText(text: 'Not Updated')
                                    : ALSmallText(
                                        text: experience
                                            .toString()
                                            .replaceAll('Experience.', '')
                                            .replaceAll('EMPTY', 'Not Updated')
                                            .replaceAll('FRESHER', 'Fresher')
                                            .replaceAll(
                                                'EXPERIENCED', 'Experienced'),
                                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

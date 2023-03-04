// ignore_for_file: must_be_immutable, avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:pabjobs/common/applicant_listing_small_text.dart';
import 'package:pabjobs/entities/api_service_recruiter.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';
import 'package:path_provider/path_provider.dart';
import 'applicant_listing_big_text.dart';

class ApplicantListingCard extends StatefulWidget {
  final String? avatarImage;
  final String? name;
  final String? resumeUrl;
  String? resumeName;
  final String? jobType;
  final String? id;
  final String? education;
  final String? location;
  final String? experience;
  late String? status;
  final VoidCallback onTap;
  ApplicantListingCard({
    Key? key,
    required this.avatarImage,
    required this.name,
    required this.resumeUrl,
    required this.resumeName,
    required this.jobType,
    required this.id,
    required this.education,
    required this.location,
    required this.experience,
    required this.status,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ApplicantListingCard> createState() => _ApplicantListingCardState();
}

class _ApplicantListingCardState extends State<ApplicantListingCard> {
  // late String designation = widget.jobType![1];
  // @override
  @override
  Widget build(BuildContext context) {
    print(92 / Get.width);
    return Container(
      width: Get.width,
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
                      widget.avatarImage == null
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
                                  widget.avatarImage!,
                                  height: 36,
                                  width: 36,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      const SizedBox(width: 14),

                      ///Name and View Details Button
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.name!.isEmpty
                              ? ALBigText(text: 'Unknown')
                              : SizedBox(
                                  width: Get.width * 0.3425925925925925,
                                  child: Text(
                                    widget.name!,
                                    overflow: TextOverflow.ellipsis,
                                    // maxLines: 2,
                                    style: PABTextTheme.headline1.copyWith(
                                      fontSize: 14,
                                      color: const Color(0xff0A0413),
                                      fontWeight: FontWeight.bold,
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                          InkWell(
                            onTap: widget.onTap,
                            child: const Text(
                              'View Details',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff54347D),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'PlusJakartaSans',
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                ///Resume Button
                TextButton(
                  onPressed: () => openFile(
                    url:
                        // 'https://pabsolution-bucket-1.s3-ap-south-1.amazonaws.com/pabProfiles/file1657705357421.pdf',
                        // ignore: prefer_if_null_operators
                        widget.resumeUrl == null ? null : widget.resumeUrl,
                    fileName: widget.resumeName,
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff74707B)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  child: Row(
                    children: [
                      const ALSmallText(text: 'Resume', color: Colors.white),
                      const SizedBox(width: 2),
                      SvgPicture.asset('assets/images/Download.svg'),
                      // const Icon(Icons.file_download_outlined,
                      //     color: Colors.white),
                    ],
                  ),
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
                ///Working details
                Row(
                  children: [
                    SvgPicture.asset('assets/images/Job.svg'),
                    // const Icon(
                    //   Icons.work_outline,
                    //   color: PABColorTheme.applicantListContentColor,
                    //   size: 14,
                    // ),
                    const SizedBox(width: 10),

                    ///Job type
                    Row(
                      children: [
                        widget.jobType == null
                            ? const ALSmallText(text: 'Unknown')
                            : ALSmallText(
                                text: widget.jobType!,
                                fontWeight: FontWeight.w600),
                        // ALSmallText(text: ' at $jobLocation'),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 7),

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
                    widget.education == null
                        ? const ALSmallText(text: 'Unknown')
                        : ALSmallText(text: widget.education!),
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
                    const SizedBox(width: 10),
                    widget.location == null || widget.location == ''
                        ? const ALSmallText(text: 'Unknown')
                        : ALSmallText(text: widget.location!),
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
                    widget.experience == null
                        ? const ALSmallText(text: 'Unknown')
                        : ALSmallText(text: widget.experience!),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            ///update status
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ALSmallText(
                        text:
                            'Update ${widget.name!.isEmpty ? 'Unknown' : widget.name} \'s '),
                    const ALSmallText(
                        text: 'status', fontWeight: FontWeight.bold),
                  ],
                ),
                const SizedBox(height: 7),
                widget.status == "applied"

                    ///Shortlist/reject
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: SvgPicture.asset(
                          //       'assets/images/Pending-Icon.svg'),
                          //   iconSize: 32,
                          // ),
                          InkWell(
                            onTap: () async {
                              await ApiServiceRecruiter.statusUpdateId(
                                  widget.id!, 'shortlisted');
                              setState(() {
                                widget.status = 'shortlisted';
                              });
                            },
                            child: Container(
                              height: 36,
                              width: Get.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffFFA238),
                              ),
                              child: const Center(
                                child: ALSmallText(
                                  text: 'Shortlist',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          // const SizedBox(width: 14),
                          InkWell(
                            onTap: () async {
                              await ApiServiceRecruiter.statusUpdateId(
                                  widget.id!, 'rejected');
                              setState(() {
                                widget.status = 'rejected';
                              });
                            },
                            child: Container(
                              height: 36,
                              width: Get.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffDE2551),
                              ),
                              child: const Center(
                                child: ALSmallText(
                                  text: 'Reject',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : widget.status == "shortlisted"

                        ///accept/reject
                        ? Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  await ApiServiceRecruiter.statusUpdateId(
                                      widget.id!, 'accepted');
                                  setState(() {
                                    widget.status = 'accepted';
                                  });
                                },
                                child: Container(
                                  height: 36,
                                  width: Get.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xff3CD89F),
                                  ),
                                  child: const Center(
                                    child: ALSmallText(
                                      text: 'Accept',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              InkWell(
                                onTap: () async {
                                  await ApiServiceRecruiter.statusUpdateId(
                                      widget.id!, 'rejected');
                                  setState(() {
                                    widget.status = 'rejected';
                                  });
                                },
                                child: Container(
                                  height: 36,
                                  width: Get.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xffDE2551),
                                  ),
                                  child: const Center(
                                    child: ALSmallText(
                                      text: 'Reject',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : widget.status == 'rejected'

                            ///rejected
                            ? Container(
                                height: 36,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xffDE2551),
                                ),
                                child: const Center(
                                  child: ALSmallText(
                                    text: 'Rejected',
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : widget.status == 'accepted'

                                ///accepted
                                ? Container(
                                    height: 36,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: const Color(0xff3CD89F),
                                    ),
                                    child: const Center(
                                      child: ALSmallText(
                                        text: 'Accepted',
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : widget.status == 'cancelled'
                                    ? Container(
                                        height: 36,
                                        width: Get.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: const Color(0xff74707B),
                                        ),
                                        child: const Center(
                                          child: ALSmallText(
                                            text: 'Cancelled',
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : const Text('ERROR')
              ],
            )
          ],
        ),
      ),
    );
  }

  Future openFile({required String? url, String? fileName}) async {
    final file = await downloadFile(url!, fileName!);
    if (file == null) {
      return Get.snackbar('Message', 'Candidate not uploaded resume',
          backgroundColor: Colors.white, colorText: Colors.red);
    }
    print('path: ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 0));
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      print('Downloaded');
      return file;
    } catch (e) {
      print(e);
      return null;
    }
  }
}

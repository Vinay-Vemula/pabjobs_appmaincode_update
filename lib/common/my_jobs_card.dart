import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pabjobs/common/applicant_listing_big_text.dart';
import 'package:pabjobs/pages/recruiter/my_jobs/edit_page/edit_page.dart';
import 'package:pabjobs/pages/recruiter/my_jobs/view_page/view_page.dart';
import 'package:pabjobs/theme/color_theme.dart';

import '../theme/text_theme.dart';

class MyJobsCard extends StatelessWidget {
  String jobTitle;
  String openings;
  int index;
  final VoidCallback onTap;
  VoidCallback onTapView;
  VoidCallback onTapEdit;
  VoidCallback onTapDelete;
  MyJobsCard({
    Key? key,
    required this.jobTitle,
    required this.openings,
    required this.index,
    required this.onTap,
    required this.onTapView,
    required this.onTapEdit,
    required this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 24, right: 18),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * .371345,
                    child: Text(
                      // 'Your Name abcdefghijkaskjhakshd',
                      jobTitle,
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
                  // ALBigText(
                  //   text: jobTitle,
                  //   fontThickness: FontWeight.w800,
                  //   size: 14,
                  // ),
                  Row(
                    children: [
                      ALBigText(
                        text: 'Openings : ',
                        size: 12,
                        fontThickness: FontWeight.w400,
                      ),
                      ALBigText(
                        text: openings,
                        size: 12,
                        fontThickness: FontWeight.w700,
                      ),
                    ],
                  )
                ],
              ),
              //View applicants
              InkWell(
                onTap: onTap,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  height: Get.height * .0493218249075,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: PABColorTheme.darkbuttonColor,
                  ),
                  child: ALBigText(
                    text: 'View Applicant',
                    color: Colors.white,
                    size: 12,
                    fontThickness: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 23),
          Row(
            children: [
              InkWell(
                onTap: onTapView,
                child: IconText(
                  icon: Image.asset(
                    'assets/images/eye.png',
                    width: 14,
                    height: 14,
                  ),
                  text: 'View',
                  color: PABColorTheme.darkbuttonColor,
                  dot: true,
                ),
              ),
              InkWell(
                onTap: onTapEdit,
                child: IconText(
                  icon: Image.asset(
                    'assets/images/edit.png',
                    width: 14,
                    height: 14,
                  ),
                  text: 'Edit',
                  color: const Color(0xffFE8D2B),
                  dot: true,
                ),
              ),
              InkWell(
                onTap: onTapDelete,
                child: IconText(
                  icon: Image.asset(
                    'assets/images/remove.png',
                    width: 14,
                    height: 14,
                  ),
                  text: 'Delete',
                  color: const Color(0xffFF2D42),
                  dot: false,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  Image icon;
  String text;
  Color color;
  bool dot;
  IconText({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.dot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        const SizedBox(width: 4),
        ALBigText(
          text: text,
          size: 12,
          color: color,
        ),
        dot
            ? Row(
                children: [
                  const SizedBox(width: 16),
                  SvgPicture.asset('assets/images/dot_symbol.svg'),
                  const SizedBox(width: 16),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}

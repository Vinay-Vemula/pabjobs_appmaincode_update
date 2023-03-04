import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:pabjobs/theme/text_theme.dart';

class JobAlertCard extends StatelessWidget {
  final String name;
  final String description;
  final Widget jobtype;
  final String place;
  final String salary;
  final Widget image;
  final VoidCallback callback;
  const JobAlertCard(
      {Key? key,
      required this.name,
      required this.description,
      required this.jobtype,
      required this.place,
      required this.salary,
      required this.callback,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 345,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            )),
        child: InkWell(
            onTap: callback,
            child: Container(
                width: Get.width,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 12, bottom: 16),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                                height: 68,
                                width: 68,
                                color: Colors.white,
                                child: image
                                // Image.asset("assets/images/job_logo.png")
                                )),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name,
                                style: PABTextTheme.headline1.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                            SizedBox(
                              width: Get.width * 0.5,
                              child: Text(description,
                                  overflow: TextOverflow.ellipsis,
                                  style: PABTextTheme.headline1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14)),
                            ),
                            const SizedBox(height: 16),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/logos/icon-ios-wallet.svg"),
                                const SizedBox(width: 10),
                                Text(
                                  salary,
                                  style: PABTextTheme.headline1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/logos/Icon material-location-on.svg"),
                                const SizedBox(width: 10),
                                Text(
                                  place,
                                  style: PABTextTheme.headline1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                SvgPicture.asset("assets/logos/clock_icon.svg"),
                                const SizedBox(width: 10),
                                jobtype
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}

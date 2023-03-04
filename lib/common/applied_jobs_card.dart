import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pabjobs/theme/text_theme.dart';

class AppliedJobCard extends StatelessWidget {
  final String name;
  final String description;
  final String jobtype;
  final String place;
  final String salary;
  final String appliedDate;
  final Widget image;
  final VoidCallback callback;
  const AppliedJobCard(
      {Key? key,
      required this.name,
      required this.description,
      required this.jobtype,
      required this.place,
      required this.salary,
      required this.appliedDate,
      required this.callback,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 185,
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
                margin: const EdgeInsets.only(bottom: 16),
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
                                child: image)),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name,
                                style: PABTextTheme.headline1.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                            Text(description,
                                style: PABTextTheme.headline1.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14)),
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
                                      fontSize: 11),
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
                                      fontSize: 11),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                SvgPicture.asset("assets/logos/clock_icon.svg"),
                                const SizedBox(width: 10),
                                Text(
                                  jobtype,
                                  style: PABTextTheme.headline1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Text(
                      appliedDate,
                      style: PABTextTheme.headline1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                          fontSize: 12),
                    ),
                  ],
                ))));
  }
}

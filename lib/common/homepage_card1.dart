import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class HomePageCard1 extends StatelessWidget {
  final String name;
  final String description;
  final String jobtype;
  final String place;
  final String salary;
  final Widget image;
  final VoidCallback callback;
  const HomePageCard1({
    Key? key,
    required this.callback,
    required this.name,
    required this.description,
    required this.jobtype,
    required this.place,
    required this.salary,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
          width: Get.width - 32,
          decoration: BoxDecoration(
              color: PABColorTheme.purpleCardColor,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Container(
                            height: 40,
                            width: 40,
                            color: Colors.white,
                            child: image
                            // Image.asset("assets/images/infosys_logo.png")
                            )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: PABTextTheme.headline1.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      const SizedBox(height: 2),
                      Text(description,
                          style: PABTextTheme.headline1.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 12)),
                      const SizedBox(height: 4),
                      Container(
                        decoration: BoxDecoration(
                            color: PABColorTheme.darkbuttonColor,
                            borderRadius: BorderRadius.circular(6)),
                        padding: const EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          jobtype,
                          style: PABTextTheme.headline1.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 11),
                        )),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(place,
                      style: PABTextTheme.headline1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 12)),
                  const Spacer(),
                  Text("₹ " + salary,
                      style: PABTextTheme.headline1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ],
              )
            ],
          )),
    );
  }
}

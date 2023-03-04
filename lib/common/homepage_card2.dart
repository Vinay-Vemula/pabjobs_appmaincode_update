import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pabjobs/theme/text_theme.dart';

class HomePageCard2 extends StatelessWidget {
  final String name;
  final String description;
  final Widget jobtype;
  final String place;
  final String salary;
  final Widget favourite;
  final Widget image;
  final VoidCallback callback;
  const HomePageCard2(
      {Key? key,
      required this.name,
      required this.description,
      required this.place,
      required this.salary,
      required this.jobtype,
      required this.callback,
      required this.image,
      required this.favourite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: callback,
        child: Stack(
          children: [
            Container(
                width: Get.width,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 16, bottom: 16, left: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                            height: 60,
                            width: 60,
                            color: Colors.white,
                            child: image)),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width * .5,
                          child: Text(name,
                              style: PABTextTheme.headline1.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                        ),
                        SizedBox(
                          width: Get.width * .5,
                          child: Text(description,
                              overflow: TextOverflow.ellipsis,
                              style: PABTextTheme.headline1.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)),
                        ),
                        const SizedBox(height: 8),
                        Flexible(
                          child: Row(
                            children: [
                              jobtype,
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                width: 4,
                                height: 4,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffC8C8C8),
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                child: Text(
                                  place,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: PABTextTheme.headline1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 11),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                width: 4,
                                height: 4,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffC8C8C8),
                                ),
                              ),
                              Text(
                                salary,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: PABTextTheme.headline1.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 11),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            Positioned(right: 15, top: 5, child: favourite)
          ],
        ));
  }
}

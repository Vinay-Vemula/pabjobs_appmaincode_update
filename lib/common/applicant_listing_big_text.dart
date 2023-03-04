// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pabjobs/theme/text_theme.dart';

class ALBigText extends StatelessWidget {
  Color? color;
  final String text;
  double? size;
  final FontWeight fontThickness;

  ALBigText({
    Key? key,
    this.color = const Color(0xff0A0413),
    required this.text,
    this.size,
    this.fontThickness = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: PABTextTheme.headline1.copyWith(
          fontSize: size ?? Get.width * 0.035648148148148144,
          color: color,
          fontWeight: fontThickness),
    );
  }
}

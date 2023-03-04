import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pabjobs/theme/text_theme.dart';

class ALSmallText extends StatelessWidget {
  final Color? color;
  final String? text;
  final FontWeight fontWeight;
  final TextOverflow overFlow;
  const ALSmallText(
      {Key? key,
      this.color = const Color(0xff0A0413),
      required this.text,
      this.fontWeight = FontWeight.w500,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: 1,
      overflow: overFlow,
      style: PABTextTheme.headline2.copyWith(
        color: color!.withOpacity(.6),
        fontWeight: fontWeight,
      ),
    );
  }
}

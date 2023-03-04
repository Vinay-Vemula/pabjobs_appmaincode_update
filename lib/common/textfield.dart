// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:pabjobs/theme/text_theme.dart';

class Textfield extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  bool obscure;
  TextInputType textInputType;
  Widget Icon;

  Textfield({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscure,
    required this.textInputType,
    required this.Icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      controller: controller,
      obscureText: obscure,
      style: PABTextTheme.content.copyWith(color: Colors.white),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
          labelStyle: PABTextTheme.content
              .copyWith(color: const Color.fromRGBO(255, 255, 255, 1)),
          suffixIconColor: Colors.white,
          hintText: hintText,
          hintStyle: PABTextTheme.content.copyWith(color: Colors.white38),
          suffixIcon: Icon),
    );
  }
}

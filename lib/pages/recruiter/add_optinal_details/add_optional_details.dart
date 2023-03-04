import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pabjobs/common/applicant_listing_big_text.dart';
import 'package:pabjobs/theme/color_theme.dart';

class AddOptionalDetails extends StatelessWidget {
  const AddOptionalDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('height = ${32 / Get.height}');
    // print('width = ${26 / Get.width}');
    return Scaffold(
      backgroundColor: PABColorTheme.backgrndColor,
      body: Container(
        padding: EdgeInsets.only(
          left: Get.width * 0.0662037037037037,
          right: Get.width * 0.0662037037037037,
          bottom: Get.height * 0.03985507246376812,
          top: Get.height * 0.11209239130434782,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Column contains image,name,email,number and text fields
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Image.asset('assets/logos/company_logo.png')
                      //     : ClipOval(
                      // child: Image.network('image.jpg',
                      // height: 77,
                      // width: 77,
                      // fit: BoxFit.cover,
                      // ),
                      ),
                ),
                SizedBox(
                    height: Get.height * 0.007472826086956522), //height = 6
                ///Company Name
                ALBigText(
                  text: 'Perfex Technologies',
                  size: Get.width * 0.04583333333333333,
                  color: Colors.white,
                  fontThickness: FontWeight.w800,
                ),

                ///E mail Id
                ALBigText(
                  text: 'perfex@gmail.com',
                  color: Colors.white,
                  fontThickness: FontWeight.w400,
                ),
                SizedBox(
                    height: Get.height * 0.006227355072463768), //height = 5
                ///Mobile Number
                ALBigText(
                  text: '+91 9123456789',
                  size: Get.width * 0.028009259259259258,
                  color: Colors.white,
                  fontThickness: FontWeight.w300,
                ),
                SizedBox(
                    height: Get.height * 0.10586503623188406), //height = 85

                ///Website link
                Container(
                  height: 54,
                  decoration: BoxDecoration(
                    color: PABColorTheme.backgrndColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    // initialValue: 'Heloo',
                    // keyboardType: keyboardType,
                    // maxLines: null,
                    // controller: postJobController,
                    decoration: InputDecoration(
                      // fillColor: Colors.white,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white.withOpacity(.6), width: 1),
                      ),
                      contentPadding: const EdgeInsets.all(18),
                      hintText: 'Website Link',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.white.withOpacity(.6),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.024909420289855072),

                ///Founded Date
                Container(
                  height: 54,
                  decoration: BoxDecoration(
                    color: PABColorTheme.backgrndColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    // initialValue: 'Heloo',
                    // keyboardType: keyboardType,
                    // maxLines: null,
                    // controller: postJobController,
                    decoration: InputDecoration(
                      // fillColor: Colors.white,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white.withOpacity(.6), width: 1),
                      ),
                      contentPadding: const EdgeInsets.all(18),
                      hintText: 'Founded Date',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.white.withOpacity(.6),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.024909420289855072),

                ///Industry Type
                Container(
                  height: 54,
                  decoration: BoxDecoration(
                    color: PABColorTheme.backgrndColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    // initialValue: 'Heloo',
                    // keyboardType: keyboardType,
                    // maxLines: null,
                    // controller: postJobController,
                    decoration: InputDecoration(
                      // fillColor: Colors.white,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white.withOpacity(.6), width: 1),
                      ),
                      contentPadding: const EdgeInsets.all(18),
                      hintText: 'Industry Type',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.white.withOpacity(.6),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// Buttons Column
            Column(
              children: [
                ///Skip button
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: Get.width,
                    height: Get.height * 0.0672554347826087,
                    child: Center(
                      child: ALBigText(
                        text: 'Skip',
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          Get.width * 0.06874999999999999),
                      border: Border.all(
                        color: PABColorTheme.darkbuttonColor,
                        width: 2,
                      ),
                      // color: Colors.redAccent,
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.014945652173913044), //12
                ///Skip button
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: Get.width,
                    height: Get.height * 0.0672554347826087,
                    child: Center(
                      child: ALBigText(
                        text: 'Continue',
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          Get.width * 0.06874999999999999),
                      color: PABColorTheme.darkbuttonColor,
                      // color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pabjobs/common/applicant_listing_big_text.dart';

class PostJobContents extends StatelessWidget {
  final String heading;
  final String hintText;
  final double height;
  final TextInputType keyboardType;
  final TextEditingController postJobController;
  const PostJobContents({
    Key? key,
    required this.heading,
    required this.hintText,
    this.height = 54,
    required this.postJobController,
    this.keyboardType = TextInputType.multiline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ALBigText(text: heading, size: 12, fontThickness: FontWeight.w600),
        const SizedBox(height: 7),
        Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            // initialValue: 'Heloo',
            keyboardType: keyboardType,
            maxLines: null,
            controller: postJobController,
            decoration: InputDecoration(
              // fillColor: Colors.white,
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              hintText: hintText,
              hintStyle:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

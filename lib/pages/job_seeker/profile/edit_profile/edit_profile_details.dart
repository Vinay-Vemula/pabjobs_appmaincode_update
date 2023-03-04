import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pabjobs/common/custom_searchable_dropdown.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/pages/job_seeker/profile/edit_profile/edit_profile_details_controller.dart';
import 'package:pabjobs/pages/job_seeker/profile/profile_controller.dart';

import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class EditProfileDetails extends StatefulWidget {
  const EditProfileDetails({Key? key}) : super(key: key);

  @override
  State<EditProfileDetails> createState() => _EditProfileDetailsState();
}

class _EditProfileDetailsState extends State<EditProfileDetails> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController text1Controller = TextEditingController();
  final TextEditingController text2Controller = TextEditingController();

  EditProfileController controller = Get.put(EditProfileController());
  ProfileController profileController = Get.put(ProfileController());

  String? _myLocationSelection;
  String? experience;

  String? _experienceyear;
  List experienceyear = [
    "0-2 Years",
    "2-5 Years",
    "5-7 Years",
    "7-10 Years",
    "10+ Years",
  ];

  int _value = 0;
  Widget CustomRadioButton(String _text1, int _index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _value = _index;
          experience = _text1.toLowerCase();
          print(experience);
          controller.defaultSelection(_value);
        });
      },
      child: Container(
        width: Get.width * .33,
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Center(
          child: Text(
            _text1,
            style: PABTextTheme.content.copyWith(
              color: (_value == _index) ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
      style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor:
              (_value == _index) ? PABColorTheme.purpleColor : Colors.white),
    );
  }

  String? imageFile;
  File? _picked_file;
  String? fileName = "";

  _getFromGallery() async {
    // ignore: deprecated_member_use
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _picked_file = File(pickedFile.path);
        fileName = _picked_file!.path.split('/').last;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Container(
          color: PABColorTheme.backgrndColor,
          height: Get.height,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.white,
            ),
          ),
        );
      } else {
/* default experience selection */
        if (controller.data.value.experience == "fresher") {
          _value = 1;
        } else if (controller.data.value.experience == "experienced") {
          _value = 2;
        } else {
          _value = 0;
        }

        return Scaffold(
          body: Container(
            color: const Color(0xffF5F5F5),
            height: Get.height,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 62),
                    Container(
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(Icons.arrow_back_ios,
                                  color: Colors.black)),
                          const SizedBox(width: 25),
                          Text(
                            "Edit Profile",
                            textAlign: TextAlign.left,
                            style: PABTextTheme.headline1.copyWith(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 58),
                    Center(
                      child: Container(
                        width: 96,
                        height: 96,
                        child: InkWell(
                            onTap: () {
                              _getFromGallery();
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                      alignment: Alignment.bottomCenter,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(96),
                                        child: (_picked_file != null)
                                            ? Image.file(
                                                File(_picked_file!.path),
                                                fit: BoxFit.cover,
                                                height: 96,
                                                width: 96)
                                            : (controller.data.value
                                                        .profileImage ==
                                                    null)
                                                ? Image.asset(
                                                    "assets/images/profile_dp.png",
                                                    fit: BoxFit.cover,
                                                    height: 96,
                                                    width: 96)
                                                : (controller.data.value
                                                            .profileImage ==
                                                        "")
                                                    ? Image.asset(
                                                        "assets/images/profile_dp.png",
                                                        fit: BoxFit.cover,
                                                        height: 96,
                                                        width: 96)
                                                    : Image.network(
                                                        controller.data.value
                                                            .profileImage!,
                                                        fit: BoxFit.cover,
                                                        height: 96,
                                                        width: 96),
                                      )),
                                  Positioned(
                                      right: 14,
                                      bottom: 1,
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        padding: const EdgeInsets.all(7),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                            "assets/logos/Icon feather-edit-3.svg",
                                            width: 9,
                                            height: 9),
                                      ))
                                ],
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Your Experience",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        CustomRadioButton("Fresher", 1),
                        const Spacer(),
                        CustomRadioButton("Experienced", 2),
                      ],
                    ),
                    const SizedBox(height: 14),
                    (controller.data.value.experience == "experienced")
                        ? Container(
                            width: double.infinity,
                            padding:
                                const EdgeInsets.only(left: 17.0, right: 17.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white)),
                            child: DropdownButton(
                                items: experienceyear.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item,
                                        style: PABTextTheme.content
                                            .copyWith(color: Colors.black)),
                                    value: item.toString(),
                                  );
                                }).toList(),
                                onChanged: (String? newVal) {
                                  setState(() {
                                    _experienceyear = newVal;
                                    print(_experienceyear);
                                  });
                                },
                                value: _experienceyear,
                                icon: const Icon(Icons.arrow_drop_down),
                                dropdownColor: Colors.white,
                                underline: const SizedBox(),
                                isExpanded: true,
                                hint: (controller.data.value.totalExperience !=
                                        "")
                                    ? Text(
                                        controller.data.value.totalExperience!,
                                        style: PABTextTheme.content
                                            .copyWith(color: Colors.black))
                                    : Text('Total Experience',
                                        style: PABTextTheme.content
                                            .copyWith(color: Colors.black))),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 14),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: textController,
                      style: PABTextTheme.content.copyWith(color: Colors.black),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 17),
                          labelStyle: PABTextTheme.content
                              .copyWith(color: Colors.black),
                          suffixIconColor: Colors.black,
                          hintText: controller.data.value.name,
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: text1Controller,
                      style: PABTextTheme.content.copyWith(color: Colors.black),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 17),
                          labelStyle: PABTextTheme.content
                              .copyWith(color: Colors.black),
                          suffixIconColor: Colors.white,
                          hintText: controller.data.value.email,
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      keyboardType: TextInputType.phone,
                      controller: text2Controller,
                      style: PABTextTheme.content.copyWith(color: Colors.black),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 17),
                          labelStyle: PABTextTheme.content
                              .copyWith(color: Colors.black),
                          suffixIconColor: Colors.black,
                          hintText:
                              controller.data.value.contactNumber.toString(),
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 14),
                    CustomSearchableDropDown(
                      items: controller.locationData,
                      label: (controller.data.value.currentlocation!.isNotEmpty)
                          ? controller.data.value.currentlocation
                              .toString()
                              .replaceAll(RegExp(r'[^\w\s]+'), '  ')
                          : 'Select Location',
                      labelStyle:
                          PABTextTheme.content.copyWith(color: Colors.black),
                      dropdownItemStyle:
                          PABTextTheme.content.copyWith(color: Colors.black),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Icon(Icons.search, color: Colors.grey),
                      ),
                      dropDownMenuItems: controller.locationData.map((item) {
                        return item['location'];
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          _myLocationSelection = value['location'].toString();
                          print(_myLocationSelection);
                        } else {
                          _myLocationSelection = null;
                        }
                      },
                    ),
                    const SizedBox(height: 28),
                    Container(
                      padding: const EdgeInsets.only(bottom: 32),
                      width: Get.width,
                      child: TextButton(
                          child: Text(
                            'Save Changes',
                            style: PABTextTheme.content
                                .copyWith(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 31),
                            primary: Colors.white,
                            backgroundColor: PABColorTheme.primaryColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(31)),
                            ),
                          ),
                          onPressed: () async {
                            _experienceyear ??= "";
                            if (fileName != "") {
                              controller.uploadImage(_picked_file!);
                            }

                            APIService.EditProfileDetails(
                              (experience != "")
                                  ? controller.data.value.experience!
                                  : experience!,
                              (_experienceyear == "")
                                  ? controller.data.value.totalExperience!
                                  : _experienceyear!,
                              (textController.text == "")
                                  ? controller.data.value.name!
                                  : textController.text,
                              (text1Controller.text == "")
                                  ? controller.data.value.email!
                                  : text1Controller.text,
                              (text2Controller.text == "")
                                  ? controller.data.value.contactNumber
                                      .toString()
                                  : text2Controller.text,
                              (_myLocationSelection != null)
                                  ? _myLocationSelection.toString()
                                  : controller.data.value.currentlocation
                                      .toString(),
                            );
                            profileController.fetchData();
                            Get.back();
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
  }
}

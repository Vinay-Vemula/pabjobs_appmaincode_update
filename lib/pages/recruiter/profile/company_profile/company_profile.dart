// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pabjobs/common/custom_searchable_dropdown.dart';
import 'package:pabjobs/entities/api_service_recruiter.dart';
import 'package:pabjobs/pages/recruiter/profile/company_profile/company_profile_controller.dart';
import 'package:pabjobs/pages/recruiter/profile/recruiter_profile_controller.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({Key? key}) : super(key: key);

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  CompanyProfileController controller = Get.put(CompanyProfileController());
  RecruiterProfileController recruiterController =
      Get.put(RecruiterProfileController());

  late TextEditingController companyNameController =
      TextEditingController(text: controller.profileData.value.companyname);
  late TextEditingController websiteLinkController =
      TextEditingController(text: controller.profileData.value.websitelink);
  late TextEditingController text1Controller = TextEditingController();

  late TextEditingController descriptionController =
      TextEditingController(text: controller.profileData.value.description);
  late TextEditingController phoneController = TextEditingController(
      text: controller.profileData.value.contactNumber!.toString());
  late TextEditingController emailController =
      TextEditingController(text: controller.profileData.value.email);
  late TextEditingController countryController =
      TextEditingController(text: controller.profileData.value.country);
  late TextEditingController stateController =
      TextEditingController(text: controller.profileData.value.state);

  late TextEditingController pinCodeController = TextEditingController(
      text: controller.profileData.value.pincode.toString());
  late TextEditingController addressController =
      TextEditingController(text: controller.profileData.value.address);
  late TextEditingController facebookController =
      TextEditingController(text: controller.profileData.value.facebook);
  late TextEditingController twitterController =
      TextEditingController(text: controller.profileData.value.twitter);
  late TextEditingController googleController =
      TextEditingController(text: controller.profileData.value.google);
  late TextEditingController linkedinController =
      TextEditingController(text: controller.profileData.value.linkedin);

  String? imageFile;
  File? _picked_file;
  String? fileName = "";

  _getFromGallery() async {
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

  String? _myLocationSelection;
  String? _industrySelection;

  /// Date
  late DateTime? _selectedDate1 =
      controller.profileData.value.foundedDate != null
          ? DateTime.tryParse(controller.profileData.value.foundedDate)
          : DateTime.now();

  void _pickDateDialog1() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(1950),
            //what will be the previous supported year in picker
            lastDate: DateTime
                .now()) //what will be the up to supported date in picker
        .then((pickedDate1) {
      //then usually do the future job
      if (pickedDate1 == null) {
        //if user tap cancel then this function will stop

        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate1 = pickedDate1;
      });
    });
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
                    /// Back button
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
                          "Company Profile",
                          textAlign: TextAlign.left,
                          style: PABTextTheme.headline1.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                    const SizedBox(height: 58),

                    ///Profile Picture
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
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  ///Profile Image
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
                                            : (controller.profileData.value
                                                        .profileImage ==
                                                    null)
                                                ? Image.asset(
                                                    "assets/logos/company_logo.png",
                                                    fit: BoxFit.cover,
                                                    height: 96,
                                                    width: 96)
                                                : Image.network(
                                                    controller.profileData.value
                                                        .profileImage!,
                                                    fit: BoxFit.cover,
                                                    height: 96,
                                                    width: 96),
                                      )),

                                  ///edit Button
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
                    const SizedBox(height: 46),

                    ///Company Name
                    Text(
                      "Company Name",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: companyNameController,
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
                          hintText: "Enter Your Company Name",
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 16),

                    ///Website Link
                    Text(
                      "Website Link",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: websiteLinkController,
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
                          hintText: "Enter Your Website Link",
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 16),

                    ///Founded Date
                    Text(
                      "Founded Date",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Container(
                      width: Get.width,
                      child: OutlinedButton(
                          child: _selectedDate1 != null
                              ? Text(DateFormat.yMMMd().format(_selectedDate1!),
                                  style: PABTextTheme.content
                                      .copyWith(color: Colors.black))
                              : Text('Choose Date',
                                  style: PABTextTheme.content
                                      .copyWith(color: Colors.black)),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            alignment: Alignment.centerLeft,
                            side: const BorderSide(color: Colors.white),
                            padding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 18),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          onPressed: _pickDateDialog1),
                    ),
                    const SizedBox(height: 16),

                    ///Industry Type
                    Text(
                      "Industry Type",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    CustomSearchableDropDown(
                      items: controller.industryData,
                      label:
                          (controller.profileData.value.organizationType != "")
                              ? controller.profileData.value.organizationType
                              : 'Enter industry',
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
                      dropDownMenuItems: controller.industryData.map((item) {
                        return item['Category'];
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          _industrySelection = value['Category'].toString();
                          print(_industrySelection);
                        } else {
                          _industrySelection = null;
                        }
                      },
                    ),

                    const SizedBox(height: 16),

                    ///Description
                    Text(
                      "Description",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      controller: descriptionController,
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
                          hintText: "Describe here",
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 16),

                    ///Phone
                    Text(
                      "Phone",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
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
                          hintText: "Enter Your Phone Number",
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 16),

                    ///Email
                    Text(
                      "Email",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: emailController,
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
                          hintText: "Enter your Email",
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 16),

                    ///Country
                    Text(
                      "Country",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: countryController,
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
                          hintText: "Enter Your Country",
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 16),

                    ///State
                    Text(
                      "State",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: stateController,
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
                          hintText: "Enter Your State",
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 16),

                    ///City
                    Text(
                      "City",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    CustomSearchableDropDown(
                      items: controller.locationData,
                      label: (controller.profileData.value.city != "")
                          ? controller.profileData.value.city
                              .toString()
                              .replaceAll(RegExp(r'[^\w\s]+'), '  ')
                          : 'Enter your City',
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

                    const SizedBox(height: 16),

                    ///Pin-code
                    Text(
                      "Pin-code",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.phone,
                      controller: pinCodeController,
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
                          hintText: "Enter Pin Code",
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 16),

                    ///Address
                    Text(
                      "Address",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      controller: addressController,
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
                          hintText: "Enter address",
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 20),

                    ///Social Link
                    Text(
                      "Social Link",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),

                    ///Facebook
                    Text(
                      "Facebook",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: facebookController,
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
                          hintText: "Enter your link to facebook page",
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 16),

                    ///Twitter
                    Text(
                      "Twitter",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: twitterController,
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
                          hintText: "Enter your link to Twitter page",
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 16),

                    ///Google
                    Text(
                      "Google",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: googleController,
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
                          hintText: "Enter your link to Google page",
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 16),

                    ///Linkedin
                    Text(
                      "Linkedin",
                      textAlign: TextAlign.left,
                      style: PABTextTheme.headline1.copyWith(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: linkedinController,
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
                          hintText: "Enter your link to LinkedIn page",
                          hintStyle: PABTextTheme.content
                              .copyWith(color: Colors.black)),
                    ),
                    const SizedBox(height: 16),

                    ///Update Profile Button
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.only(bottom: 111),
                      width: Get.width,
                      child: TextButton(
                          child: Text(
                            'Update Profile',
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
                            // _experienceyear ??= "";
                            if (fileName != "") {
                              controller.uploadImage(_picked_file!);
                            }

                            String? foundedDate = DateFormat.yMMMd()
                                .format(_selectedDate1!)
                                .toString();
                            int? contactNumber =
                                int.parse(phoneController.text);
                            int? pinCode = int.parse(pinCodeController.text);

                            final bool x =
                                await ApiServiceRecruiter.updateCompanyProfile(
                              companyNameController.text,
                              websiteLinkController.text,
                              foundedDate,
                              _industrySelection,
                              descriptionController.text,
                              contactNumber,
                              emailController.text,
                              countryController.text,
                              stateController.text,
                              _myLocationSelection,
                              pinCode,
                              addressController.text,
                              facebookController.text,
                              twitterController.text,
                              googleController.text,
                              linkedinController.text,
                            );

                            if (x) {
                              recruiterController.fetchProfileData();
                              Get.back();
                              Get.snackbar(
                                'Successful',
                                'Profile updated successfully',
                                backgroundColor: Colors.white,
                                colorText: PABColorTheme.darkbuttonColor,
                              );
                            }
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

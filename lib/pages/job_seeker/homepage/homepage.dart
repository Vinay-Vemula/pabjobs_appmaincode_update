// // ignore_for_file: unnecessary_null_comparison

// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// import 'package:pab_jobs/common/homepage_card1.dart';
// import 'package:pab_jobs/common/homepage_card2.dart';
// import 'package:pab_jobs/entities/job_details_model_pagination.dart';
// import 'package:pab_jobs/pages/job_seeker/applied_jobs/applied_jobs.dart';
// import 'package:pab_jobs/pages/job_seeker/filter/filter_listing.dart';
// import 'package:pab_jobs/pages/job_seeker/filter/filter_page.dart';
// import 'package:pab_jobs/pages/job_seeker/filter/search_page.dart';
// import 'package:pab_jobs/pages/job_seeker/homepage/favourites/favourites.dart';
// import 'package:pab_jobs/pages/job_seeker/homepage/homepage_controller.dart';
// import 'package:pab_jobs/pages/job_seeker/homepage/job_alert/job_alert.dart';
// import 'package:pab_jobs/pages/job_seeker/profile/edit_profile/edit_profile_details.dart';
// import 'package:pab_jobs/pages/job_seeker/profile/my_resume/my_resume.dart';
// import 'package:pab_jobs/theme/color_theme.dart';
// import 'package:pab_jobs/theme/text_theme.dart';
// import 'package:shimmer/shimmer.dart';

// import 'job_details.dart/job_details.dart';

// class JHomePage extends StatefulWidget {
//   const JHomePage({Key? key}) : super(key: key);

//   @override
//   State<JHomePage> createState() => _JHomePageState();
// }

// class _JHomePageState extends State<JHomePage> {
//   HomepageController controller = Get.put(HomepageController());

//   @override
//   void initState() {
//     // controller.pagingController.value.addPageRequestListener((pageKey) {
//     //   controller.fetchPage(pageKey);
//     // });
//     super.initState();
//     setState(() {
//       controller.fetchData();
//       // controller.isAppliedMegaJobFair();
//     });
//   }

//   Widget errorDialog({required double size}) {
//     return SizedBox(
//       height: Get.height * 0.4,
//       width: Get.width,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Text('An error occurred when fetching the posts.',
//               textAlign: TextAlign.center,
//               style: PABTextTheme.content.copyWith(
//                   fontSize: 16,
//                   fontWeight: FontWeight.normal,
//                   color: Colors.black)),
//           // const SizedBox(
//           //   height: 5,
//           // ),
//           TextButton(
//               onPressed: () {
//                 setState(() {
//                   controller.loading(true);
//                   controller.error(false);
//                   controller.fetchJobDetails();
//                 });
//               },
//               child: Text(
//                 "Retry",
//                 style: PABTextTheme.content.copyWith(
//                     fontSize: 16,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.purpleAccent),
//               )),
//           const SizedBox(
//             height: 70,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return Obx(() {
//     //   if (controller.isLoading.value) {
//     //     return const SkeletonLoader();
//     //   } else {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             color: PABColorTheme.backgrndColor,
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 50),
//                 const SizedBox(height: 32),
//                 const SizedBox(height: 32),
//                 Container(
//                     width: Get.width,
//                     height: 54,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       border: Border.all(
//                         color: const Color(0xff3B3642),
//                         width: 1,
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         const SizedBox(width: 29),
//                         InkWell(
//                           onTap: () {
//                             Get.to(() => const SearchPage());
//                           },
//                           child: SvgPicture.asset(
//                               "assets/logos/Icon feather-search.svg"),
//                         ),
//                         const SizedBox(width: 18),
//                         InkWell(
//                           onTap: () {
//                             Get.to(() => const SearchPage());
//                           },
//                           child: Text(
//                             "Search Jobs, Job Type, Location",
//                             style: PABTextTheme.headline2.copyWith(
//                               color: Colors.white54,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                         const Spacer(),
//                         InkWell(
//                           onTap: () {
//                             Get.to(() => const FilterPage());
//                           },
//                           child: Container(
//                               width: 44,
//                               height: 44,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(12),
//                                 child: SvgPicture.asset(
//                                     "assets/logos/filter_icon.svg"),
//                               )),
//                         ),
//                         const SizedBox(width: 6),
//                       ],
//                     )),
//               ],
//             ),
//           ),
//           SizedBox.expand(
//             child: DraggableScrollableSheet(
//               initialChildSize: .70,
//               minChildSize: .70,
//               // maxChildSize: 1.0,
//               builder:
//                   (BuildContext context, ScrollController scrollController) {
//                 return SingleChildScrollView(
//                   controller: scrollController,
//                   child: Column(
//                     children: [
//                       Container(
//                           decoration: const BoxDecoration(
//                               color: Color(0xffF5F5F5),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(24.0),
//                                 topRight: Radius.circular(24.0),
//                               )),
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const SizedBox(height: 25),
//                               InkWell(
//                                 onTap: () {
//                                   // (controller.jobFairdata.value.isApplied ==
//                                   //         true)
//                                   //     ? _launchUrl(
//                                   //         "https://pabsolution-bucket-1.s3-ap-south-1.amazonaws.com/" +
//                                   //             controller.jobFairdata.value
//                                   //                 .data!.fileSrc!)
//                                   //     : Get.to(() => JobFair(), arguments: [
//                                   //         controller.data2.value.name!,
//                                   //         controller
//                                   //             .data2.value.contactNumber
//                                   //       ]);
//                                 },
//                                 child: Container(
//                                   width: Get.width,
//                                   child: Image.asset(
//                                       "assets/images/homepage_banner1.png"),
//                                 ),
//                               ),
//                               const SizedBox(height: 36),
//                               Container(
//                                 width: Get.width,
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 10),
//                                 child: Center(
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Expanded(
//                                         child: Column(
//                                           children: [
//                                             InkWell(
//                                               onTap: () {
//                                                 Get.to(
//                                                     () => const FilterListing(),
//                                                     arguments: [
//                                                       [],
//                                                       [],
//                                                       [],
//                                                       [],
//                                                       [],
//                                                       ["Ernakulam"],
//                                                       [],
//                                                       []
//                                                     ]);
//                                               },
//                                               child: ClipRRect(
//                                                   borderRadius:
//                                                       BorderRadius.circular(60),
//                                                   child: Container(
//                                                       height: 60,
//                                                       width: 60,
//                                                       color: Colors.white,
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               10),
//                                                       child: Image.asset(
//                                                           "assets/images/kochi_logo.png"))),
//                                             ),
//                                             Text(
//                                               "Kochi",
//                                               style: PABTextTheme.headline1
//                                                   .copyWith(
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                       fontSize: 12),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Container(
//                                         child: Expanded(
//                                           child: Column(
//                                             children: [
//                                               InkWell(
//                                                 onTap: () {
//                                                   Get.to(
//                                                       () =>
//                                                           const FilterListing(),
//                                                       arguments: [
//                                                         [],
//                                                         [],
//                                                         [],
//                                                         [],
//                                                         [],
//                                                         ["Hyderabad"],
//                                                         [],
//                                                         []
//                                                       ]);
//                                                 },
//                                                 child: ClipRRect(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             60),
//                                                     child: Container(
//                                                         height: 60,
//                                                         width: 60,
//                                                         color: Colors.white,
//                                                         child: Image.asset(
//                                                             "assets/images/hyderabad_logo.png"))),
//                                               ),
//                                               Text(
//                                                 "Hyderabad",
//                                                 style: PABTextTheme.headline1
//                                                     .copyWith(
//                                                         fontWeight:
//                                                             FontWeight.w600,
//                                                         fontSize: 12),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       Container(
//                                         // padding:
//                                         //     const EdgeInsets.only(right: 25),
//                                         child: Expanded(
//                                           child: Column(
//                                             children: [
//                                               InkWell(
//                                                 onTap: () {
//                                                   Get.to(
//                                                       () =>
//                                                           const FilterListing(),
//                                                       arguments: [
//                                                         [],
//                                                         [],
//                                                         [],
//                                                         [],
//                                                         [],
//                                                         ["Chennai"],
//                                                         [],
//                                                         []
//                                                       ]);
//                                                 },
//                                                 child: ClipRRect(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             60),
//                                                     child: Container(
//                                                         height: 60,
//                                                         width: 60,
//                                                         color: Colors.white,
//                                                         child: Image.asset(
//                                                             "assets/images/chennai_logo.png"))),
//                                               ),
//                                               Text(
//                                                 "Chennai",
//                                                 style: PABTextTheme.headline1
//                                                     .copyWith(
//                                                         fontWeight:
//                                                             FontWeight.w600,
//                                                         fontSize: 12),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Column(
//                                           children: [
//                                             InkWell(
//                                               onTap: () {
//                                                 Get.to(
//                                                     () => const FilterListing(),
//                                                     arguments: [
//                                                       [],
//                                                       [],
//                                                       [],
//                                                       [],
//                                                       [],
//                                                       ["Bangalore Rural"],
//                                                       [],
//                                                       []
//                                                     ]);
//                                               },
//                                               child: ClipRRect(
//                                                   borderRadius:
//                                                       BorderRadius.circular(60),
//                                                   child: Container(
//                                                       height: 60,
//                                                       width: 60,
//                                                       color: Colors.white,
//                                                       child: Image.asset(
//                                                           "assets/images/bengaluru_logo.png"))),
//                                             ),
//                                             Text(
//                                               "Bengaluru",
//                                               style: PABTextTheme.headline1
//                                                   .copyWith(
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                       fontSize: 12),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 34),
//                               Obx(() {
//                                 if (controller.isLoading.value) {
//                                   return Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Recommended Jobs For You",
//                                         style: PABTextTheme.headline1.copyWith(
//                                             fontWeight: FontWeight.w900,
//                                             fontSize: 12,
//                                             color: Colors.black),
//                                       ),
//                                       const SizedBox(height: 12),
//                                       Shimmer.fromColors(
//                                           baseColor:
//                                               Colors.black.withOpacity(.5),
//                                           highlightColor: Colors.grey,
//                                           child: Container(
//                                             height: 140,
//                                             width: Get.width,
//                                             decoration: BoxDecoration(
//                                               color: const Color(0xffF5F5F5)
//                                                   .withOpacity(.2),
//                                               borderRadius:
//                                                   BorderRadius.circular(16),
//                                             ),
//                                           )),
//                                       const SizedBox(height: 24),
//                                     ],
//                                   );
//                                 } else {
//                                   return Container(
//                                     child: (controller.data.value.data.isEmpty)
//                                         ? Container()
//                                         : Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 "Recommended Jobs For You",
//                                                 style: PABTextTheme.headline1
//                                                     .copyWith(
//                                                         fontWeight:
//                                                             FontWeight.w900,
//                                                         fontSize: 12,
//                                                         color: Colors.black),
//                                               ),
//                                               const SizedBox(height: 12),
//                                               SizedBox(
//                                                 height: 150,
//                                                 child: ListView.builder(
//                                                     scrollDirection:
//                                                         Axis.horizontal,
//                                                     shrinkWrap: true,
//                                                     physics:
//                                                         const ClampingScrollPhysics(),
//                                                     itemCount: controller
//                                                         .data.value.data.length,
//                                                     itemBuilder:
//                                                         (context, index) {
//                                                       return HomePageCard1(
//                                                         name: controller
//                                                             .data
//                                                             .value
//                                                             .data[index]
//                                                             .jobId!
//                                                             .title!,
//                                                         description: (controller
//                                                                     .data
//                                                                     .value
//                                                                     .data[index]
//                                                                     .recruiter ==
//                                                                 null)
//                                                             ? "Unknown"
//                                                             : controller
//                                                                 .data
//                                                                 .value
//                                                                 .data[index]
//                                                                 .recruiter!
//                                                                 .companyname!,
//                                                         jobtype: controller
//                                                             .data
//                                                             .value
//                                                             .data[index]
//                                                             .jobId!
//                                                             .jobType!,
//                                                         place: controller
//                                                             .data
//                                                             .value
//                                                             .data[index]
//                                                             .jobId!
//                                                             .cities![0],
//                                                         salary: controller
//                                                             .data
//                                                             .value
//                                                             .data[index]
//                                                             .jobId!
//                                                             .salary
//                                                             .toString(),
//                                                         image: (controller
//                                                                     .data
//                                                                     .value
//                                                                     .data[index]
//                                                                     .recruiter ==
//                                                                 null)
//                                                             ? Image.asset(
//                                                                 "assets/logos/company_logo.png")
//                                                             : (controller
//                                                                         .data
//                                                                         .value
//                                                                         .data[
//                                                                             index]
//                                                                         .recruiter!
//                                                                         .profileImage ==
//                                                                     null)
//                                                                 ? Image.asset(
//                                                                     "assets/logos/company_logo.png")
//                                                                 : Image.network(
//                                                                     controller
//                                                                         .data
//                                                                         .value
//                                                                         .data[
//                                                                             index]
//                                                                         .recruiter!
//                                                                         .profileImage!),
//                                                         callback: () {
//                                                           Get.to(
//                                                               () =>
//                                                                   JobDetails(),
//                                                               arguments:
//                                                                   controller
//                                                                       .data
//                                                                       .value
//                                                                       .data[
//                                                                           index]
//                                                                       .jobId!
//                                                                       .id);
//                                                         },
//                                                       );
//                                                     }),
//                                               ),
//                                               const SizedBox(height: 24),
//                                             ],
//                                           ),
//                                   );
//                                 }
//                               }),

//                               Text(
//                                 "Recent Jobs",
//                                 style: PABTextTheme.headline1.copyWith(
//                                     fontWeight: FontWeight.w900,
//                                     fontSize: 12,
//                                     color: Colors.black),
//                               ),
//                               const SizedBox(height: 12),
//                               Obx(() {
//                                 if (controller.isLoading.value) {
//                                   return ConstrainedBox(
//                                     constraints: const BoxConstraints(
//                                         minHeight: 100 * 5),
//                                     child: ListView.builder(
//                                         scrollDirection: Axis.vertical,
//                                         shrinkWrap: true,
//                                         physics:
//                                             const NeverScrollableScrollPhysics(),
//                                         itemCount: 5,
//                                         itemBuilder: (context, index) {
//                                           return Shimmer.fromColors(
//                                               baseColor:
//                                                   Colors.black.withOpacity(.5),
//                                               highlightColor: Colors.grey,
//                                               child: InkWell(
//                                                   onTap: () {},
//                                                   child: Stack(
//                                                     children: [
//                                                       Container(
//                                                           width: Get.width,
//                                                           height: 80,
//                                                           decoration: BoxDecoration(
//                                                               color: const Color(
//                                                                       0xffF5F5F5)
//                                                                   .withOpacity(
//                                                                       .2),
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           20)),
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(10),
//                                                           margin:
//                                                               const EdgeInsets
//                                                                       .only(
//                                                                   right: 12,
//                                                                   bottom: 16),
//                                                           child: Row(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               ClipRRect(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               12),
//                                                                   child:
//                                                                       Container(
//                                                                     height: 60,
//                                                                     width: 60,
//                                                                     color: const Color(
//                                                                             0xffF5F5F5)
//                                                                         .withOpacity(
//                                                                             .2),
//                                                                   )),
//                                                               const SizedBox(
//                                                                   width: 10),
//                                                               Column(
//                                                                 mainAxisSize:
//                                                                     MainAxisSize
//                                                                         .min,
//                                                                 crossAxisAlignment:
//                                                                     CrossAxisAlignment
//                                                                         .start,
//                                                                 children: [
//                                                                   Container(
//                                                                       height:
//                                                                           10,
//                                                                       width:
//                                                                           150,
//                                                                       decoration: BoxDecoration(
//                                                                           color: const Color(0xffF5F5F5).withOpacity(
//                                                                               .2),
//                                                                           borderRadius:
//                                                                               BorderRadius.circular(20))),
//                                                                   const SizedBox(
//                                                                     height: 6,
//                                                                   ),
//                                                                   Container(
//                                                                       height:
//                                                                           10,
//                                                                       width: 90,
//                                                                       decoration: BoxDecoration(
//                                                                           color: const Color(0xffF5F5F5).withOpacity(
//                                                                               .2),
//                                                                           borderRadius:
//                                                                               BorderRadius.circular(20))),
//                                                                   const SizedBox(
//                                                                       height:
//                                                                           14),
//                                                                   Flexible(
//                                                                     child: Row(
//                                                                       children: [
//                                                                         Container(
//                                                                             height:
//                                                                                 10,
//                                                                             width:
//                                                                                 60,
//                                                                             decoration:
//                                                                                 BoxDecoration(color: const Color(0xffF5F5F5).withOpacity(.2), borderRadius: BorderRadius.circular(20))),
//                                                                         Container(
//                                                                           margin:
//                                                                               const EdgeInsets.symmetric(horizontal: 7),
//                                                                           width:
//                                                                               4,
//                                                                           height:
//                                                                               4,
//                                                                           decoration:
//                                                                               BoxDecoration(
//                                                                             shape:
//                                                                                 BoxShape.circle,
//                                                                             color:
//                                                                                 const Color(0xffF5F5F5).withOpacity(.2),
//                                                                           ),
//                                                                         ),
//                                                                         Container(
//                                                                             height:
//                                                                                 10,
//                                                                             width:
//                                                                                 60,
//                                                                             decoration:
//                                                                                 BoxDecoration(color: const Color(0xffF5F5F5).withOpacity(.2), borderRadius: BorderRadius.circular(20))),
//                                                                         Container(
//                                                                           margin:
//                                                                               const EdgeInsets.symmetric(horizontal: 7),
//                                                                           width:
//                                                                               4,
//                                                                           height:
//                                                                               4,
//                                                                           decoration:
//                                                                               BoxDecoration(
//                                                                             shape:
//                                                                                 BoxShape.circle,
//                                                                             color:
//                                                                                 const Color(0xffF5F5F5).withOpacity(.2),
//                                                                           ),
//                                                                         ),
//                                                                         Container(
//                                                                             height:
//                                                                                 10,
//                                                                             width:
//                                                                                 60,
//                                                                             decoration:
//                                                                                 BoxDecoration(color: const Color(0xffF5F5F5).withOpacity(.2), borderRadius: BorderRadius.circular(20))),
//                                                                       ],
//                                                                     ),
//                                                                   )
//                                                                 ],
//                                                               ),
//                                                             ],
//                                                           )),
//                                                       Positioned(
//                                                         right: 30,
//                                                         top: 10,
//                                                         child: Container(
//                                                             height: 25,
//                                                             width: 25,
//                                                             decoration: BoxDecoration(
//                                                                 color: const Color(
//                                                                         0xffF5F5F5)
//                                                                     .withOpacity(
//                                                                         .2),
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             8))),
//                                                       )
//                                                     ],
//                                                   )));
//                                         }),
//                                   );
//                                 } else {
//                                   if (controller.posts.isEmpty) {
//                                     if (controller.loading.value) {
//                                       return ConstrainedBox(
//                                         constraints: const BoxConstraints(
//                                             minHeight: 100 * 5),
//                                         child: ListView.builder(
//                                             scrollDirection: Axis.vertical,
//                                             shrinkWrap: true,
//                                             physics:
//                                                 const NeverScrollableScrollPhysics(),
//                                             itemCount: 5,
//                                             itemBuilder: (context, index) {
//                                               return Shimmer.fromColors(
//                                                   baseColor: Colors.black
//                                                       .withOpacity(.5),
//                                                   highlightColor: Colors.grey,
//                                                   child: InkWell(
//                                                       onTap: () {},
//                                                       child: Stack(
//                                                         children: [
//                                                           Container(
//                                                               width: Get.width,
//                                                               height: 80,
//                                                               decoration: BoxDecoration(
//                                                                   color: const Color(
//                                                                           0xffF5F5F5)
//                                                                       .withOpacity(
//                                                                           .2),
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               20)),
//                                                               padding:
//                                                                   const EdgeInsets
//                                                                       .all(10),
//                                                               margin:
//                                                                   const EdgeInsets
//                                                                           .only(
//                                                                       right: 12,
//                                                                       bottom:
//                                                                           16),
//                                                               child: Row(
//                                                                 crossAxisAlignment:
//                                                                     CrossAxisAlignment
//                                                                         .start,
//                                                                 mainAxisAlignment:
//                                                                     MainAxisAlignment
//                                                                         .start,
//                                                                 children: [
//                                                                   ClipRRect(
//                                                                       borderRadius:
//                                                                           BorderRadius.circular(
//                                                                               12),
//                                                                       child:
//                                                                           Container(
//                                                                         height:
//                                                                             60,
//                                                                         width:
//                                                                             60,
//                                                                         color: const Color(0xffF5F5F5)
//                                                                             .withOpacity(.2),
//                                                                       )),
//                                                                   const SizedBox(
//                                                                       width:
//                                                                           10),
//                                                                   Column(
//                                                                     mainAxisSize:
//                                                                         MainAxisSize
//                                                                             .min,
//                                                                     crossAxisAlignment:
//                                                                         CrossAxisAlignment
//                                                                             .start,
//                                                                     children: [
//                                                                       Container(
//                                                                           height:
//                                                                               10,
//                                                                           width:
//                                                                               150,
//                                                                           decoration: BoxDecoration(
//                                                                               color: const Color(0xffF5F5F5).withOpacity(.2),
//                                                                               borderRadius: BorderRadius.circular(20))),
//                                                                       const SizedBox(
//                                                                         height:
//                                                                             6,
//                                                                       ),
//                                                                       Container(
//                                                                           height:
//                                                                               10,
//                                                                           width:
//                                                                               90,
//                                                                           decoration: BoxDecoration(
//                                                                               color: const Color(0xffF5F5F5).withOpacity(.2),
//                                                                               borderRadius: BorderRadius.circular(20))),
//                                                                       const SizedBox(
//                                                                           height:
//                                                                               14),
//                                                                       Flexible(
//                                                                         child:
//                                                                             Row(
//                                                                           children: [
//                                                                             Container(
//                                                                                 height: 10,
//                                                                                 width: 60,
//                                                                                 decoration: BoxDecoration(color: const Color(0xffF5F5F5).withOpacity(.2), borderRadius: BorderRadius.circular(20))),
//                                                                             Container(
//                                                                               margin: const EdgeInsets.symmetric(horizontal: 7),
//                                                                               width: 4,
//                                                                               height: 4,
//                                                                               decoration: BoxDecoration(
//                                                                                 shape: BoxShape.circle,
//                                                                                 color: const Color(0xffF5F5F5).withOpacity(.2),
//                                                                               ),
//                                                                             ),
//                                                                             Container(
//                                                                                 height: 10,
//                                                                                 width: 60,
//                                                                                 decoration: BoxDecoration(color: const Color(0xffF5F5F5).withOpacity(.2), borderRadius: BorderRadius.circular(20))),
//                                                                             Container(
//                                                                               margin: const EdgeInsets.symmetric(horizontal: 7),
//                                                                               width: 4,
//                                                                               height: 4,
//                                                                               decoration: BoxDecoration(
//                                                                                 shape: BoxShape.circle,
//                                                                                 color: const Color(0xffF5F5F5).withOpacity(.2),
//                                                                               ),
//                                                                             ),
//                                                                             Container(
//                                                                                 height: 10,
//                                                                                 width: 60,
//                                                                                 decoration: BoxDecoration(color: const Color(0xffF5F5F5).withOpacity(.2), borderRadius: BorderRadius.circular(20))),
//                                                                           ],
//                                                                         ),
//                                                                       )
//                                                                     ],
//                                                                   ),
//                                                                 ],
//                                                               )),
//                                                           Positioned(
//                                                             right: 30,
//                                                             top: 10,
//                                                             child: Container(
//                                                                 height: 25,
//                                                                 width: 25,
//                                                                 decoration: BoxDecoration(
//                                                                     color: const Color(
//                                                                             0xffF5F5F5)
//                                                                         .withOpacity(
//                                                                             .2),
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(
//                                                                             8))),
//                                                           )
//                                                         ],
//                                                       )));
//                                             }),
//                                       );
//                                     } else if (controller.error.value) {
//                                       return Center(
//                                           child: errorDialog(size: 20));
//                                     }
//                                   }
//                                   return ConstrainedBox(
//                                     constraints: BoxConstraints(
//                                         minHeight:
//                                             100 * controller.posts.length +
//                                                 (controller.isLastPage.value
//                                                     ? 0
//                                                     : 1)),
//                                     child: ListView.builder(
//                                         physics:
//                                             const NeverScrollableScrollPhysics(),
//                                         shrinkWrap: true,
//                                         itemCount: controller.posts.length +
//                                             (controller.isLastPage.value
//                                                 ? 0
//                                                 : 1),
//                                         itemBuilder: (context, index) {
//                                           const nextPageTrigger = 10;
//                                           if (index ==
//                                               controller.posts.length -
//                                                   nextPageTrigger) {
//                                             controller.fetchJobDetails();
//                                           }
//                                           if (index ==
//                                               controller.posts.length) {
//                                             if (controller.error.value) {
//                                               return errorDialog(size: 15);
//                                             } else {
//                                               return const Center(
//                                                   child: Padding(
//                                                 padding: EdgeInsets.all(8),
//                                                 child:
//                                                     CircularProgressIndicator(),
//                                               ));
//                                             }
//                                           }

//                                           final Post1 post =
//                                               controller.posts[index];

//                                           return HomePageCard2(
//                                             name: post.title!,
//                                             description: (post.recruiter ==
//                                                     null)
//                                                 ? "Unknown"
//                                                 : post.recruiter!.companyname
//                                                     .toString(),
//                                             jobtype: (() {
//                                               if (post.jobType == null) {
//                                                 return Text("Nil",
//                                                     style: PABTextTheme
//                                                         .headline1
//                                                         .copyWith(
//                                                             overflow:
//                                                                 TextOverflow
//                                                                     .ellipsis,
//                                                             color: Colors.black,
//                                                             fontWeight:
//                                                                 FontWeight.w100,
//                                                             fontSize: 11));
//                                               } else if (post.jobType!
//                                                       .toString() ==
//                                                   "JobType.FULL_TIME") {
//                                                 return Text("Full Time",
//                                                     style: PABTextTheme
//                                                         .headline1
//                                                         .copyWith(
//                                                             overflow:
//                                                                 TextOverflow
//                                                                     .ellipsis,
//                                                             color: Colors.black,
//                                                             fontWeight:
//                                                                 FontWeight.w100,
//                                                             fontSize: 11));
//                                               } else if (post.jobType!
//                                                       .toString() ==
//                                                   "JobType.PART_TIME") {
//                                                 return Text("Full Time",
//                                                     style: PABTextTheme
//                                                         .headline1
//                                                         .copyWith(
//                                                             overflow:
//                                                                 TextOverflow
//                                                                     .ellipsis,
//                                                             color: Colors.black,
//                                                             fontWeight:
//                                                                 FontWeight.w100,
//                                                             fontSize: 11));
//                                               } else if (post.jobType!
//                                                       .toString() ==
//                                                   "JobType.FREELANCER") {
//                                                 return Text("Freelancer",
//                                                     style: PABTextTheme
//                                                         .headline1
//                                                         .copyWith(
//                                                             overflow:
//                                                                 TextOverflow
//                                                                     .ellipsis,
//                                                             color: Colors.black,
//                                                             fontWeight:
//                                                                 FontWeight.w100,
//                                                             fontSize: 11));
//                                               } else {
//                                                 return Text("Nil",
//                                                     style: PABTextTheme
//                                                         .headline1
//                                                         .copyWith(
//                                                             overflow:
//                                                                 TextOverflow
//                                                                     .ellipsis,
//                                                             color: Colors.black,
//                                                             fontWeight:
//                                                                 FontWeight.w100,
//                                                             fontSize: 11));
//                                               }
//                                             }()),
//                                             place: (post.cities!.isEmpty)
//                                                 ? "Nil"
//                                                 : post.cities![0].toString(),
//                                             salary:
//                                                 "₹ " + post.salary.toString(),
//                                             callback: () {
//                                               Get.to(() => const JobDetails(),
//                                                   arguments: post.id);
//                                             },
//                                             image: (post.recruiter == null)
//                                                 ? Image.asset(
//                                                     "assets/logos/company_logo.png")
//                                                 : (post.recruiter!
//                                                             .profileImage ==
//                                                         null)
//                                                     ? Image.asset(
//                                                         "assets/logos/company_logo.png")
//                                                     : Image.network(post
//                                                         .recruiter!.profileImage
//                                                         .toString()),
//                                             favourite: (post.wishlist != false)
//                                                 ? IconButton(
//                                                     onPressed: () {
//                                                       controller
//                                                           .addtofavourites(
//                                                               post.id
//                                                                   .toString(),
//                                                               "remove",
//                                                               index);
//                                                     },
//                                                     icon: ImageIcon(
//                                                       Image.asset(
//                                                               "assets/logos/Icon-feather-red-heart.png",
//                                                               height: 20,
//                                                               width: 20)
//                                                           .image,
//                                                       color: Colors.red,
//                                                     ),
//                                                     color: Colors.black,
//                                                   )
//                                                 : IconButton(
//                                                     onPressed: () {
//                                                       controller
//                                                           .addtofavourites(
//                                                               post.id
//                                                                   .toString(),
//                                                               "add",
//                                                               index);
//                                                     },
//                                                     icon: ImageIcon(
//                                                       Image.asset(
//                                                               "assets/logos/Icon feather-heart.png",
//                                                               height: 20,
//                                                               width: 20)
//                                                           .image,
//                                                       color: const Color(
//                                                           0xffC8C8C8),
//                                                     ),
//                                                     color: Colors.black,
//                                                   ),
//                                           );
//                                         }),
//                                   );
//                                 }
//                                 // ListView.builder(
//                                 //     scrollDirection: Axis.vertical,
//                                 //     shrinkWrap: true,
//                                 //     physics:
//                                 //         const NeverScrollableScrollPhysics(),
//                                 //     itemCount: controller
//                                 //         .data1.value.posts!.length,
//                                 //     itemBuilder: (context, index) {
//                                 //       return HomePageCard2(
//                                 //         name: controller.data1.value
//                                 //             .posts![index].title!,
//                                 //         description: (controller
//                                 //                     .data1
//                                 //                     .value
//                                 //                     .posts![0]
//                                 //                     .recruiter!
//                                 //                     .companyname ==
//                                 //                 null)
//                                 //             ? "Unknown"
//                                 //             : controller
//                                 //                 .data1
//                                 //                 .value
//                                 //                 .posts![0]
//                                 //                 .recruiter!
//                                 //                 .companyname
//                                 //                 .toString(),
//                                 //         jobtype: (() {
//                                 //           if (controller
//                                 //                   .data1
//                                 //                   .value
//                                 //                   .posts![index]
//                                 //                   .jobType ==
//                                 //               null) {
//                                 //             return Text("Nil",
//                                 //                 style: PABTextTheme
//                                 //                     .headline1
//                                 //                     .copyWith(
//                                 //                         overflow:
//                                 //                             TextOverflow
//                                 //                                 .ellipsis,
//                                 //                         color:
//                                 //                             Colors.black,
//                                 //                         fontWeight:
//                                 //                             FontWeight
//                                 //                                 .w100,
//                                 //                         fontSize: 11));
//                                 //           } else if (controller
//                                 //                   .data1
//                                 //                   .value
//                                 //                   .posts![index]
//                                 //                   .jobType!
//                                 //                   .toString() ==
//                                 //               "JobType.FULL_TIME") {
//                                 //             return Text("Full Time",
//                                 //                 style: PABTextTheme
//                                 //                     .headline1
//                                 //                     .copyWith(
//                                 //                         overflow:
//                                 //                             TextOverflow
//                                 //                                 .ellipsis,
//                                 //                         color:
//                                 //                             Colors.black,
//                                 //                         fontWeight:
//                                 //                             FontWeight
//                                 //                                 .w100,
//                                 //                         fontSize: 11));
//                                 //           } else if (controller
//                                 //                   .data1
//                                 //                   .value
//                                 //                   .posts![index]
//                                 //                   .jobType!
//                                 //                   .toString() ==
//                                 //               "JobType.PART_TIME") {
//                                 //             return Text("Full Time",
//                                 //                 style: PABTextTheme
//                                 //                     .headline1
//                                 //                     .copyWith(
//                                 //                         overflow:
//                                 //                             TextOverflow
//                                 //                                 .ellipsis,
//                                 //                         color:
//                                 //                             Colors.black,
//                                 //                         fontWeight:
//                                 //                             FontWeight
//                                 //                                 .w100,
//                                 //                         fontSize: 11));
//                                 //           } else if (controller
//                                 //                   .data1
//                                 //                   .value
//                                 //                   .posts![index]
//                                 //                   .jobType!
//                                 //                   .toString() ==
//                                 //               "JobType.FREELANCER") {
//                                 //             return Text("Freelancer",
//                                 //                 style: PABTextTheme
//                                 //                     .headline1
//                                 //                     .copyWith(
//                                 //                         overflow:
//                                 //                             TextOverflow
//                                 //                                 .ellipsis,
//                                 //                         color:
//                                 //                             Colors.black,
//                                 //                         fontWeight:
//                                 //                             FontWeight
//                                 //                                 .w100,
//                                 //                         fontSize: 11));
//                                 //           } else {
//                                 //             return Text("Nil",
//                                 //                 style: PABTextTheme
//                                 //                     .headline1
//                                 //                     .copyWith(
//                                 //                         overflow:
//                                 //                             TextOverflow
//                                 //                                 .ellipsis,
//                                 //                         color:
//                                 //                             Colors.black,
//                                 //                         fontWeight:
//                                 //                             FontWeight
//                                 //                                 .w100,
//                                 //                         fontSize: 11));
//                                 //           }
//                                 //         }()),
//                                 //         place: (controller
//                                 //                 .data1
//                                 //                 .value
//                                 //                 .posts![index]
//                                 //                 .cities!
//                                 //                 .isEmpty)
//                                 //             ? "Nil"
//                                 //             : controller.data1.value
//                                 //                 .posts![index].cities![0]
//                                 //                 .toString(),
//                                 //         salary: "₹ " +
//                                 //             controller.data1.value
//                                 //                 .posts![index].salary
//                                 //                 .toString(),
//                                 //         callback: () {
//                                 //           Get.to(() => const JobDetails(),
//                                 //               arguments: controller
//                                 //                   .data1
//                                 //                   .value
//                                 //                   .posts![index]
//                                 //                   .id);
//                                 //         },
//                                 //         image: (controller
//                                 //                     .data1
//                                 //                     .value
//                                 //                     .posts![index]
//                                 //                     .recruiter ==
//                                 //                 null)
//                                 //             ? Image.asset(
//                                 //                 "assets/logos/company_logo.png")
//                                 //             : (controller
//                                 //                         .data1
//                                 //                         .value
//                                 //                         .posts![index]
//                                 //                         .recruiter!
//                                 //                         .profileImage ==
//                                 //                     null)
//                                 //                 ? Image.asset(
//                                 //                     "assets/logos/company_logo.png")
//                                 //                 : Image.network(controller
//                                 //                     .data1
//                                 //                     .value
//                                 //                     .posts![index]
//                                 //                     .recruiter!
//                                 //                     .profileImage
//                                 //                     .toString()),
//                                 //         favourite:
//                                 //             (controller
//                                 //                         .data1
//                                 //                         .value
//                                 //                         .posts![index]
//                                 //                         .wishlist !=
//                                 //                     false)
//                                 //                 ? IconButton(
//                                 //                     onPressed: () {
//                                 //                       controller.addtofavourites(
//                                 //                           controller
//                                 //                               .data1
//                                 //                               .value
//                                 //                               .posts![
//                                 //                                   index]
//                                 //                               .id
//                                 //                               .toString(),
//                                 //                           "remove",
//                                 //                           index);
//                                 //                     },
//                                 //                     icon: ImageIcon(
//                                 //                       Image.asset(
//                                 //                               "assets/logos/Icon-feather-red-heart.png",
//                                 //                               height: 20,
//                                 //                               width: 20)
//                                 //                           .image,
//                                 //                       color: Colors.red,
//                                 //                     ),
//                                 //                     color: Colors.black,
//                                 //                   )
//                                 //                 : IconButton(
//                                 //                     onPressed: () {
//                                 //                       controller.addtofavourites(
//                                 //                           controller
//                                 //                               .data1
//                                 //                               .value
//                                 //                               .posts![
//                                 //                                   index]
//                                 //                               .id
//                                 //                               .toString(),
//                                 //                           "add",
//                                 //                           index);
//                                 //                     },
//                                 //                     icon: ImageIcon(
//                                 //                       Image.asset(
//                                 //                               "assets/logos/Icon feather-heart.png",
//                                 //                               height: 20,
//                                 //                               width: 20)
//                                 //                           .image,
//                                 //                       color: const Color(
//                                 //                           0xffC8C8C8),
//                                 //                     ),
//                                 //                     color: Colors.black,
//                                 //                   ),
//                                 //       );
//                                 //     })
//                               }),

//                               // const SizedBox(height: 20),
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   "You have reached bottom",
//                                   style: PABTextTheme.headline1.copyWith(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 10,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 6)
//                             ],
//                           )),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
//       floatingActionButton: Container(
//         width: Get.width,
//         height: 80,
//         color: PABColorTheme.backgrndColor,
//         padding: const EdgeInsets.only(
//           left: 16,
//           right: 16,
//           top: 30,
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Obx(() {
//               if (controller.isLoading.value) {
//                 return Shimmer.fromColors(
//                     baseColor: Colors.white.withOpacity(.9),
//                     highlightColor: Colors.grey,
//                     child: Container(
//                       width: 36,
//                       height: 36,
//                       decoration: BoxDecoration(
//                         color: const Color(0xffF5F5F5).withOpacity(.3),
//                         shape: BoxShape.circle,
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                     ));
//               } else {
//                 return InkWell(
//                   onTap: () {
//                     Get.to(() => const EditProfileDetails());
//                   },
//                   child: Container(
//                       width: 36,
//                       height: 36,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.white, width: 2),
//                         shape: BoxShape.circle,
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(40),
//                         child: (controller.data2.value.profileImage == null)
//                             ? Image.asset("assets/images/profile_dp.png",
//                                 fit: BoxFit.cover, height: 32, width: 32)
//                             : (controller.data2.value.profileImage == "")
//                                 ? Image.asset("assets/images/profile_dp.png",
//                                     fit: BoxFit.cover, height: 32, width: 32)
//                                 : Image.network(
//                                     controller.data2.value.profileImage!,
//                                     fit: BoxFit.cover,
//                                     height: 32,
//                                     width: 32),
//                       )),
//                 );
//               }
//             }),
//             const SizedBox(width: 12),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Obx(() {
//                   if (controller.isLoading.value) {
//                     return Shimmer.fromColors(
//                         baseColor: Colors.white.withOpacity(.9),
//                         highlightColor: Colors.grey,
//                         child: Container(
//                           width: 150,
//                           height: 15,
//                           decoration: BoxDecoration(
//                               color: const Color(0xffF5F5F5).withOpacity(.3),
//                               borderRadius: BorderRadius.circular(24)),
//                         ));
//                   } else {
//                     return InkWell(
//                       onTap: () {
//                         Get.to(() => const EditProfileDetails());
//                       },
//                       child: Text(
//                         controller.data2.value.name!,
//                         style: PABTextTheme.headline1.copyWith(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18),
//                       ),
//                     );
//                   }
//                 }),
//                 InkWell(
//                   onTap: () {
//                     Get.to(() => const MyResume());
//                   },
//                   child: Container(
//                     child: Text(
//                       "Update your resume",
//                       style:
//                           PABTextTheme.headline2.copyWith(color: Colors.white),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             const Spacer(),
//             InkWell(
//               onTap: () {
//                 Get.to(() => const FavouritedJobs());
//               },
//               child: Container(
//                 height: 40,
//                 width: 40,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0xff31283D),
//                 ),
//                 child: Image.asset("assets/logos/Icon feather-heart.png"),
//               ),
//             ),
//             const SizedBox(width: 10),
//             InkWell(
//               onTap: () {
//                 showGeneralDialog(
//                   context: context,
//                   pageBuilder: (context, animation, secondaryAnimation) =>
//                       Scaffold(
//                     backgroundColor: Colors.black87,
//                     // appBar: AppBar(
//                     //   backgroundColor: Colors.black87,
//                     //   leading: InkWell(
//                     //       onTap: () {
//                     //         Get.back();
//                     //       },
//                     //       child: Icon(Icons.close,
//                     //           color: Colors.white)),
//                     // ),
//                     body: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 24),
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             const SizedBox(height: 70),
//                             Text("Notifications",
//                                 style: PABTextTheme.headline1.copyWith(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold)),
//                             const SizedBox(height: 22),
//                             InkWell(
//                               onTap: () {
//                                 Get.to(() => const JobAlerts());
//                               },
//                               child: Container(
//                                   height: 80,
//                                   width: Get.width,
//                                   padding: const EdgeInsets.only(
//                                       right: 23, left: 18),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(16),
//                                       color: Colors.white),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SvgPicture.asset(
//                                         "assets/logos/lighting_icon.svg",
//                                       ),
//                                       const SizedBox(width: 10),
//                                       Text(
//                                           "You have new recommended jobs (" +
//                                               controller.notificationdata.value
//                                                   .jobAlerts
//                                                   .toString() +
//                                               ")",
//                                           style: PABTextTheme.headline1
//                                               .copyWith(
//                                                   color: Colors.black,
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.bold)),
//                                       const Spacer(),
//                                       Transform.rotate(
//                                           angle: 180 * pi / 180,
//                                           child: Icon(Icons.arrow_back_ios_new,
//                                               color:
//                                                   Colors.black.withOpacity(.1)))
//                                     ],
//                                   )),
//                             ),
//                             const SizedBox(height: 12),
//                             InkWell(
//                               onTap: () {
//                                 Get.to(
//                                     () => const AppliedJobs(backButton: "yes"));
//                               },
//                               child: Container(
//                                   height: 80,
//                                   width: Get.width,
//                                   padding: const EdgeInsets.only(
//                                       right: 23, left: 18),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(16),
//                                       color: Colors.white),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SvgPicture.asset(
//                                         "assets/logos/suitcase_icon.svg",
//                                       ),
//                                       const SizedBox(width: 10),
//                                       Text(
//                                           "Applied Jobs (" +
//                                               controller.notificationdata.value
//                                                   .appliedJobs
//                                                   .toString() +
//                                               ")",
//                                           style: PABTextTheme.headline1
//                                               .copyWith(
//                                                   color: Colors.black,
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.bold)),
//                                       const Spacer(),
//                                       Transform.rotate(
//                                           angle: 180 * pi / 180,
//                                           child: Icon(Icons.arrow_back_ios_new,
//                                               color:
//                                                   Colors.black.withOpacity(.1)))
//                                     ],
//                                   )),
//                             ),
//                             const SizedBox(height: 12),
//                             InkWell(
//                               onTap: () {},
//                               child: Container(
//                                   height: 80,
//                                   width: Get.width,
//                                   padding: const EdgeInsets.only(
//                                       right: 23, left: 18),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(16),
//                                       color: Colors.white),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SvgPicture.asset(
//                                         "assets/logos/sucess_icon.svg",
//                                       ),
//                                       const SizedBox(width: 10),
//                                       Text("Pending Actions (0)",
//                                           style: PABTextTheme.headline1
//                                               .copyWith(
//                                                   color: Colors.black,
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.bold)),
//                                       const Spacer(),
//                                       Transform.rotate(
//                                           angle: 180 * pi / 180,
//                                           child: Icon(Icons.arrow_back_ios_new,
//                                               color:
//                                                   Colors.black.withOpacity(.1)))
//                                     ],
//                                   )),
//                             ),
//                             const Spacer(),
//                             Container(
//                               height: 50,
//                               width: 50,
//                               margin: const EdgeInsets.only(bottom: 35),
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.white,
//                               ),
//                               child: InkWell(
//                                   onTap: () {
//                                     Get.back();
//                                   },
//                                   child: const Icon(Icons.close,
//                                       color: Colors.black)),
//                             ),
//                           ]),
//                     ),
//                   ),
//                 );
//               },
//               child: Stack(
//                 children: [
//                   Container(
//                     height: 40,
//                     width: 40,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Color(0xff31283D),
//                     ),
//                     child: Image.asset("assets/logos/notification_icon.png"),
//                   ),
//                   Positioned(
//                       right: 1,
//                       top: 2,
//                       child: Container(
//                         width: 10,
//                         height: 10,
//                         padding: const EdgeInsets.all(7),
//                         decoration: const BoxDecoration(
//                           color: Colors.red,
//                           shape: BoxShape.circle,
//                         ),
//                       ))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// //     );
// //   }
// // }

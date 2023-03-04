import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pabjobs/common/favourite_card.dart';
import 'package:pabjobs/pages/job_seeker/common/reusable_scaffold.dart';
import 'package:pabjobs/pages/job_seeker/homepage/favourites/favourites_controller.dart';
import 'package:pabjobs/pages/job_seeker/homepage/job_details.dart/job_details.dart';
import 'package:pabjobs/theme/color_theme.dart';
import 'package:pabjobs/theme/text_theme.dart';

class FavouritedJobs extends StatefulWidget {
  const FavouritedJobs({Key? key}) : super(key: key);

  @override
  State<FavouritedJobs> createState() => _FavouritedJobsState();
}

class _FavouritedJobsState extends State<FavouritedJobs> {
  FavouritesController controller = Get.put(FavouritesController());

  @override
  void initState() {
    super.initState();
    controller.fetchFavouritesDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        // print('controller.cartInfo');
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
        return (controller.data.value.data!.isNotEmpty)
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xffF5F5F5),
                  elevation: 0,
                  iconTheme: const IconThemeData(color: Colors.black),
                  title: Text("Favourited Jobs",
                      style: PABTextTheme.headline1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
                body: SingleChildScrollView(
                  child: Container(
                      color: const Color(0xffF5F5F5),
                      width: Get.width,
                      height: Get.height,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.data.value.data!.length,
                          itemBuilder: (context, index) {
                            return FavouriteCard(
                              name: controller
                                  .data.value.data![index].jobId!.title!,
                              description: (controller
                                          .data.value.data![index].recruiter ==
                                      null)
                                  ? "Unknown"
                                  : controller.data.value.data![index]
                                      .recruiter!.companyname!,
                              jobtype: controller
                                  .data.value.data![index].jobId!.jobType!,
                              place: "   " +
                                  controller.data.value.data![index].jobId!
                                      .cities![0],
                              salary: "₹ " +
                                  controller
                                      .data.value.data![index].jobId!.salary
                                      .toString(),
                              callback: () {
                                Get.to(() => const JobDetails(),
                                    arguments: controller
                                        .data.value.data![index].jobId!.id);
                              },
                              image: (controller
                                          .data.value.data![index].recruiter !=
                                      null)
                                  ? (controller.data.value.data![index]
                                              .recruiter!.profileImage ==
                                          null)
                                      ? Image.asset(
                                          "assets/logos/company_logo.png")
                                      : Image.network(controller
                                          .data
                                          .value
                                          .data![index]
                                          .recruiter!
                                          .profileImage!)
                                  : (controller.data.value.data![index]
                                              .recruiter!.profileImage ==
                                          "")
                                      ? Image.asset(
                                          "assets/logos/company_logo.png")
                                      : Image.asset(
                                          "assets/logos/company_logo.png"),
                              favourite: Image.asset(
                                "assets/logos/Icon-feather-red-heart.png",
                                height: 20,
                                width: 20,
                                color: Colors.red,
                              ),
                            );
                          })),
                ))
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  iconTheme: const IconThemeData(color: Colors.black),
                  title: Text("Favourited Jobs",
                      style: PABTextTheme.headline1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
                body: Container(
                  color: Colors.white,
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/No_list_found.png",
                            width: 280, height: 280),
                        Text("We cannot find any",
                            style: PABTextTheme.content
                                .copyWith(color: Colors.black)),
                        Text("Favourites Jobs",
                            style: PABTextTheme.headline1
                                .copyWith(color: Colors.black)),
                        const SizedBox(height: 50),
                        SizedBox(
                            width: Get.width * .6,
                            child: TextButton(
                                child: Text(
                                  'Go to homepage',
                                  style: PABTextTheme.content
                                      .copyWith(color: Colors.white),
                                ),
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 31),
                                  primary: Colors.white,
                                  backgroundColor:
                                      PABColorTheme.purpleCardColor,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(31)),
                                  ),
                                ),
                                onPressed: () async {
                                  Get.offAll(() => const ReusableScaffold());
                                }))
                      ]),
                ));
      }
    });
  }
}

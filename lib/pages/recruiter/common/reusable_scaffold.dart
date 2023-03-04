import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:pabjobs/theme/text_theme.dart';
import 'package:pabjobs/pages/recruiter/common/reusable_scaffold_controller.dart';

class RecruiterReusableScaffold extends StatefulWidget {
  const RecruiterReusableScaffold({Key? key}) : super(key: key);

  @override
  _RecruiterReusableScaffoldState createState() =>
      _RecruiterReusableScaffoldState();
}

class _RecruiterReusableScaffoldState extends State<RecruiterReusableScaffold> {
  bool _visible = false;
  final ReusableScaffoldRecruiterController controller =
      Get.put(ReusableScaffoldRecruiterController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            // appBar: PreferredSize(
            //   preferredSize: const Size.fromHeight(70),
            //   child: Obx(() => controller.appBarSwitcher()),
            // ),
            body: Obx(() => controller.navBarSwitcher()),
            // persistentFooterButtons: footer,
            bottomNavigationBar: Container(
              margin: const EdgeInsets.only(
                left: 21.0,
                right: 21.0,
                bottom: 20.0,
              ),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 50,
                  ),
                ],
              ),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(33.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 34, right: 34, top: 0),
                    height: Get.width * 0.18,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black26),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() => _visible = false);
                            print(_visible);
                            controller.currentIndex.value = 0;
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: Get.width * 0.018,
                                width: Get.width * 0.1,
                                decoration: BoxDecoration(
                                  color: controller.currentIndex.value == 0
                                      ? const Color(0xff54347D)
                                      : Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              controller.currentIndex.value == 0
                                  ? SvgPicture.asset(
                                      'assets/logos/home_logo.svg',
                                      height: 28)
                                  : SvgPicture.asset(
                                      'assets/logos/home_logo_unselected.svg',
                                      height: 28),
                              const SizedBox(height: 4),
                              Text(
                                'Home',
                                style: PABTextTheme.content.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: controller.currentIndex.value == 0
                                      ? const Color(0xff54347D)
                                      : const Color(0xff54347D).withOpacity(.4),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() => _visible = false);
                            print(_visible);
                            controller.currentIndex.value = 1;
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: Get.width * 0.018,
                                width: Get.width * 0.1,
                                decoration: BoxDecoration(
                                  color: controller.currentIndex.value == 1
                                      ? const Color(0xff54347D)
                                      : Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              controller.currentIndex.value == 1
                                  ? SvgPicture.asset(
                                      'assets/logos/applied jobs.svg',
                                      height: 28,
                                    )
                                  : SvgPicture.asset(
                                      'assets/logos/applied_jobs_unselected.svg',
                                      height: 28,
                                    ),
                              const SizedBox(height: 4),
                              Text(
                                'My Jobs',
                                style: PABTextTheme.content.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: controller.currentIndex.value == 1
                                      ? const Color(0xff54347D)
                                      : const Color(0xff54347D).withOpacity(.4),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() => _visible = false);
                            print(_visible);
                            controller.currentIndex.value = 2;
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: Get.width * 0.018,
                                width: Get.width * 0.1,
                                decoration: BoxDecoration(
                                  color: controller.currentIndex.value == 2
                                      ? const Color(0xff54347D)
                                      : Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              controller.currentIndex.value == 2
                                  ? SvgPicture.asset(
                                      'assets/logos/profile_icon.svg',
                                      height: 28,
                                    )
                                  : SvgPicture.asset(
                                      'assets/logos/profile_icon_unselected.svg',
                                      height: 28,
                                    ),
                              const SizedBox(height: 4),
                              Text(
                                'Profile',
                                style: PABTextTheme.content.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: controller.currentIndex.value == 2
                                      ? const Color(0xff54347D)
                                      : const Color(0xff54347D).withOpacity(.4),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ],

                      // BottomNavigationBar(
                      //     elevation: 5,
                      //     currentIndex: controller.currentIndex.value,
                      //     selectedItemColor: const Color(0xff54347D),
                      //     selectedLabelStyle: PABTextTheme.content
                      //         .copyWith(fontWeight: FontWeight.bold, fontSize: 11),
                      //     mouseCursor: SystemMouseCursors.grab,
                      //     unselectedItemColor:
                      //         const Color(0xff54347D).withOpacity(.40),

                      //     // gradient: LinearGradient(
                      //     //   colors: kGradients,
                      //     // ),
                      //     backgroundColor: Colors.white,
                      //     type: BottomNavigationBarType.fixed,
                      //     iconSize: 40,
                      //     items: <BottomNavigationBarItem>[
                      //       BottomNavigationBarItem(
                      //         icon: controller.currentIndex.value == 0
                      //             ?
                      //                   SvgPicture.asset(
                      //                       'assets/logos/home_logo.svg'),
                      //
                      //             : SvgPicture.asset(
                      //                 'assets/logos/home_logo_unselected.svg'),
                      //         label: 'Home',
                      //       ),
                      //       BottomNavigationBarItem(
                      //         icon: controller.currentIndex.value == 1
                      //             ? SvgPicture.asset('assets/logos/search icon.svg')
                      //             : SvgPicture.asset(
                      //                 'assets/logos/search icon_unselected.svg'),
                      //         label: 'Search',
                      //       ),
                      //       BottomNavigationBarItem(
                      //         icon: controller.currentIndex.value == 2
                      //             ? SvgPicture.asset(
                      //                 'assets/logos/applied jobs.svg')
                      //             : SvgPicture.asset(
                      //                 'assets/logos/applied_jobs_unselected.svg'),
                      //         label: 'Applied Jobs',
                      //       ),
                      //       BottomNavigationBarItem(
                      //         icon: controller.currentIndex.value == 3
                      //             ? SvgPicture.asset(
                      //                 'assets/logos/profile_icon.svg')
                      //             : SvgPicture.asset(
                      //                 'assets/logos/profile_icon_unselected.svg'),
                      //         label: 'Profile',
                      //       ),
                      //     ],
                      //     onTap: (to) {
                      //       // print(to);
                      //       if (to == 2) {
                      //         setState(() => _visible = true);
                      //       } else {
                      //         setState(() => _visible = false);
                      //       }
                      //       // print(_visible);
                      //       controller.currentIndex.value = to;
                      //     }),
                    ),
                  )),
            )));
  }
}

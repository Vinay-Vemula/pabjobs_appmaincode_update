import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/entities/job_details_model.dart';
import 'package:pabjobs/entities/job_details_model_pagination.dart';
import 'package:pabjobs/entities/job_fair_model.dart';
import 'package:pabjobs/entities/notification_model.dart';
import 'package:pabjobs/entities/recomended_job_details_model.dart';
import 'package:pabjobs/entities/user_details_model.dart';

class HomepageController extends GetxController {
  var isLastPage = true.obs;
  var pageNumber = 0.obs;
  var error = false.obs;
  var loading = true.obs;
  late List<Post1> posts = [];

  var isLoading = true.obs;
  var isJobLoading = true.obs;

  Rx<RecomendedJobDetails> data = RecomendedJobDetails(data: []).obs;
  Rx<NotificationModel> notificationdata = NotificationModel().obs;
  Rx<JobDetails> data1 = JobDetails().obs;
  Rx<JobFairModel> jobFairdata = JobFairModel().obs;
  Rx<UserDetails> data2 = UserDetails(
    certification: [],
    contactNumber: 0,
    currentlocation: [],
    education: [],
    email: '',
    employment: [],
    experience: '',
    id: '',
    isEmailVerified: false,
    isPhoneVerified: false,
    jobApplicantDate: DateTime.now(),
    name: '',
    patent: [],
    presentation: [],
    profile: '',
    profileSummary: '',
    project: [],
    publication: [],
    rating: 0,
    resumeHeadline: '',
    skills: [],
    totalExperience: '',
    state: '',
    userId: '',
    v: 0,
    worksample: [],
    profileImage: '',
    careerprofile: [],
  ).obs;

  Future<void> fetchJobDetails() async {
    try {
      // isJobLoading(true);
      var response = await APIService.fetchJobDetails(pageNumber.value);
      var postList = postsFromJson(response);
      // List<Post1> postList = responseList
      //     .map<Post1>((data) => Post1(title: data['title']))
      //     .toList();
      isLastPage(postList.posts!.length < 20);
      loading(false);
      pageNumber = pageNumber + 1;
      posts.addAll(postList.posts!.toList());
      isJobLoading(false);
    } catch (e) {
      // isJobLoading(true);
      print("error --> $e");

      loading(false);
      error(true);
    }
  }

  // Future<void> isAppliedMegaJobFair() async {
  //   var z = await APIService.isAppliedMegaJobFair();
  //   jobFairdata(z);
  // }

  Future<void> fetchrecomendedjobDetails() async {
    var z = await APIService.fetchrecomendedjobDetails();
    data(z);
  }

  // Future<void> fetchPage(int pageKey) async {
  //   try {
  //     var z = await APIService.fetchJobDetails(pageKey);
  //     // data1(z);

  //     List<Post> data1 = z.map((data) => JobDetails()).toList();
  //     final isLastPage = data1.length < 20;
  //     if (isLastPage) {
  //       pagingController.value.appendLastPage(data1);
  //     } else {
  //       final nextPageKey = pageKey + 1;
  //       pagingController.value.appendPage(data1, nextPageKey);
  //     }
  //   } catch (e) {
  //     print("error --> $e");
  //     pagingController.value.error = e;
  //   }
  // }

  // Future<void> fetchJobDetails() async {
  //   var z = await APIService.fetchJobDetails(1);
  //   data1(z);
  //   // print("A");
  //   // print(test.value.posts!);

  //   // isLastPage.value = data1.value.posts!.length < 20;
  //   // loading.value = false;
  //   // pageNumber.value = pageNumber.value + 1;
  //   // print("B");
  //   // data1(test.value);
  //   // print(data1.value.posts!);
  //   // print("C");
  // }

  Future<void> fetchUserDetails() async {
    var z = await APIService.fetchUserDetails();
    data2(z);
  }

  Future<void> fetchNotifications() async {
    var z = await APIService.fetchNotifications();
    notificationdata(z);
  }

  void fetchData() async {
    isLoading(true);
    await fetchUserDetails();
    await fetchNotifications();
    await fetchrecomendedjobDetails();
    // await fetchJobDetails();
    isLoading(false);
  }

  Future<bool> addtofavourites(String id, String action, int index) async {
    isLoading(true);
    var previousData = posts;
    if (previousData[index].wishlist!) {
      previousData[index].wishlist = false;
    } else {
      previousData[index].wishlist = true;
    }

    posts = previousData;
    isLoading(false);
    bool result = await APIService.addtoFavourites(id, action);
    return result;
  }
}

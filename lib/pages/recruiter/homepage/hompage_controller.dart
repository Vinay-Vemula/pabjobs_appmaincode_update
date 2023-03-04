import 'package:get/get.dart';
import 'package:pabjobs/entities/candidate_details_model_pagination.dart';
import 'package:pabjobs/entities/candidate_details_model.dart';

import '../../../entities/api_service_recruiter.dart';
import '../../../entities/company_profile_model.dart';

class RHomePageController extends GetxController {
  var isLoading = true.obs;
  var isLastPage = true.obs;
  var pageNumber = 0.obs;
  var error = false.obs;
  var loading = true.obs;
  late List<Post1> posts = <Post1>[].obs;

  Rx<CompanyProfileModel> profileData = CompanyProfileModel().obs;
  // Rx<CandidateDetailsModel> candidateData = CandidateDetailsModel().obs;

  Future<void> fetchHomeProfileData() async {
    var fetchedData = await ApiServiceRecruiter.fetchCompanyProfileData();
    if (fetchedData != null) {
      profileData.value = fetchedData;
    }
  }

  Future<void> fetchJobDetails() async {
    try {
      var response = await ApiServiceRecruiter.fetchCandidateList(
        pageNumber.value,
      );
      var postList = postsFromJson(response);
      // List<Post1> postList = responseList
      //     .map<Post1>((data) => Post1(title: data['title']))
      //     .toList();
      isLastPage(postList.posts!.length < 20);
      loading(false);
      pageNumber = pageNumber + 1;
      posts.addAll(postList.posts!.toList());
    } catch (e) {
      print("error --> $e");

      loading(false);
      error(true);
    }
  }

  // Future<void> fetchHomeCandidateData() async {
  //   var fetchedData = await ApiServiceRecruiter.fetchCandidateList();
  //   if (fetchedData != null) {
  //     candidateData.value = fetchedData;
  //     print(fetchedData);
  //   }
  // }

  void fetchData() async {
    isLoading(true);
    await fetchJobDetails();
    await fetchHomeProfileData();
    isLoading(false);
  }
}

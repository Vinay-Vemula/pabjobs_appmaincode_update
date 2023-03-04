import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service_recruiter.dart';
import 'package:pabjobs/entities/candidate_details_model.dart';

class FilterListingRController extends GetxController {
  var isLoading = true.obs;

  Rx<CandidateDetailsModel> data2 = CandidateDetailsModel().obs;

  void fetchFilterListDetails(
    List designation,
    List skills,
    String experience,
    List location,
  ) async {
    // try {
    isLoading(true);
    var z = await ApiServiceRecruiter.fetchfilteredJobDetails(
      designation,
      skills,
      experience,
      location,
    );
    data2(z);
    isLoading(false);
    // } catch (e) {
    //   print("error --> $e");
    // }
  }
}

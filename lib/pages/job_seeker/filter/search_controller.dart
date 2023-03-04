import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/entities/job_details_model.dart';

class SearchController extends GetxController {
  var isLoading = true.obs;

  var jobDetails = <JobDetails>[].obs;
  Rx<JobDetails> data2 = JobDetails(posts: [], counts: 0).obs;

  void FetchSearchJobDetails(
    String q,
  ) async {
    isLoading(true);
    var z = await APIService.fetchSearchJobDetails(q);
    data2(z);
    isLoading(false);
  }
}

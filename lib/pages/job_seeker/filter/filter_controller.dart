import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/entities/job_details_model.dart';

class FilterController extends GetxController {
  var isLoading = true.obs;

  var jobDetails = <JobDetails>[].obs;
  Rx<JobDetails> data1 = JobDetails(posts: [], counts: 0).obs;
  Rx<JobDetails> data2 = JobDetails(posts: [], counts: 0).obs;

  void FetchFilteredJobDetails(
    List category,
    List companies,
    List educations,
    List experience,
    List industryType,
    List location,
    List skills,
    List salary,
  ) async {
    isLoading(true);
    var z = await APIService.fetchfilteredJobDetails(category, companies,
        educations, experience, industryType, location, skills, salary);
    data1(z);
    isLoading(false);
    print(data1.value.counts);
  }
}

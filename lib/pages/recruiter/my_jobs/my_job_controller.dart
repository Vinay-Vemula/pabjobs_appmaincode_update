import 'package:get/get.dart';
import 'package:pabjobs/entities/recruiter_post_job_model.dart';

import '../../../entities/api_service.dart';
import '../../../entities/api_service_recruiter.dart';
import '../../../entities/my_jobs_model.dart';

class MyJobController extends GetxController {
  var isLoading = true.obs;

  // var myJobsModel = <MyJobsModel>[].obs;
  // Rx<MyJobsModel> data = MyJobsModel().obs;
  var jobData = <MyJobsModel>[].obs;

  void fetchPostedJobsData() async {
    isLoading(true);
    var z = await ApiServiceRecruiter.fetchMyJobs();
    if (z != null) {
      jobData.value = z;
    }
    isLoading(false);
  }
}

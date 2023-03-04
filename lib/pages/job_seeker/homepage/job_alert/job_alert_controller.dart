import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/entities/job_details_model.dart';
import 'package:pabjobs/entities/recomended_job_details_model.dart';
import 'package:pabjobs/entities/user_details_model.dart';

class JobAlertController extends GetxController {
  var isLoading = true.obs;

  // var recomendedjobdetails = <RecomendedJobDetails>[].obs;
  Rx<RecomendedJobDetails> data = RecomendedJobDetails(data: []).obs;

  void fetchrecomendedjobDetails() async {
    isLoading(true);
    var z = await APIService.fetchrecomendedjobDetails();
    data(z);
    isLoading(false);
  }
}

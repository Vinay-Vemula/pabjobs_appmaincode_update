import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/entities/job_details_by_id_model.dart';

class JobDetailsController extends GetxController {
  var isLoading = true.obs;

  Rx<JobDetailsbyId> data = JobDetailsbyId().obs;

  void FetchJobDetailsbyId(String id) async {
    isLoading(true);
    var resp = await APIService.fetchJobDetailsbyId(id);
    data(resp);
    isLoading(false);
  }
}

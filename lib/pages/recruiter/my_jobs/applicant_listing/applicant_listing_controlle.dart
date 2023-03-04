import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service_recruiter.dart';
import 'package:pabjobs/entities/applicant_listing_model.dart';

class ApplicantListingController extends GetxController {
  var isLoading = true.obs;
  // var applicants = List<Applicant>.empty(growable: true).obs;
  var applicant = List<ApplicantModel>.empty(growable: true).obs;

  void fetchApplicantData(String id) async {
    isLoading(true);
    var response = await ApiServiceRecruiter.fetchApplicantById(id);
    applicant(response);
    isLoading(false);
  }
}

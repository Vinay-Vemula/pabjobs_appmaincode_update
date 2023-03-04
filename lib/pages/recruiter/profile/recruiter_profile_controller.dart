import 'package:get/get.dart';

import '../../../entities/api_service_recruiter.dart';
import '../../../entities/company_profile_model.dart';

class RecruiterProfileController extends GetxController {
  var isLoading = true.obs;
  Rx<CompanyProfileModel> profileData = CompanyProfileModel().obs;

  Future<void> fetchProfileData() async {
    isLoading(true);
    var fetchedData = await ApiServiceRecruiter.fetchCompanyProfileData();
    if (fetchedData != null) {
      profileData.value = fetchedData;
      print(fetchedData);
    }
    isLoading(false);
  }
}

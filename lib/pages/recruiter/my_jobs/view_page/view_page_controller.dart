import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service_recruiter.dart';
import 'package:pabjobs/entities/view_page_model.dart';

class ViewPageController extends GetxController {
  var isLoading = true.obs;
  // var contents = List<ViewPageModel>.empty(growable: true).obs;
  Rx<ViewPageModel> contents = ViewPageModel().obs;
  void fetchViewContents(String id) async {
    isLoading(true);
    var response = await ApiServiceRecruiter.fetchViewContent(id);
    contents(response);
    isLoading(false);
  }
}

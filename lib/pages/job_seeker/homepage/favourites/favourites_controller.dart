import 'package:get/get.dart';
import 'package:pabjobs/entities/api_service.dart';
import 'package:pabjobs/entities/favourite_model.dart';

class FavouritesController extends GetxController {
  var isLoading = true.obs;

  Rx<FavouritesModel> data = FavouritesModel().obs;

  void fetchFavouritesDetails() async {
    isLoading(true);
    var z = await APIService.fetchFavourites();
    data(z);
    isLoading(false);
  }
}

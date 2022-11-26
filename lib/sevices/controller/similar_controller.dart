import 'package:film_app/model/similar_model.dart';
import 'package:film_app/sevices/api_service/similar_service.dart';
import 'package:get/get.dart';

class SimilarController extends GetxController{
  var similarList = <SimilarModel>[].obs;

  @override
  void onInit() {
    getSimilarList('');
    super.onInit();
  }

  void getSimilarList(String filmId)async{
    var similarMovies = await SimilarService().getSimilarMovies(filmId);
    if (similarMovies != null) {
       similarList.value = similarMovies;
    }
  }
}
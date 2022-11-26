import 'package:film_app/model/movie_model.dart';
import 'package:film_app/model/top_rated_model.dart';
import 'package:film_app/sevices/api_service/fetch_trending.dart';
import 'package:get/get.dart';

class TrendingController extends GetxController{
  var trendingList = <MovieModel>[].obs;
  var topRatedList = <TopModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    getTrending();
    super.onInit();
  }

  void getTrending()async{

  
  try {
    isLoading(true);
    var movies = await TrendingService().getTrendingMovies();
     if (movies != null) {
    trendingList.value = movies;
  }
   var topMovies = await TrendingService().getTopRated();
   if (topMovies != null) {
     topRatedList.value = topMovies;
   }
  } finally {
    isLoading(false);
  }
  }
}
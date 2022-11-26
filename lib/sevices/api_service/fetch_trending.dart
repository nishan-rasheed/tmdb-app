import 'dart:convert';
import 'dart:developer';

import 'package:film_app/constants/api_constants.dart';
import 'package:film_app/model/movie_model.dart';
import 'package:film_app/model/top_rated_model.dart';
import 'package:http/http.dart' as http;

class TrendingService{
  List<MovieModel> movies = [];
  List<TopModel> topMovies = [];

   Future <List<MovieModel>?> getTrendingMovies()async{
   final url = 'https://api.themoviedb.org/3/trending/movie/week?api_key=$apiKey';
  
     final response = await http.get(Uri.parse(url));
  
   if (response.statusCode == 200) {
        Map<String,dynamic> data = jsonDecode(response.body);
       final List movieList = data['results'];
      movies = movieList.map((e) => MovieModel.fromJson(e)).toList();
   }
   return movies;
  }

  Future <List<TopModel>?> getTopRated()async{
   final url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1';
   final response = await http.get(Uri.parse(url));

   if (response.statusCode == 200) {
      // print(response.body);
      Map<String,dynamic> data = jsonDecode(response.body);
      final List topRateList = data['results'];
      topMovies = topRateList.map((e) =>TopModel.fromJson(e)).toList();
   } 
   return topMovies;
  }
}
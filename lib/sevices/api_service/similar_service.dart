import 'dart:convert';

import 'package:film_app/constants/api_constants.dart';
import 'package:film_app/model/similar_model.dart';
import 'package:http/http.dart' as http;

class SimilarService{
 List<SimilarModel> similarMovies =[];
 Future<List<SimilarModel>> getSimilarMovies(String id)async{
     final url = 'https://api.themoviedb.org/3/movie/$id/similar?api_key=$apiKey&language=en-US&page=1';
     final response = await http.get(Uri.parse(url));
     if (response.statusCode == 200) {
       print(response.body);
        Map<String,dynamic> data = jsonDecode(response.body);
        final List similarList = data['results'];
        similarMovies = similarList.map((e) =>SimilarModel.fromJson(e)).toList();
     }
     return similarMovies;
 }
}
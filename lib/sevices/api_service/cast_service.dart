import 'dart:convert';

import 'package:film_app/constants/api_constants.dart';
import 'package:film_app/model/cast_model.dart';

import 'package:http/http.dart' as http;

class CastService{
  List<CastModel> cast = [];
  Future<List<CastModel>> getCastList(String id)async{
   final url = 'https://api.themoviedb.org/3/movie/$id/credits?api_key=$apiKey&language=en-US';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // print(response.body);
       Map<String,dynamic> data = jsonDecode(response.body);
       final List castList = data['cast'];
       cast = castList.map((e) => CastModel.fromJson(e)).toList();
    }
    return cast;
  }
}
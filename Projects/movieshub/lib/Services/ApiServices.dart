import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movieshub/Models/PopularMoviesModel.dart';
import 'package:http/http.dart' as http;
import 'package:movieshub/Models/SearchModel.dart';

class ApiServices {

  Future<PopularMoviesModel> getPopularMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=ef6ce8c7368310e3d01fea8fef998500'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      return PopularMoviesModel.fromJson(data);
    }else{
      return PopularMoviesModel.fromJson(data);
    }
  }

  Future<SearchModel> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=ef6ce8c7368310e3d01fea8fef998500&query=$query"),
    );

    if (response.statusCode == 200) {
      return SearchModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to search movies");
    }
  }

}
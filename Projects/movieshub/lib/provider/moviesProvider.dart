import 'package:flutter/material.dart';
import 'package:movieshub/Models/PopularMoviesModel.dart';
import '../Services/ApiServices.dart';

class MoviesProvider with ChangeNotifier {
  List _movies = [];
  List<Results> _moviesList = [];

  List get movies => _movies;
  List get moviesList => _moviesList;

  Future<void> fetchPopularMovies() async {
    final result = await ApiServices().getPopularMovies();
    _movies = result.results ?? [];
    _moviesList = result.results ?? [];
    notifyListeners();
  }

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) {
      await fetchPopularMovies();
    } else {
      final result = await ApiServices().searchMovies(query);
      _movies = result.results ?? [];
      notifyListeners();
    }
  }


}

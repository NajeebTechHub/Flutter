import 'package:flutter/cupertino.dart';

import '../Models/PopularMoviesModel.dart';
import '../Services/ApiServices.dart';

class MoviesProvider with ChangeNotifier {
  List<Results> _movies = [];
  List<Results> _moviesList = [];

  List<Results> get movies => _movies;
  List<Results> get moviesList => _moviesList;

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
      _movies = result.results
          ?.map((movie) => Results(
        id: movie.id,
        title: movie.title,
        overview: movie.overview,
        posterPath: movie.posterPath,
        releaseDate: movie.releaseDate,
      ))
          .toList() ??
          [];

      notifyListeners();
    }
  }


  Future<void> searchTrailer(String query) async {
    if (query.isNotEmpty) {
      await ApiServices().getMovieTrailer(query);
    } else {
      throw Exception('empty name');
    }
  }
}

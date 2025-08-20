class SearchModel {
  SearchModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  num? page;
  List<MovieResult>? results;
  num? totalPages;
  num? totalResults;

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      page: json['page'],
      results: (json['results'] as List<dynamic>?)
          ?.map((v) => MovieResult.fromJson(v))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}

class MovieResult {
  MovieResult({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.releaseDate,
  });

  num? id;
  String? title;
  String? overview;
  String? posterPath;
  String? releaseDate;

  factory MovieResult.fromJson(Map<String, dynamic> json) {
    return MovieResult(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    return map;
  }
}

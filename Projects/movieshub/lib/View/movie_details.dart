import 'package:flutter/cupertino.dart';
import 'package:movieshub/Models/PopularMoviesModel.dart';
import 'package:movieshub/colors.dart';
import 'package:movieshub/provider/moviesProvider.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetails extends StatefulWidget {
  final Results movie;

  const MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<MoviesProvider>(
        context,
        listen: false,
      ).fetchPopularMovies(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                ),
              ),
              SizedBox(height: 16),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.movie.title}',
                      style: TextStyle(
                        color: AppColors.textYellow,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Release Date: ',
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 12,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          '${widget.movie.releaseDate}',
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 12,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Rating:',
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 12,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          CupertinoIcons.star_fill,
                          size: 14,
                          color: AppColors.textYellow,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '${(widget.movie.voteAverage)?.toStringAsFixed(1)}',
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 12,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      '${(widget.movie.overview)}',
                      style: TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 12,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Watch Trailer',
                      style: TextStyle(
                        color: AppColors.textWhite,
                        fontSize: 18,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 16),
                    YoutubePlayer(
                        controller: controller)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

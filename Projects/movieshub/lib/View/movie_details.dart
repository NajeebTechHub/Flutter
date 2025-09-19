import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieshub/Models/PopularMoviesModel.dart';
import 'package:movieshub/Services/ApiServices.dart';
import 'package:movieshub/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetails extends StatefulWidget {
  final Results movie;

  const MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    ApiServices().getMovieTrailer(widget.movie.title ?? "").then((trailer) {
      if (trailer.videoId.isNotEmpty) {
        setState(() {
          _controller = YoutubePlayerController(
            initialVideoId: trailer.videoId,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
            ),
          );

          _controller!.addListener(() {
            if (_controller!.value.isFullScreen) {
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
            } else {
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
            }
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: _controller == null
            ? const Center(child: CircularProgressIndicator())
            : YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller!,
            showVideoProgressIndicator: true,
            progressColors: ProgressBarColors(
              playedColor: Colors.redAccent,
              handleColor: Colors.red,
            ),
          ),
          builder: (context, player) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                    ),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    widget.movie.title ?? "",
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      const Text(
                        'Release Date: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        widget.movie.releaseDate ?? "",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Text(
                        'Rating: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.star_fill,
                        size: 14,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        (widget.movie.voteAverage)
                            ?.toStringAsFixed(1) ??
                            "N/A",
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Text(
                    widget.movie.overview ?? "",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      decoration: TextDecoration.none,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Watch Trailer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 12),
                  player,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

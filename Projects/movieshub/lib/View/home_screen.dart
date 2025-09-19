import 'package:flutter/material.dart';
import 'package:movieshub/colors.dart';
import 'package:provider/provider.dart';
import '../Services/ApiServices.dart';
import '../provider/moviesProvider.dart';
import 'movie_details.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final TextEditingController _searchController = TextEditingController();

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

  void _handleSearch(String query) {
    final provider = Provider.of<MoviesProvider>(context, listen: false);
    if (query.isEmpty) {
      provider.fetchPopularMovies();
    } else {
      provider.searchMovies(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MoviesProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Film',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Flare',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * .02),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(
                        AppColors.textWhite,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Movies'),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(
                        AppColors.textWhite,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Musics'),
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * .02),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search movies...",
                    hintStyle: TextStyle(color: AppColors.textGrey),
                    contentPadding: const EdgeInsets.only(left: 20, right: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      minHeight: 50,
                      minWidth: 80,
                    ),
                    suffixIcon: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                      ),
                      onPressed: () {
                        _handleSearch(_searchController.text);
                      },
                      child: const Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _handleSearch(value);
                    });
                  },
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.red,
                              width: 4,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'Popular Movies',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 8),

                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .46,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                        ),
                        itemCount: provider.movies.length,
                        itemBuilder: (context, index) {
                          final movie = provider.movies[index];
                          final moviesDetails = provider.moviesList[index];
                          String? releaseDate = movie.releaseDate;
                          String? releaseYear = releaseDate != null && releaseDate.isNotEmpty
                              ? releaseDate.substring(0, 4)
                              : null;
                          return GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                return MovieDetails(movie: movie,);
                              }));
                            },
                            child: Card(
                              color: AppColors.cardBackground,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height * .27,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: Text(
                                      movie.title ?? "No Title",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star, color: AppColors.textYellow, size: 16),
                                      Text(
                                        "${(moviesDetails.voteAverage ?? 0).toStringAsFixed(1)}/10",
                                        style: TextStyle(
                                          color: AppColors.textYellow,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(releaseYear ?? 'N/A',
                                      style: TextStyle(color: AppColors.textGrey))
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/general_controller.dart';
import 'movie_details_screen.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  bool _load = true;

  getData(BuildContext ctx) async {
    if (_load == true) {
      await ctx.read<GeneralController>().initializeMovieListScreen();
      setState(() {
        _load = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    getData(context);
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Consumer<GeneralController>(
        builder: (_, movieData, child) {
          return ListView.builder(
            itemCount: movieData.moviesListLength,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      MovieDetailsScreen.routeName,
                      arguments: MovieDetailsScreen(
                        movieDetails: movieData.moviesList[index],
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${movieData.moviesList[index].backdrop_path}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                            bottom: 20,
                            left: 20,
                            child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  movieData.moviesList[index].original_title,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [
                                0.85,
                                0.9,
                                0.95,
                                1.0,
                              ],
                              colors: [
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.2),
                                Colors.black.withOpacity(0.3),
                                Colors.black.withOpacity(0.4),
                              ],
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty/screens/seat_mapping_screen.dart';
import 'package:tentwenty/screens/video_player.dart';

import '../providers/general_controller.dart';
import '../models/movie_details.dart';
import '../utilities/constants.dart';
import '../widgets/screen_details_button.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetails? movieDetails;
  MovieDetailsScreen({
    this.movieDetails,
  });

  static const routeName = '/movie_details_screen';

  @override
  Widget build(BuildContext context) {
    final _movieDetailsScreen =
        ModalRoute.of(context)?.settings.arguments as MovieDetailsScreen;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            leadingWidth: 300,
            leading: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                    ),
                  ),
                  const Text(
                    'Watch',
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            expandedHeight: screenHeight * 0.45,
            backgroundColor: Color.fromARGB(255, 122, 193, 237),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500/${_movieDetailsScreen.movieDetails?.backdrop_path}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [
                          0.25,
                          0.5,
                          0.75,
                          1.0,
                        ],
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.5),
                        ],
                      )),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: FittedBox(
                              child: Text(
                                'In Theaters ${dateFormat(_movieDetailsScreen.movieDetails?.release_date)}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          ScreenDetailsButton(
                            color: const Color.fromARGB(255, 122, 193, 237),
                            widget: const Text(
                              'Get Tickets',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            function: () {
                              Navigator.of(context).pushNamed(
                                SeatMappingScreen.routeName,
                                arguments: SeatMappingScreen(
                                  movieDetails:
                                      _movieDetailsScreen.movieDetails,
                                ),
                              );
                            },
                          ),
                          ScreenDetailsButton(
                            color: Colors.transparent,
                            widget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Watch Trailer',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            function: () {
                              Navigator.of(context).pushNamed(
                                VideoPlayer.routeName,
                                arguments: _movieDetailsScreen.movieDetails?.id,
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

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Genres

                      const Text(
                        'Genres',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            ...?_movieDetailsScreen.movieDetails?.genre_ids
                                .map((e) => getGenreWidget(e, context))
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        decoration: const BoxDecoration(
                            border: Border(
                          top: BorderSide(
                            color: Colors.black38,
                            width: 0.5,
                          ),
                        )),
                        padding: EdgeInsets.all(8),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Overview',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                  '${_movieDetailsScreen.movieDetails?.overview}',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

getGenreWidget(int genreId, BuildContext ctx) {
  List entry = Provider.of<GeneralController>(ctx)
      .genres
      .where((element) => element['id'] == genreId)
      .toList();

  return Container(
    padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: colors[Random().nextInt(colors.length)],
      borderRadius: BorderRadius.circular(100),
    ),
    child: Text(
      '${entry[0]['name']}',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}

getGenreName(int genreId, BuildContext ctx) {
  List entry = Provider.of<GeneralController>(ctx)
      .genres
      .where((element) => element['id'] == genreId)
      .toList();

  return '${entry[0]['name']}';
}

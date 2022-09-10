import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/general_controller.dart';
import '../utilities/constants.dart';
import 'movie_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _isLandscape = _mediaQuery.orientation == Orientation.landscape;

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Consumer<GeneralController>(
        builder: (_, movieData, child) {
          return movieData.searchScreenStatus == 'idle'
              ? Text('idle')
              : movieData.searchScreenStatus == 'loading'
                  ? const Center(child: CircularProgressIndicator())
                  : movieData.searchScreenStatus == 'empty'
                      ? Center(child: Text('Movie not found'))
                      : ListView.builder(
                          itemCount: movieData.movieSearchList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                index == 0
                                    ? Container(
                                        margin: EdgeInsets.only(
                                            top: 28, bottom: 20),
                                        height: 30,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.black54,
                                                    width: 0.5))),
                                        child: Text(
                                          'Top results',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      MovieDetailsScreen.routeName,
                                      arguments: MovieDetailsScreen(
                                        movieDetails:
                                            movieData.movieSearchList[index],
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10.0, top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: screenWidth * 0.4,
                                                height: screenWidth * 0.37,
                                                child: Image.network(
                                                  'https://image.tmdb.org/t/p/w500/${movieData.movieSearchList[index].backdrop_path}',
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
                                                      0.85,
                                                      0.9,
                                                      0.95,
                                                      1.0,
                                                    ],
                                                    colors: [
                                                      Colors.black
                                                          .withOpacity(0.1),
                                                      Colors.black
                                                          .withOpacity(0.2),
                                                      Colors.black
                                                          .withOpacity(0.3),
                                                      Colors.black
                                                          .withOpacity(0.4),
                                                    ],
                                                  )),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          width: screenWidth * 0.3,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${movieData.movieSearchList[index].title}',
                                                overflow: TextOverflow.fade,
                                                style: const TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                movieData.movieSearchList[index]
                                                        .genre_ids.isNotEmpty
                                                    ? '${getGenreName(movieData.movieSearchList[index].genre_ids[0], context)}'
                                                    : 'Action',
                                                style: const TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(child: SizedBox.shrink()),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: _isLandscape ? 20.0 : 0.0),
                                          child: const Icon(
                                            Icons.menu,
                                            color: Color.fromARGB(
                                                255, 122, 193, 237),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
        },
      ),
    );
  }
}

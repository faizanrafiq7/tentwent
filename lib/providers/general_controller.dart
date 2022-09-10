import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/movie_details.dart';
import '../services/networking.dart';

class GeneralController with ChangeNotifier {
  List genres = [];

  List _moviesDetailsList = [];

  int get moviesListLength {
    return _moviesDetailsList.length;
  }

  UnmodifiableListView get moviesList {
    return UnmodifiableListView(_moviesDetailsList);
  }

  initializeMovieListScreen() async {
    var data = await NetworkHelper('/3/movie/upcoming').getData();

    var dataGenres = await NetworkHelper('/3/genre/movie/list').getData();

    genres = dataGenres['genres'];

    _moviesDetailsList =
        data['results'].map((e) => MovieDetails.fromDocument(e)).toList();

    notifyListeners();
  }

  String? searchScreenStatus = 'idle';

  getMovieSearch(String search) async {
    if (search.isEmpty) {
      return;
    }

    searchScreenStatus = 'loading';

    movieSearchList = [];

    var _data =
        await NetworkHelper('/3/search/movie', movieSearch: search).getData();

    _data['results'].map((e) {
      if (e['backdrop_path'] != null && e['backdrop_path'] != '') {
        movieSearchList.add(MovieDetails.fromDocument(e));
      }
    }).toList();

    if (movieSearchList.isEmpty) {
      searchScreenStatus = 'empty';
    } else {
      searchScreenStatus = 'notEmpty';
    }

    notifyListeners();
  }

  List movieSearchList = [];
}

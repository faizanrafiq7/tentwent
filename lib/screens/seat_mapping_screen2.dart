import 'package:flutter/material.dart';

import '../models/movie_details.dart';
import '../utilities/constants.dart';
import '../widgets/hall_ui_widget2.dart';

class SeatMappingScreen2 extends StatelessWidget {
  MovieDetails? movieDetails;
  SeatMappingScreen2({
    this.movieDetails,
  });

  static const routeName = '/seat_mapping_screen2';

  var _seatMappingScreen2;

  @override
  Widget build(BuildContext context) {
    _seatMappingScreen2 =
        ModalRoute.of(context)?.settings.arguments as SeatMappingScreen2;

    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        color: Colors.transparent,
        child: Expanded(
          child: Container(
            width: double.infinity,
            height: 500,
            child: Center(child: HallUIWidget2()),
          ),
        ),
      ),
    );
  }

  PreferredSize buildAppBar(BuildContext ctx) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(65.0),
      child: AppBar(
        excludeHeaderSemantics: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(ctx);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        title: Column(
          children: [
            Text(
              '${_seatMappingScreen2.movieDetails?.title}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            Text(
              '${dateFormat(_seatMappingScreen2.movieDetails?.release_date)}  l  12:30 Hall 1',
              style: const TextStyle(color: Colors.blue, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

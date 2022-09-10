import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty/screens/home_screen.dart';
import 'package:tentwenty/screens/movie_details_screen.dart';
import 'package:tentwenty/screens/seat_mapping_screen.dart';
import 'package:tentwenty/screens/seat_mapping_screen2.dart';
import 'package:tentwenty/screens/video_player.dart';

import 'providers/general_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: GeneralController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Poppin',
        ),
        home: HomeScreen(),
        routes: {
          MovieDetailsScreen.routeName: (ctx) => MovieDetailsScreen(),
          VideoPlayer.routeName: (ctx) => VideoPlayer(),
          SeatMappingScreen.routeName: (ctx) => SeatMappingScreen(),
          SeatMappingScreen2.routeName: (ctx) => SeatMappingScreen2(),
        },
      ),
    );
  }
}

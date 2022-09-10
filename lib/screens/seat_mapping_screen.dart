import 'package:flutter/material.dart';
import 'package:tentwenty/screens/seat_mapping_screen2.dart';

import '../models/movie_details.dart';
import '../utilities/constants.dart';
import '../widgets/hall_ui_widget.dart';
import '../widgets/screen_details_button.dart';

class SeatMappingScreen extends StatefulWidget {
  MovieDetails? movieDetails;
  SeatMappingScreen({
    this.movieDetails,
  });

  static const routeName = '/seat_mapping_screen';

  @override
  State<SeatMappingScreen> createState() => _SeatMappingScreenState();
}

class _SeatMappingScreenState extends State<SeatMappingScreen> {
  var _seatMappingScreen;

  int selectedIndexDate = 0;
  int selectedIndexHall = 0;

  @override
  Widget build(BuildContext context) {
    _seatMappingScreen =
        ModalRoute.of(context)?.settings.arguments as SeatMappingScreen;

    final _mediaQuery = MediaQuery.of(context);
    final _isLandscape = _mediaQuery.orientation == Orientation.landscape;

    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: _isLandscape ? 0 : screenHeight * 0.15,
              ),
              const Text(
                'Date',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
              Container(
                height: 60,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndexDate = index;
                          });
                        },
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 35,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: selectedIndexDate == index
                                  ? const Color.fromARGB(255, 122, 193, 237)
                                  : Colors.grey.withOpacity(0.2),
                            ),
                            child: Center(
                                child: Text(
                              '${index + 1} Mar',
                              style: TextStyle(
                                  color: selectedIndexDate == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 14),
                            )),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 210,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int _index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: const [
                                Text(
                                  '12:30  ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Cinematic + Hall 1',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndexHall = _index;
                                });
                              },
                              child: Container(
                                width: 250,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: selectedIndexHall == _index
                                          ? const Color.fromARGB(
                                              255, 122, 193, 237)
                                          : Colors.grey.withOpacity(0.2),
                                    )),
                                child: Center(child: HallUIWidget()),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: const [
                                Text(
                                  'From  ',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '50\$  ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  'or  ',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '2500 bonus',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: _isLandscape ? 20 : screenHeight * 0.3,
              ),
              Center(
                child: MaterialButton(
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(
                          color: Color.fromARGB(255, 122, 193, 237), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  color: Color.fromARGB(255, 122, 193, 237),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      SeatMappingScreen2.routeName,
                      arguments: SeatMappingScreen2(
                        movieDetails: _seatMappingScreen.movieDetails,
                      ),
                    );
                  },
                  child: Container(
                      height: screenHeight * 0.06,
                      width: screenWidth * 0.6,
                      child: Center(
                        child: Text(
                          'Select Seats',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(65.0),
      child: AppBar(
        excludeHeaderSemantics: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        title: Column(
          children: [
            Text(
              '${_seatMappingScreen.movieDetails?.title}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            Text(
              'In Theaters ${dateFormat(_seatMappingScreen.movieDetails?.release_date)}',
              style: const TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tentwenty/utilities/constants.dart';

class HallUIWidget2 extends StatelessWidget {
  const HallUIWidget2({Key? key}) : super(key: key);

  giveClr1(int _index) {
    if (_index == 0 ||
        _index == 1 ||
        _index == 2 ||
        _index == 5 ||
        _index == 10 ||
        _index == 15) {
      return Colors.transparent;
    } else {
      return Colors.black;
    }
  }

  giveClr2(int _index) {
    if (_index == 2 ||
        _index == 3 ||
        _index == 4 ||
        _index == 9 ||
        _index == 14 ||
        _index == 19) {
      return Colors.transparent;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _isLandscape = _mediaQuery.orientation == Orientation.landscape;

    return Container(
      child: Stack(
        children: [
          CustomPaint(
            size:
                Size(_isLandscape ? _mediaQuery.size.width : screenWidth, 500),
            painter: CurvedPainter(),
          ),
          Positioned.fill(
            bottom: _isLandscape ? 230 : 375.0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Center(
                  child: Text(
                'screen',
                style: TextStyle(color: Colors.black38, fontSize: 15),
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 33),
            child: Center(
              child: Container(
                width: double.infinity,
                height: _isLandscape ? 200 : 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: screenWidth * 0.2,
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 15,
                                  childAspectRatio: 3 / 4,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 2),
                          itemCount: 50,
                          itemBuilder: (BuildContext ctx, index) {
                            return FittedBox(
                                child: Icon(
                              Icons.airplay,
                              color: giveClr1(index),
                            ));
                          }),
                    ),
                    Container(
                      width: screenWidth * 0.4,
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 20,
                                  childAspectRatio: 4 / 3,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 2),
                          itemCount: 104,
                          itemBuilder: (BuildContext ctx, index) {
                            return const FittedBox(
                                child: Icon(
                              Icons.airplay,
                              color: Colors.black,
                            ));
                          }),
                    ),
                    Container(
                      width: screenWidth * 0.2,
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 15,
                                  childAspectRatio: 3 / 4,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 2),
                          itemCount: 50,
                          itemBuilder: (BuildContext ctx, index) {
                            return FittedBox(
                                child: Icon(
                              Icons.airplay,
                              color: giveClr2(index),
                            ));
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color.fromARGB(255, 122, 193, 237)
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(size.width * 0.05,
        size.height * 0.2); //(horizontal point start, vertical pont start)

    path.quadraticBezierTo(size.width * 0.5, size.height * 0.0,
        size.width * 0.95, size.height * 0.2);

    path.lineTo(size.width * 0.95, size.height * 0.203);

    path.quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.005,
        size.width * 0.05,
        size.height * 0.203); //(horizontal point end, vertical pont end)

    // path.lineTo(0, size.height * 0.71);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

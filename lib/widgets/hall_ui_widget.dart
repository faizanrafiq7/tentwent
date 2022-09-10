import 'package:flutter/material.dart';

class HallUIWidget extends StatelessWidget {
  const HallUIWidget({Key? key}) : super(key: key);

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
    return Container(
      child: Stack(
        children: [
          CustomPaint(
            size: Size(250, 200),
            painter: CurvedPainter(),
          ),
          const Positioned.fill(
            bottom: 85.0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Center(
                  child: Text(
                'screen',
                style: TextStyle(color: Colors.black38, fontSize: 10),
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 33),
            child: Center(
              child: Container(
                width: 200,
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 40,
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 7,
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
                      width: 80,
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 10,
                                  childAspectRatio: 4 / 3,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 2),
                          itemCount: 130,
                          itemBuilder: (BuildContext ctx, index) {
                            return const FittedBox(
                                child: Icon(
                              Icons.airplay,
                              color: Colors.black,
                            ));
                          }),
                    ),
                    Container(
                      width: 40,
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 7,
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

    path.moveTo(size.width * 0.15,
        size.height * 0.3); //(horizontal point start, vertical pont start)

    path.quadraticBezierTo(size.width * 0.5, size.height * 0.0,
        size.width * 0.85, size.height * 0.3);

    path.lineTo(size.width * 0.85, size.height * 0.31);

    path.quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.01,
        size.width * 0.15,
        size.height * 0.31); //(horizontal point end, vertical pont end)

    // path.lineTo(0, size.height * 0.71);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

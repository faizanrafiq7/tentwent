import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class ScreenDetailsButton extends StatelessWidget {
  Color? color;
  Widget? widget;
  Function? function;
  ScreenDetailsButton({this.widget, this.color, this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: MaterialButton(
          shape: const RoundedRectangleBorder(
              side: BorderSide(
                  color: Color.fromARGB(255, 122, 193, 237), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          color: color,
          onPressed: () {
            function!();
          },
          child: Container(
            height: screenHeight * 0.07,
            width: screenWidth * 0.6,
            child: Center(child: widget),
          )),
    );
  }
}

import 'package:flutter/material.dart';

var mediaQuery;
var screenHeight;
var screenWidth;

Color backgroundClr = const Color.fromARGB(255, 240, 240, 250);

dateFormat(String? date) {
  String? year;
  String? month;
  String? day;

  List? data = date?.split('-').toList();

  year = data![0];

  switch (data[1]) {
    case '01':
      month = 'January';
      break;
    case '02':
      month = 'February';
      break;
    case '03':
      month = 'March';
      break;
    case '04':
      month = 'April';
      break;
    case '05':
      month = 'May';
      break;
    case '06':
      month = 'June';
      break;
    case '07':
      month = 'July';
      break;
    case '08':
      month = 'August';
      break;
    case '09':
      month = 'September';
      break;
    case '10':
      month = 'October';
      break;
    case '11':
      month = 'November';
      break;
    case '12':
      month = 'December';
      break;
  }

  day = data[2];

  return '$month, $day, $year';
}

getScreenSize(BuildContext context) {
  mediaQuery = MediaQuery.of(context);

  screenHeight = mediaQuery.size.height -
      mediaQuery.padding.top -
      mediaQuery.padding.bottom;

  screenWidth = mediaQuery.size.width -
      mediaQuery.padding.left -
      mediaQuery.padding.right;

  if (screenWidth > screenHeight) {
    var a = screenWidth;

    screenWidth = screenHeight;
    screenHeight = a;
  }
}

List<Color> colors = [
  Color.fromARGB(255, 97, 207, 188),
  Color.fromARGB(255, 211, 115, 163),
  Color.fromARGB(255, 84, 76, 158),
  Color.fromARGB(255, 196, 158, 56),
  Color.fromARGB(255, 45, 39, 56),
  Color.fromARGB(255, 45, 39, 56),
  Color.fromARGB(255, 122, 193, 237),
];

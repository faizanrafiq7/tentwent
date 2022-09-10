import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tentwenty/screens/search_screen.dart';

import '../providers/general_controller.dart';
import '../utilities/constants.dart';
import 'movie_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  final pages = [
    const MovieListScreen(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  TextEditingController txtCtrl = TextEditingController();
  FocusNode focusNode = FocusNode();
  String? lastInputValue;
  @override
  Widget build(BuildContext context) {
    getScreenSize(context);
    return Scaffold(
      backgroundColor: backgroundClr,
      appBar: buildAppbar(),
      body: txtCtrl.text != '' ? SearchScreen() : pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  bool searchAppbar = false;
  PreferredSize buildAppbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(65.0),
      child: AppBar(
        title: searchAppbar
            ? CupertinoTextField(
                placeholder: 'TV shows, Movies and more',
                controller: txtCtrl,
                focusNode: focusNode,
                prefix: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () async {
                      await context
                          .read<GeneralController>()
                          .getMovieSearch(txtCtrl.text);

                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                suffix: IconButton(
                  icon: Icon(Icons.clear),
                  color: Colors.black,
                  onPressed: () {
                    // FocusScope.of(context).unfocus();
                    // FocusScope.of(context).requestFocus(focusNode);
                    txtCtrl.clear();

                    setState(() {
                      searchAppbar = !searchAppbar;
                    });
                  },
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: backgroundClr,
                    borderRadius: BorderRadius.circular(50)),
                autofocus: true,
                onChanged: (val) async {
                  if (lastInputValue != val) {
                    lastInputValue = val;

                    setState(() {});

                    await context
                        .read<GeneralController>()
                        .getMovieSearch(txtCtrl.text);
                  }
                },
                onSubmitted: (val) async {
                  // await context
                  //     .read<GeneralController>()
                  //     .getMovieSearch(txtCtrl.text);

                  FocusScope.of(context).unfocus();
                },
              )
            : SizedBox.shrink(),
        actions: searchAppbar
            ? []
            : <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      searchAppbar = true;
                    });
                  },
                ),
              ],
        leadingWidth: searchAppbar ? 0 : 90,
        leading: searchAppbar
            ? SizedBox.shrink()
            : const Center(
                child: Text(
                  'Watch',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: Platform.isIOS ? 85 : 70,
      padding: EdgeInsets.only(bottom: Platform.isIOS ? 15 : 0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 45, 39, 56),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.apps,
                  color: pageIndex == 0 ? Colors.white : Colors.grey,
                  size: 35,
                ),
              ),
              Text(
                'Dashboard',
                style: TextStyle(
                    color: pageIndex == 0 ? Colors.white : Colors.grey,
                    fontSize: 10),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.play_circle_filled_sharp,
                  color: pageIndex == 1 ? Colors.white : Colors.grey,
                  size: 35,
                ),
              ),
              Text(
                'Watch',
                style: TextStyle(
                    color: pageIndex == 1 ? Colors.white : Colors.grey,
                    fontSize: 10),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: Icon(
                  Icons.folder,
                  color: pageIndex == 2 ? Colors.white : Colors.grey,
                  size: 35,
                ),
              ),
              Text(
                'Media Library',
                style: TextStyle(
                    color: pageIndex == 2 ? Colors.white : Colors.grey,
                    fontSize: 10),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: Icon(
                  Icons.menu_open_rounded,
                  color: pageIndex == 3 ? Colors.white : Colors.grey,
                  size: 35,
                ),
              ),
              Text(
                'More',
                style: TextStyle(
                    color: pageIndex == 3 ? Colors.white : Colors.grey,
                    fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

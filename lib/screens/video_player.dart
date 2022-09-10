import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tentwenty/utilities/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../services/networking.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);
  static const routeName = '/video_player_screen';
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  bool load = true;

  late String id;

  late YoutubePlayerController _controller;

  plaVideo() async {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    var data = await NetworkHelper('/3/movie/$id/videos').getData();

    if (data['results'].length == 0) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Trailer for this movie is not available.')));
    }

    String _key = data['results'][0]['key'];

    _controller = YoutubePlayerController(
      initialVideoId: '$_key',
      flags: const YoutubePlayerFlags(
        disableDragSeek: true,
        loop: false,
        autoPlay: true,
        mute: false,
      ),
    );

    _controller.addListener(() {
      setState(() {});
      if (_controller.value.playerState.name == 'ended') {
        Navigator.pop(context);
      }
    });

    setState(() {
      load = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context)?.settings.arguments as String;
    if (load == true) {
      plaVideo();
    }

    return load
        ? const Center(child: CupertinoActivityIndicator())
        : Scaffold(
            body: Container(
              child: Stack(
                children: [
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: false,
                    progressIndicatorColor: Colors.red,
                  ),
                  _controller.value.isControlsVisible
                      ? Positioned.fill(
                          bottom: screenWidth * 0.2,
                          left: screenHeight * 0.9,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: screenHeight * 0.1,
                                height: 30,
                                color: Colors.red,
                                child: Center(
                                  child: Text(
                                    'Done',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
          );
  }
}

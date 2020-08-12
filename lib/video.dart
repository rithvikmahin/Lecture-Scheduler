import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(VideoPage());
}

// ignore: must_be_immutable
class VideoPage extends StatelessWidget {
  @override
  String url;
  VideoPage({Key key, @required this.url}) : super(key: key);
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Video(url: url)
    );
  }
}

// ignore: must_be_immutable
class Video extends StatelessWidget {
  @override
  String url;
  Video({Key key, @required this.url}) : super(key: key);

  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: url,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideControls: true,
      ),
    );

    return Scaffold(
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
        ),
      ),
    );
  }
}
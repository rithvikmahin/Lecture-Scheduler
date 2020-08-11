import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(VideoPage());
}

// ignore: must_be_immutable
class VideoPage extends StatelessWidget {
  @override
  String url;
  VideoPage({Key key, @required this.url}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Video(url: url),
    );
  }
}

// ignore: must_be_immutable
class Video extends StatelessWidget {
  @override
  String url;
  Video({Key key, @required this.url}) : super(key: key);

  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: url,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
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
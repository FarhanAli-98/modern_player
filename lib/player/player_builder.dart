import 'package:flutter/material.dart';
import 'package:modernplayer/player/modern_player.dart';
import 'package:modernplayer/player/video_model.dart';


class QuestionsBuilder extends StatefulWidget {
  const QuestionsBuilder({Key? key}) : super(key: key);

  @override
  State<QuestionsBuilder> createState() => _QuestionsBuilderState();
}

class _QuestionsBuilderState extends State<QuestionsBuilder> with WidgetsBindingObserver {
  List<VideoViewModel> listOfVideos = [];

  @override
  void initState() {
    super.initState();
    listOfVideos = addDataToVideoView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        body: PageView.builder(
            itemCount: listOfVideos.length,
            scrollDirection: Axis.vertical,
            onPageChanged: (ind) async {},
            itemBuilder: (context, index) {
              return VideoPlayerView(
                listOfVideos[index].url,
              );

              // PlayerSwiftView(
              //   link: listOfVideos[index].url,
              //   thumbnail: listOfVideos[index].thumbnail,
              //   autoPlay: true,
              //   cacheConfiguration: true,
              //   looping: true,
              // );
            }));
  }
}

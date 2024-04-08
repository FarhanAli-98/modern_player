import 'package:flutter/material.dart';
import 'package:modern_player/modern_player.dart';

class VideoPlayerView extends StatefulWidget {
  final String _url;
  const VideoPlayerView(this._url, {super.key});

  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // color: Colors.green,
        height: 250,
        child: IgnorePointer(
      
          child: ModernPlayer.createPlayer(
            video: ModernPlayerVideo.single(
              ModernPlayerVideoData.network(label: 'HD', url: widget._url),
            ),
            themeOptions: ModernPlayerThemeOptions(
              loadingColor: Theme.of(context).primaryColor,
              customLoadingWidget: const CircularProgressIndicator(),
            ),
            controlsOptions: ModernPlayerControlsOptions(
              showBackbutton: false,
              showMenu: false,
            ),
          ),
        ),
      ),
    );
  }
}

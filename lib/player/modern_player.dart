import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:modern_player/modern_player.dart';

class VideoPlayerView extends StatefulWidget {
  final String _url;
  const VideoPlayerView(this._url, {super.key});

  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  File? path;
  cacheFile() async {
    path = await DefaultCacheManager().getSingleFile(widget._url);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      cacheFile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          // color: Colors.green,
          height: 250,
          child: path != null
              ? IgnorePointer(
                  child: ModernPlayer.createPlayer(
                    video: ModernPlayerVideo.single(
                      ModernPlayerVideoData.file(label: 'HD', path: path!.path),
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
                )
              : const CircularProgressIndicator()),
    );
  }
}

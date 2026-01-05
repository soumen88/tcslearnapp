import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:tcslearnapp/base/logger_utils.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewScreen extends StatefulWidget {
  final String filePath;
  final VoidCallback onSaveButtonPress;
  const VideoPreviewScreen({super.key, required this.filePath, required this.onSaveButtonPress});

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  final _logger = LoggerUtils();
  final _TAG = "VideoPreviewScreenState";
  @override
  void initState() {
    initializeVideoPlayer();
    super.initState();
  }

  Future<void> initializeVideoPlayer() async{
    var videoFile = File(widget.filePath);
    _videoPlayerController = VideoPlayerController.file(videoFile);
    await _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
    _logger.log(TAG: _TAG, message: "Initialization completed for video player");
    _chewieController = ChewieController(videoPlayerController: _videoPlayerController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: FutureBuilder(
            future: initializeVideoPlayer(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              else if(snapshot.hasError){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/camcorder.png",
                        width: 180,
                        height: 180,
                      ),
                      Text(
                        snapshot.error.toString(),
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              }
              else{
                return Chewie(
                    controller: _chewieController
                );
              }
            }
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: FilledButton.icon(
              onPressed: (){
                Navigator.pop(context);
              },
              label: Text("Discard"),
              icon: Icon(Icons.cancel),
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: FilledButton.icon(
              onPressed: () {
                widget.onSaveButtonPress();
                Navigator.pop(context);
              },
              label: Text("Save"),
              icon: Icon(Icons.check),
            ),
          ),
        ],
      ),
    );
  }
}

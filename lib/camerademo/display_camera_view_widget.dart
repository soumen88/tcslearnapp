import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tcslearnapp/base/logger_utils.dart';
import 'package:tcslearnapp/camerademo/camera_preview_screen.dart';
import 'package:tcslearnapp/camerademo/video_preview_screen.dart';

class DisplayCameraViewWidget extends StatefulWidget {
  const DisplayCameraViewWidget({super.key});

  @override
  State<DisplayCameraViewWidget> createState() => _DisplayCameraViewWidgetState();
}

class _DisplayCameraViewWidgetState extends State<DisplayCameraViewWidget> {

  List<CameraDescription> _camerasList = [];
  /// 0 -> Back camera will be used
  /// 1 -> Front camera will be used
  int _selectedCameraId = 0;
  CameraController? _controller;
  final _logger = LoggerUtils();
  final _TAG = "DisplayCameraView";
  bool isVideoRecordingStarted = false;
  @override
  void initState() {
    initCamera();
    super.initState();
  }

  ///Step 1 - Initialize the camera
  Future<void> initCamera() async{
    availableCameras().then((List<CameraDescription> totalCameras) async{
      _camerasList = totalCameras;
      _logger.log(TAG: _TAG, message: "We found ${_camerasList.length} cameras in this device");
      await configureCamera(_camerasList[_selectedCameraId]);
    }).onError((error, stacktrace){
      _logger.log(TAG: _TAG, message: "No cameras present in this device");
    });
  }

  ///Step 2 - Configure camera resolution
  Future<void> configureCamera( CameraDescription description) async{
    _controller = CameraController(description, ResolutionPreset.high);
    await _controller?.initialize();
    _controller?.addListener((){

    });
    setState(() {

    });
  }

  ///Step 3 - Shoot an photo
  Future<void> clickPhoto(BuildContext context) async{
    XFile? cameraFile = await _controller?.takePicture();
    _logger.log(TAG: _TAG, message: "Camera file path ${cameraFile?.path}");
    try{
      if(cameraFile != null && cameraFile.path.isNotEmpty){

        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>
            CameraPreviewScreen(
                filePath: cameraFile.path ?? '',
                onSaveButtonPress: () async{
                  final directory = await getApplicationDocumentsDirectory();
                  final String newFilePath = "${directory.path}/${DateTime.now().microsecondsSinceEpoch}.jpg";
                  await cameraFile.saveTo(newFilePath);
                  _logger.log(TAG: _TAG, message: "File path for storage $newFilePath");
                },
            )
        ));
      }
    }
    catch(exception){
      _logger.log(TAG: _TAG, message: "Storage exception $exception");
    }

  }

  Future<void> switchCamera() async{
    if(_selectedCameraId == 0){
      _selectedCameraId = 1;
    }
    else{
      _selectedCameraId = 0;
    }
    await configureCamera(_camerasList[_selectedCameraId]);
  }

  Future<void> startVideoRecording(BuildContext context) async{
    await _controller?.startVideoRecording();
    await Future.delayed(Duration(seconds: 5), () async{
      XFile? _videoFile = await _controller?.stopVideoRecording();
      _logger.log(TAG: _TAG, message: "Path for video ${_videoFile?.path}");
      isVideoRecordingStarted = false;
      setState(() {

      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPreviewScreen(
          filePath: _videoFile?.path ??'',
          onSaveButtonPress: () async{
            final directory = await getApplicationDocumentsDirectory();
            final String newFilePath = "${directory.path}/${DateTime.now().microsecondsSinceEpoch}.mp4";
            await _videoFile?.saveTo(newFilePath);
            _logger.log(TAG: _TAG, message: "File path for storage $newFilePath");
          },
      ),
      )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
            child: showCameraPreview(context)
        ),
        Positioned(
            bottom: 20,
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  size: 50,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: (){
                    clickPhoto(context);
                  },
                  child: Icon(
                    Icons.circle_outlined,
                    size: 70,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: (){
                    switchCamera();
                  },
                  child: Icon(
                    Icons.sync,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),

                GestureDetector(
                  onTap: (){
                    isVideoRecordingStarted = !isVideoRecordingStarted;
                    startVideoRecording(context);
                    setState(() {

                    });
                  },
                  child: isVideoRecordingStarted ? Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white, // The outline color
                          width: 2.0, // The outline width
                        )
                    ),
                    child: Icon(
                      Icons.square,
                      size: 30,
                      color: Colors.red,
                    ),
                  ) : Icon(
                  Icons.video_call,
                  size: 50,
                  color: Colors.white,
                ),
                )
              ],
            )
        ),
        Positioned(
            top: 50,
            child: Image.asset('assets/images/white_rectangle.png')
        )
      ],
    );
    //return showCameraPreview(context);
  }

  Widget showCameraPreview(BuildContext context){
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    if(_controller != null && _controller!.value.isInitialized){
      return AspectRatio(
          aspectRatio: isLandscape ? (16/9) : (9/16),
          child: CameraPreview(_controller!),
      );
    }
    else{
      return Center(
        child: Text("Camera is loading..."),
      );
    }
  }


}

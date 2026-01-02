import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tcslearnapp/base/logger_utils.dart';

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
  Future<void> clickPhoto() async{
    XFile? cameraFile = await _controller?.takePicture();
    _logger.log(TAG: _TAG, message: "Camera file path ${cameraFile?.path}");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
            child: showCameraPreview()
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
                    clickPhoto();
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
                Icon(
                  Icons.sync,
                  size: 50,
                  color: Colors.white,
                ),
              ],
            )
        )
      ],
    );
  }

  Widget showCameraPreview(){
    if(_controller != null && _controller!.value.isInitialized){
      return AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
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

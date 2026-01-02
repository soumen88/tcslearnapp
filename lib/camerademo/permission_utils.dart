import 'package:permission_handler/permission_handler.dart';
import 'package:tcslearnapp/base/logger_utils.dart';
class PermissionUtils {
  final _logger = LoggerUtils();
  final _TAG = "Permission";

  Future<bool> askCameraPermission() async{

    var status = await Permission.camera.status;
    _logger.log(TAG: _TAG, message:"Before asking permission Status for camera $status");
    if(status.isDenied){
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.microphone,
      ].request();
    }

    bool cameraPermissionGranted = await Permission.camera.status.isGranted;
    bool microphonePermissionGranted = await Permission.microphone.status.isGranted;
    _logger.log(TAG: _TAG, message:"After asking permission Status for camera $cameraPermissionGranted and microphone $microphonePermissionGranted");
    bool isAllPermissionGranted = cameraPermissionGranted && microphonePermissionGranted;
    if(isAllPermissionGranted){
      return Future.value(isAllPermissionGranted);
    }
    else{
      return Future.error("User hasn't approved all permissions. So open settings to show the permission dialog");
    }
  }
}
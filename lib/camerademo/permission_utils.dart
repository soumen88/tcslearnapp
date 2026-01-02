import 'package:permission_handler/permission_handler.dart';

class PermissionUtils{

  Future<bool> askCameraPermission() async{

    var cameraPermissionStatus = await Permission.camera.status;
    print("Starting to ask permission ${cameraPermissionStatus}");
    if(cameraPermissionStatus.isDenied){
      //Request for permission
      Map<Permission, PermissionStatus> permissionList = await [
        Permission.camera,
        Permission.microphone,
      ].request();
    }

    bool isPermissionGranted = await Permission.camera.status.isGranted;
    return Future.value(isPermissionGranted);
  }


}
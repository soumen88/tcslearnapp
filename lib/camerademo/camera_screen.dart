import 'package:flutter/material.dart';
import 'package:tcslearnapp/camerademo/permission_utils.dart';

class CameraScreen extends StatelessWidget {

  final PermissionUtils _permissionUtils = PermissionUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: FilledButton(
            onPressed: (){
                _permissionUtils.askCameraPermission();
            },
            child: Text('Ask permission')
        ),
      ),
    );
  }
}

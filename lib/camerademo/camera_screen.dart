import 'package:flutter/material.dart';
import 'package:tcslearnapp/camerademo/display_camera_view_widget.dart';
import 'package:tcslearnapp/camerademo/permission_utils.dart';


class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera screen"),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: PermissionUtils().askCameraPermission(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(snapshot.hasData){
              return Center(
                child: DisplayCameraViewWidget(),
              );
            }
            else{
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
          }
      )
    );
  }
}

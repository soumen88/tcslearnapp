import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraPreviewScreen extends StatelessWidget {
  final String filePath;
  final VoidCallback onSaveButtonPress;
  const CameraPreviewScreen({super.key, required this.filePath, required this.onSaveButtonPress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Preview Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Image.file(File(filePath)),
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
                  onSaveButtonPress();
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

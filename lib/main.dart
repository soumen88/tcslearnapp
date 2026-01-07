import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcslearnapp/home/home_screen.dart';
import 'package:tcslearnapp/tododemo/task_notifier.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (BuildContext context) => TaskNotifier())
          ],
          child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen()
    );
  }

}

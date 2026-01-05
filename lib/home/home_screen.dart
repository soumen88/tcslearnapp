import 'package:flutter/material.dart';
import 'package:tcslearnapp/calculator/calculator_screen.dart';
import 'package:tcslearnapp/camerademo/camera_screen.dart';
import 'package:tcslearnapp/datastructures/data_structures_practice_screen.dart';
import 'package:tcslearnapp/lifecycle/counter_testing_screen.dart';
import 'package:tcslearnapp/lifecycle/life_cycle_screen.dart';
import 'package:tcslearnapp/lifecycle/parent_child_lifecycle_screen.dart';
import 'package:tcslearnapp/onboarding/login_screen.dart';
import 'package:tcslearnapp/pageviewdemo/list_view_demonstration_screen.dart';
import 'package:tcslearnapp/timer/timer_screen.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome To flutter"),
              Text("15th December, 2025"),
              ElevatedButton(
                  onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TimerScreen() ));
                  },
                  child: Text("Stopwatch app")
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DataStructuresPracticeScreen()));
                  },
                  child: Text("Data Structures")
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorScreen()));
                  },
                  child: Text("Start Calculator")
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text("Start Login Test")
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewDemonstrationScreen()));
                  },
                  child: Text("Start Listviews")
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LifeCycleScreen()));
                  },
                  child: Text("Lifecycle Example")
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ParentChildLifecycleScreen()));
                  },
                  child: Text("Parent child lifecycle example")
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen()));
                  },
                  child: Text("Start Camera ")
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CounterTestingScreen()));
                },
                child: Text("Widget Testing"),
              )
            ],
          ),
        )
      ),
    );
  }

}
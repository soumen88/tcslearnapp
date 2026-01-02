import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tcslearnapp/programmingbasics/internet_connectivity_mixin.dart';
import 'package:tcslearnapp/timer/timer_container.dart';

class TimerScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TimerScreenState();
  }

}

class TimerScreenState extends State<TimerScreen> with InternetConnectivityMixin{

  int secondsPassed  = 0;
  int displaySeconds = 0;
  int displayMins = 0;
  int displayHours = 0;
  Timer? _stopWatchTimer;
  bool _isTimerActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isInternetConnected ? Colors.green : Colors.deepOrangeAccent,
      appBar: AppBar(
        title: Text("Timer Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimerContainer(timerLabel: "Hours",timerValue: displayHours.toString(),),
                TimerContainer(timerLabel: "Mins",timerValue: displayMins.toString(),),
                TimerContainer(timerLabel: "Secs",timerValue: displaySeconds.toString(),),
              ],
            ),
            FilledButton(
                onPressed: (){
                  if(!_isTimerActive){
                    _isTimerActive = true;
                    _stopWatchTimer = Timer.periodic(Duration(seconds:  1), (value){
                      calculateTime();
                    });
                  }
                },
                child: Text("Start Timer")
            ),
            ElevatedButton(
                onPressed: (){
                  _stopWatchTimer?.cancel();
                  _isTimerActive = false;
                },
                child: Text("Stop Timer")
            ),
            FilledButton(
                onPressed: (){
                  _stopWatchTimer?.cancel();
                  _isTimerActive = false;
                  Navigator.pop(context);
                },
                child: Text("Go back")
            )
          ],
        ),
      ),
    );
  }

  void calculateTime(){
    secondsPassed = secondsPassed + 1;
    displaySeconds = secondsPassed % 60;
    displayMins = secondsPassed ~/ 60;
    displayHours = secondsPassed ~/ 3600;
    setState(() {

    });
  }

}
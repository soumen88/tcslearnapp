import 'package:flutter/material.dart';

class TimerContainer extends StatelessWidget{
  String timerLabel;
  String timerValue;

  TimerContainer({required this.timerLabel, required this.timerValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        children: [
          Text(
            timerValue,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
          Text(
            timerLabel,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),

        ],
      ),
    );
  }

}
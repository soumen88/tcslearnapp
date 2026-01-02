import 'package:flutter/material.dart';

class PageOne extends StatelessWidget{
  List<String> daysOfWeek = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page One"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: ListView.builder(
                    itemCount: daysOfWeek.length,
                    itemBuilder: (BuildContext context, int index){
                      return ListTile(
                        leading: Icon(Icons.eighteen_mp),
                        title: Text(daysOfWeek[index]),
                        trailing: Icon(Icons.fax_rounded),
                      );
                    }
                ),
            ),
        )
      ),
    );
  }

}
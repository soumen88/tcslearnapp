import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget{
  List<String> toDoList = [
    "Training participants in TCS",
    "Resolving iOS app issues",
    "Going to market for groceries",
    "Cleaning up living room",
  ];
  @override
  Widget build(BuildContext contextReceived) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Two"),
        backgroundColor: Colors.deepOrange,
      ),
      //backgroundColor: Colors.amber,
      body: Center(
        child: ListView(
          children: ListTile.divideTiles(
              context: contextReceived,
              tiles: [
                ListTile(
                  leading: Icon(Icons.twenty_four_mp_outlined),
                  title: Text(toDoList[0]),
                ),
                ListTile(
                  trailing: Icon(Icons.two_mp_sharp),
                  title: Text(toDoList[1]),
                ),
                ListTile(
                  trailing: Icon(Icons.two_mp_sharp),
                  title: Text(toDoList[2]),
                ),
                ListTile(
                  trailing: Icon(Icons.two_mp_sharp),
                  title: Text(toDoList[3]),
                )
              ]
          ).toList(),
        ),
      ),
    );
  }

}
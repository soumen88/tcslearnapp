import 'package:flutter/material.dart';
import 'package:tcslearnapp/lifecycle/life_cycle_next_screen.dart';

class LifeCycleScreen extends StatefulWidget{
  @override
  State<LifeCycleScreen> createState(){
    print("Inside create state function");
    return _LifeCycleScreenState();
  }
}

class _LifeCycleScreenState extends State<LifeCycleScreen> {

  int counter = 0;
  int atulCounter = 10;
  int sunilCounter = 199;

  _LifeCycleScreenState(){
    print("Inside constructor for lifecycle screen mounted: $mounted");
  }

  @override
  void initState() {
    print("Inside init state function mounted: $mounted");
    super.initState();
  }

  @override
  void setState(VoidCallback function){
    print("Widget has run set state");
    super.setState(function);
  }

  @override
  Widget build(BuildContext context) {
    print("Inside build function");
    return Scaffold(
      appBar: AppBar(
        title: Text("Life cycle screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Inside life cycle screen at 9:40"),
            Text(
                "Regular $counter",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
                "Atul $atulCounter",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              "Sunil $sunilCounter",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  counter = 10;
                },
                child: Text("Set Fixed Counter Value")
            ),
            FilledButton(
                onPressed: (){
                  atulCounter++;
                  sunilCounter = atulCounter + 1;
                  setState((){

                  });
                },
                child: Text("Change Atul counter")
            ),
            FilledButton(
                onPressed: (){
                  sunilCounter--;
                  setState((){

                  });
                },
                child: Text("Change Sunil counter")
            ),
            FilledButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LifeCycleNextScreen()));
                },
                child: Text("Start Next Screen")
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            counter++;
            setState(() {

            });
          }
      ),
    );
  }

  @override
  void reassemble() {
    print("Widget is reassembled mounted : $mounted");
    super.reassemble();
  }

  @override
  void didChangeDependencies() {
    print("Inside did change dependencies mounted: $mounted");
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    print("Widget got deactivated");
    super.deactivate();
  }

  @override
  void dispose() {
    print("Widget got removed and now eligible for garbage collection");
    super.dispose();
  }
}
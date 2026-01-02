import 'package:flutter/material.dart';
import 'package:tcslearnapp/lifecycle/child_widget.dart';

class ParentChildLifecycleScreen extends StatefulWidget {
  const ParentChildLifecycleScreen({super.key});

  @override
  State<ParentChildLifecycleScreen> createState(){
    print("Inside create state function");
    return _ParentChildLifecycleScreenState();
  }
}

class _ParentChildLifecycleScreenState extends State<ParentChildLifecycleScreen> {

  int _counter = 0;
  String displayText = "Hello This is a child widget";

  _ParentChildLifecycleScreenState(){
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
        title: Text("Parent-Child Life cycle"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Inside parent child life cycle screen"),
            Text(
              "Regular $_counter",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const ChildWidget(textToDisplay: "Hello This is a child widget")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            _counter++;
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

import 'package:flutter/material.dart';
import 'package:tcslearnapp/lifecycle/counter.dart';

class CounterTestingScreen extends StatefulWidget {
  const CounterTestingScreen({super.key});

  @override
  State<CounterTestingScreen> createState() => _CounterTestingScreenState();
}

class _CounterTestingScreenState extends State<CounterTestingScreen> {
  int _counter = 0;
  final Counter _counterObj = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter testing screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Counter: $_counter",
                style: TextStyle(
                  fontSize: 30
                ),
            ),
            Row(
              children: [
                ElevatedButton(
                    key: Key("Increment Key"),
                    onPressed: (){
                        _counter = _counterObj.increment();
                        setState(() {

                        });
                    },
                    child: Text("Increment")
                ),
                ElevatedButton(
                    key: Key("Increment by 2 Key"),
                    onPressed: (){
                      _counter = _counterObj.incrementBy2();
                      setState(() {

                      });
                    },
                    child: Text("Increment by 2")
                ),
                ElevatedButton(
                    key: Key("Decrement Key"),
                    onPressed: (){
                      _counter = _counterObj.decrement();
                      setState(() {

                      });
                    },
                    child: Text("Decrement")
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                onPressed: (){
                  _counter = _counterObj.increment();
                  setState(() {

                  });
                },
                tooltip: "IncrementButton",
                child: Icon(Icons.add),
            ),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: (){
                _counter = _counterObj.reset();
                setState(() {

                });
              },
              tooltip: "RestoreButton",
              child: Icon(Icons.restore),
            ),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: (){
                _counter = _counterObj.decrement();
                setState(() {

                });
              },
              tooltip: "DecrementButton",
              child: Icon(Icons.exposure_minus_1),
            )
          ],
        ),
      ),
    );
  }
}

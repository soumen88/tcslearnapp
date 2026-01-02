import 'package:flutter/material.dart';
import 'package:tcslearnapp/pageviewdemo/page_one.dart';
import 'package:tcslearnapp/pageviewdemo/page_three.dart';
import 'package:tcslearnapp/pageviewdemo/page_two.dart';

class ListViewDemonstrationScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          children: [
            PageOne(),
            PageTwo(),
            PageThree()
          ],
        )
      ),
    );
  }

}
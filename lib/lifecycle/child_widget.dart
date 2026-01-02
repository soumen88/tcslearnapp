import 'package:flutter/material.dart';

class ChildWidget extends StatefulWidget {
  final String textToDisplay;
  const ChildWidget({required this.textToDisplay, super.key});

  @override
  State<ChildWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {

  int childCounter = 199;

  @override
  void initState() {
    print("Inside init state function of child widget");
    super.initState();
  }

  @override
  void setState(VoidCallback function){
    print("inside set state of child widget");
    super.setState(function);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            widget.textToDisplay,
            style: TextStyle(
              fontSize: 30
            ),
        ),
        Text(
          "Child Counter $childCounter",
          style: TextStyle(
              fontSize: 30
          ),
        ),
        FilledButton(
            onPressed: (){
              childCounter--;
              setState(() {

              });
            },
            child: Text("Change child counter")
        )
      ],
    );
  }

  @override
  void didUpdateWidget(covariant ChildWidget oldWidget) {
    print("Child widget got updated now");
    super.didUpdateWidget(oldWidget);
  }
}

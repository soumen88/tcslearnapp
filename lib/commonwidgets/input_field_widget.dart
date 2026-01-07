import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget{
  TextEditingController inputController;
  TextInputType inputType;
  InputFieldWidget({required this.inputController, this.inputType = TextInputType.number});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      keyboardType: inputType,
      decoration: InputDecoration(
        hint: Text("Enter a number"),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: Colors.blue,
                width: 2
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: Colors.black,
                width: 2
            )
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: Colors.red,
                width: 2
            )
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: Colors.amberAccent,
                width: 2
            )
        ),
      ),
      validator: (String? input){
        if(input != null && input.isNotEmpty){
          return null;
        }
        else{
          return "Invalid input";
        }
      },
    );
  }


}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcslearnapp/onboarding/field_validator.dart';

class CustomInputFieldWidget extends StatelessWidget{
  String displayHintText;
  TextEditingController inputController;
  TextInputType fieldInputType;
  final FieldValidator _fieldValidator = FieldValidator();
  CustomInputFieldWidget({required this.displayHintText, required this.inputController, required this.fieldInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      keyboardType: fieldInputType,
      obscureText: (fieldInputType == TextInputType.visiblePassword ) ? true : false,
      decoration: InputDecoration(
        hintText: displayHintText,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Colors.blue
            ),
            borderRadius: BorderRadius.circular(12)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Colors.grey
            ),
            borderRadius: BorderRadius.circular(12)
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Colors.red
            ),
            borderRadius: BorderRadius.circular(12)
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Colors.red
            ),
            borderRadius: BorderRadius.circular(12)
        ),
      ),
      validator: (String? value){
        if(fieldInputType  == TextInputType.visiblePassword){
          return _fieldValidator.validatePassword(value ?? '');
        }
        else if(fieldInputType == TextInputType.emailAddress){
          return _fieldValidator.validateEmail(value ?? '');
        }
        else{
          return _fieldValidator.validateNotEmpty(value ?? '');
        }
      },
    );
  }

}
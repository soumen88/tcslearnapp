import 'package:flutter_test/flutter_test.dart';
import 'package:tcslearnapp/onboarding/field_validator.dart';

void main(){
  test('validate email id', (){
    var testEmail = "abc@example.com";
    final FieldValidator fieldValidatorObj = FieldValidator();
    var valueReceived = fieldValidatorObj.validateEmail(testEmail);
    expect(valueReceived, null);
    //expect(valueReceived, "");
  });

  test('validate password field', (){
    var testPassword = "abcd1234";
    final FieldValidator fieldValidatorObj = FieldValidator();
    var valueReceived = fieldValidatorObj.validatePassword(testPassword);
    //expect(valueReceived, "More than 6 character are expected");
    expect(valueReceived, null);
  });
}
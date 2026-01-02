class FieldValidator {
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Enter Email';
    }

    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return 'Enter Valid Email';
    }
    return null;
  }

  String? validatePassword(String value){
    if(value.isEmpty){
      return "Invalid password";
    }
    else if(value.length <= 6){
      return "More than 6 character are expected";
    }
    else{
      return null;
    }
  }

  String? validateNotEmpty(String value){
    if(value.isEmpty){
      return "Invalid input";
    }
    else{
      return null;
    }
  }

}
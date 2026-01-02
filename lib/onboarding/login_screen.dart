import 'package:flutter/material.dart';
import 'package:tcslearnapp/onboarding/custom_input_field_widget.dart';
import 'package:tcslearnapp/onboarding/field_validator.dart';

class LoginScreen extends StatelessWidget{
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomInputFieldWidget(
                    displayHintText: "Enter Email",
                    inputController: emailController,
                    fieldInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                Focus(
                    onFocusChange: (bool hasFieldFocus){
                      if(hasFieldFocus){
                        _formKey.currentState!.validate();
                      }
                    },
                    child: CustomInputFieldWidget(
                      displayHintText: "Enter Password",
                      inputController: passwordController,
                      fieldInputType: TextInputType.visiblePassword,
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                CustomInputFieldWidget(
                  displayHintText: "Enter name",
                  inputController: nameController,
                  fieldInputType: TextInputType.name,
                ),
                SizedBox(
                  height: 20,
                ),
                FilledButton.icon(
                    onPressed: (){
                      if(_formKey.currentState != null && _formKey.currentState!.validate()){
                        print("Validations are successful, proceed with login");
                      }
                      else{
                        print("Validation failed");
                      }
                    },
                    label: Text("Login"),
                    icon: Icon(Icons.login),
                )
              ],
            )
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tcslearnapp/calculator/button_enums.dart';
import 'package:tcslearnapp/commonwidgets/input_field_widget.dart';
import 'package:tcslearnapp/calculator/calculator_operations.dart';
import 'package:tcslearnapp/programmingbasics/athlete.dart';
import 'package:tcslearnapp/programmingbasics/exercise.dart';
import 'package:tcslearnapp/programmingbasics/student.dart';

class CalculatorScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CalculatorScreenState();
  }

}

class _CalculatorScreenState extends State<CalculatorScreen>{
  final TextEditingController _numberOneController = TextEditingController();
  final TextEditingController _numberTwoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final CalculatorOperations _calculatorOperations = CalculatorOperations();
  double outputAnswer = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputFieldWidget( inputController: _numberOneController,),
                    SizedBox(
                      height: 20,
                    ),
                    InputFieldWidget(inputController: _numberTwoController,),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          "Answer = ${outputAnswer.toStringAsFixed(3)}",
                          style: TextStyle(
                            fontSize: 28
                          ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FilledButton(
                                onPressed: (){
                                    calculate(ButtonEnums.ADDITION_BUTTON);
                                },
                                child: Text("Add")
                            ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: FilledButton(
                              onPressed: (){
                                  calculate(ButtonEnums.SUBTRACTION_BUTTON);
                              },
                              child: Text("Subtract")
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FilledButton(
                                onPressed: (){
                                  calculate(ButtonEnums.MULTIPLY_BUTTON);
                                },
                                child: Text("Multiply")
                            ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: FilledButton(
                              onPressed: (){
                                calculate(ButtonEnums.DIVIDE_BUTTON);
                              },
                              child: Text("Divide")
                          ),
                        ),
                      ],
                    ),
                    FilledButton(
                        onPressed: (){
                          calculate(ButtonEnums.POWER_BUTTON);
                        },
                        child: Text("Power")
                    ),
                    FilledButton(
                        onPressed: (){
                          Student studentObject = Student(
                              personName: "Srinivasu",
                              age: 25,
                              academicName: "Computer science"
                          );
                          studentObject.displayDetails();
                          studentObject.printStudentDetails();
                          studentObject.performingPushups(12);

                          Athlete atheleteOne = Athlete(
                              personName: "Sandeep",
                              age: 34,
                              sportName: "Cricket"
                          );

                          atheleteOne.holdingABreath(45);
                        },
                        child: Text("Test inheritance")
                    )
                  ],
                ),
            )
        ),
      ),
    );
  }

  void calculate(ButtonEnums currentButtonEnum){
    if(_formKey.currentState != null && !_formKey.currentState!.validate()){
      ///If invalid input then do not go forward with calculation
      return;
    }
    double numberOne = double.parse(_numberOneController.text);
    double numberTwo = double.parse(_numberTwoController.text);
    switch(currentButtonEnum){
      case ButtonEnums.ADDITION_BUTTON:
        outputAnswer = _calculatorOperations.addNumbers(numberOne, numberTwo);
      case ButtonEnums.SUBTRACTION_BUTTON:
        outputAnswer = _calculatorOperations.subtractNumbers(numberOne, numberTwo);
      case ButtonEnums.MULTIPLY_BUTTON:
        outputAnswer = _calculatorOperations.multiplyNumbers(numberOne, numberTwo);
      case ButtonEnums.DIVIDE_BUTTON:
        outputAnswer = _calculatorOperations.divideNumbers(numberOne, numberTwo);
      case ButtonEnums.POWER_BUTTON:
        outputAnswer = _calculatorOperations.power(numberOne, numberTwo).toDouble();
    }

    setState(() {

    });
  }

}
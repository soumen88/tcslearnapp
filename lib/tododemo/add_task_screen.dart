import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcslearnapp/base/logger_utils.dart';
import 'package:tcslearnapp/commonwidgets/input_field_widget.dart';
import 'package:tcslearnapp/pageviewdemo/fake_product_model.dart';
import 'package:tcslearnapp/tododemo/task_notifier.dart';
import 'package:tcslearnapp/tododemo/to_do_model.dart';
import 'package:tcslearnapp/tododemo/to_do_updated_model.dart';

class AddTaskScreen extends StatefulWidget {

  final bool isTaskModified;
  final String? oldTaskDescription;

  AddTaskScreen({this.isTaskModified = false, this.oldTaskDescription});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController taskController = TextEditingController();
  final _logger = LoggerUtils();
  final _TAG = "AddTaskScreen";
  @override
  void initState() {
    if(widget.isTaskModified){
      taskController.text = widget.oldTaskDescription ?? '';
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add task Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Enter task description",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
            ),
            InputFieldWidget(
                inputController: taskController,
                inputType: TextInputType.text,
            ),
            Builder(
                builder: (BuildContext context){
                  if(widget.isTaskModified){
                    return FilledButton(
                        onPressed: (){
                          Provider.of<TaskNotifier>(context, listen: false).modifyATask(widget.oldTaskDescription ?? '',taskController.text);
                          Navigator.pop(context);
                        },
                        child: Text("Modify Task")
                    );
                  }
                  else{
                    return FilledButton(
                        onPressed: (){
                          Provider.of<TaskNotifier>(context, listen: false).addATask(taskController.text);
                          Navigator.pop(context);
                        },
                        child: Text("Add Task")
                    );
                  }
                }
            ),
            FilledButton(
                onPressed: (){
                  FakeProductModel fakeProductModel = FakeProductModel(
                      productImageUrl: "https://fastly.picsum.photos/id/7/4728/316812345.jpg?hmac=c5B5tfYFM9blHHMhuu4UKmhnbZoJqrzNOP9xjkV4w3o",
                      title: "Portrait",
                      actualPrice: 3000,
                      rating: 4.5,
                      discountedPrice: 2000
                  );
                  print("Fake product model before $fakeProductModel");

                  fakeProductModel.actualPrice = 3500;
                  print("Fake product model after $fakeProductModel");
                },
                child: Text("Dummy model")
            ),
            FilledButton(
                onPressed: (){
                  ToDoModel one = ToDoModel(
                    completed: false,
                    id: 123,
                    title: "Title for first model",
                    userId: 987
                  );
                  var jsonString = jsonEncode(one);
                  _logger.log(TAG: _TAG, message: "Todo model ${jsonString}");
                },
                child: Text("Serialization to json")
            ),
            FilledButton(
                onPressed: (){
                  var responseFromSever = '{"userId":1000,"id":123,"title":"Title for second model","completed":false}';
                  ToDoModel two = ToDoModel.fromJson(jsonDecode(responseFromSever));
                  _logger.log(TAG: _TAG, message: "After deserialization $two");
                  two.id = 456;
                  _logger.log(TAG: _TAG, message: "After deserialization $two");
                },
                child: Text("Deserialization of json")
            ),
            FilledButton(
                onPressed: (){
                  ToDoUpdatedModel toDo = ToDoUpdatedModel(
                      userId: 123,
                      id: 45,
                      title: "To do model",
                      completed: false,
                  );
                  _logger.log(TAG: _TAG, message: "To string $toDo");
                  _logger.log(TAG: _TAG, message: "To json ${toDo.toJson()}");
                  _logger.log(TAG: _TAG, message: "To do model hashcode ${toDo.hashCode}");

                  var updatedToDoModel = toDo.copyWith(
                    id: 567
                  );
                  _logger.log(TAG: _TAG, message: "Updated to do model hashcode ${updatedToDoModel.hashCode}");
                },
                child: Text("Freezed serialization")
            )
          ],
        ),
      ),
    );
  }
}

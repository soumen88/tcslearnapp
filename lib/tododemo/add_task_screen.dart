import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcslearnapp/commonwidgets/input_field_widget.dart';
import 'package:tcslearnapp/tododemo/task_notifier.dart';

class AddTaskScreen extends StatefulWidget {

  final bool isTaskModified;
  final String? oldTaskDescription;

  AddTaskScreen({this.isTaskModified = false, this.oldTaskDescription});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController taskController = TextEditingController();

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
            )

          ],
        ),
      ),
    );
  }
}

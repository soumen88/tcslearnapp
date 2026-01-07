import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcslearnapp/tododemo/add_task_screen.dart';
import 'package:tcslearnapp/tododemo/task_notifier.dart';

///This class is a obedient student that would follow all the commands from teacher
class DisplayTaskListScreen extends StatelessWidget {
  const DisplayTaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task List Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Consumer<TaskNotifier>(
          builder: (BuildContext context, TaskNotifier taskNotifier, Widget? child){
            int pendingTaskCount = taskNotifier.getAllTasksCount();
            if(pendingTaskCount == 0){
              return Center(
                child: Text(
                    "You don't have any tasks pending for today!",
                    style: TextStyle(
                      fontSize: 20
                    ),
                ),
              );
            }
            else{
              List<String> pendingTaskList = taskNotifier.getAllTasks();
              return Column(
                children: [
                  Text(
                    "Found $pendingTaskCount pending for today!",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: pendingTaskList.length,
                        itemBuilder: (BuildContext context, int index){
                          String taskName = pendingTaskList[index];
                          return SizedBox(
                            height: 160,
                            child: Card(
                              margin: EdgeInsets.all(10),
                              child: ListTile(
                                title: Text(
                                  taskName,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                trailing: Column(
                                  children: [
                                    IconButton(
                                        onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context) => AddTaskScreen(
                                                  isTaskModified: true,
                                                  oldTaskDescription: taskName,
                                                )
                                            )
                                            );
                                        },
                                        icon: Icon(Icons.edit)
                                    ),
                                    IconButton(
                                        onPressed: (){
                                          Provider.of<TaskNotifier>(context, listen: false).deleteATask(index);
                                        },
                                        icon: Icon(Icons.delete)
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  )
                ],
              );
            }
          }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskScreen()));
          },
          child: Icon(Icons.plus_one_outlined),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tcslearnapp/base/logger_utils.dart';

///This class is a diligent teacher who would be keeping track of tasks
class TaskNotifier extends ChangeNotifier{

  final _logger = LoggerUtils();
  final _TAG = "TaskNotifier";
  List<String> _tasksList = [];
  int _taskCount = 0;

  void addATask(String taskDescription){
    _logger.log(TAG: _TAG, message: "Add $taskDescription to the list of tasks");
    _tasksList.add(taskDescription);
    _taskCount++;
    notifyListeners();
  }

  void deleteATask(int index){
    _logger.log(TAG: _TAG, message: "Deleting taskDescription from index");
    _tasksList.removeAt(index);
    _taskCount--;
    notifyListeners();
  }

  void modifyATask(String oldTaskDescription, String newTaskDescription){
    int indexOfItem = _tasksList.indexOf(oldTaskDescription);
    if(indexOfItem != -1){
      _tasksList.removeAt(indexOfItem);
      _tasksList.insert(indexOfItem, newTaskDescription);
      notifyListeners();
    }
  }

  int getAllTasksCount(){
    return _taskCount;
  }

  List<String> getAllTasks(){
    return _tasksList;
  }
}
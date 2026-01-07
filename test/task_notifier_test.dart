import 'package:flutter_test/flutter_test.dart';
import 'package:tcslearnapp/base/logger_utils.dart';
import 'package:tcslearnapp/tododemo/task_notifier.dart';

void main(){
  final _logger = LoggerUtils();
  final _TAG = "TaskNotifierTest";
  group("Check Task Notifier", (){

      test("Check Task Count", (){
        var taskNotifier = TaskNotifier();
        taskNotifier.addATask("First Task");
        taskNotifier.addATask("Second Task");
        expect(taskNotifier.getAllTasksCount(), 2);
      });

      test("Listen to task updates", (){
        var taskNotifier = TaskNotifier();
        bool isNotified = false;
        taskNotifier.addListener((){
          _logger.log(TAG: _TAG, message: "Setting up a listener for tasks");
          isNotified = true;
        });
        _logger.log(TAG: _TAG, message: "Adding a item in task");
        taskNotifier.addATask("Task One");
        expectLater(isNotified, true);
      });

  });
}
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_hivedb_app/model/tasks_model.dart';

class HiveDataStore {
  static const boxName = "tasksBox";

  // Get reference to an already opened box
  static Box<TasksModel> box = Hive.box<TasksModel>(boxName);

  // add new task to the list
  Future<void> addTask({required TasksModel tasksModel}) async {
    await box.add(tasksModel);
  }

  // show tasks list
  Future<void> getTask({required int index, required TasksModel taskModel}) async {
    box.putAt(index, taskModel);
  }

  // delete task
  Future<void> deleteTask({required int index}) async {
    await box.deleteAt(index);
  }
}

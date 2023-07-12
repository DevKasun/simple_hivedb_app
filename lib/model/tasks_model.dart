import 'package:hive/hive.dart';

part 'tasks_model.g.dart';

@HiveType(typeId: 0)
class TasksModel extends HiveObject {
  @HiveField(0)
  final String task;

  TasksModel({
    required this.task,
  });
}

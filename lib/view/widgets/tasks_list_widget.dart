import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_hivedb_app/data_store/data_store.dart';
import 'package:simple_hivedb_app/model/tasks_model.dart';

class TasksListWidget extends StatefulWidget {
  const TasksListWidget({super.key});

  @override
  State<TasksListWidget> createState() => _TasksListWidgetState();
}

class _TasksListWidgetState extends State<TasksListWidget> {
  HiveDataStore _dataStore = HiveDataStore();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<TasksModel>(HiveDataStore.boxName).listenable(),
      builder: (context, Box<TasksModel> box, _) {
        final List<TasksModel> tasks = box.values.toList().cast<TasksModel>();
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              Color itemBgColor = index % 2 == 0
                  ? const Color(0xFF00A896)
                  : const Color(0xFF02C39A);
              return Slidable(
                endActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) => {
                        _dataStore.deleteTask(index: index),
                      },
                      backgroundColor: Colors.red.shade400,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: itemBgColor,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 10,
                        fit: FlexFit.tight,
                        child: Text(
                          tasks[index].task,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Flexible(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.drag_indicator_rounded,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

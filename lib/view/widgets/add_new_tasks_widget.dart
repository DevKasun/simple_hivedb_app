import 'package:flutter/material.dart';
import 'package:simple_hivedb_app/data_store/data_store.dart';
import 'package:simple_hivedb_app/model/tasks_model.dart';

class AddNewTasksWidget extends StatefulWidget {
  const AddNewTasksWidget({super.key});

  @override
  State<AddNewTasksWidget> createState() => _AddNewTasksWidgetState();
}

class _AddNewTasksWidgetState extends State<AddNewTasksWidget> {
  final TextEditingController _controller = TextEditingController();
  final HiveDataStore _hiveDataStore = HiveDataStore();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xFF02C39A),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xFF028090),
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    label: Text(
                      "Enter your task",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF028090),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _addNewTask,
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(50),
                  backgroundColor: Color(0xFF028090),
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Add new task',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _addNewTask() async {
    final String task = _controller.text;
    final TasksModel tasksModel = TasksModel(task: task);
    await _hiveDataStore.addTask(tasksModel: tasksModel);
    _controller.clear();
  }
}

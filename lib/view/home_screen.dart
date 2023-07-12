import 'package:flutter/material.dart';
import 'package:simple_hivedb_app/view/widgets/add_new_tasks_widget.dart';
import 'package:simple_hivedb_app/view/widgets/tasks_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F3BD),
      appBar: AppBar(
        title: const Text(
          "Daily Tasks",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF028090),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: const Column(
          children: [
            AddNewTasksWidget(),
            Expanded(child: TasksListWidget()),
          ],
        ),
      ),
    );
  }
}

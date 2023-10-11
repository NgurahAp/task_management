import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/components/profile_sheet.dart';
import 'package:task_management/models/db_manager.dart';
import 'package:task_management/screens/empty_task_screen.dart';
import 'package:task_management/screens/task_item_screen.dart';
import 'package:task_management/screens/task_list_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task Management',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (context) => const ProfileSheet(),
              );
            },
            icon: const Icon(Icons.account_circle),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskItemScreen(),
            ),
          );
        },
      ),
      body: buildTaskScreen(),
    );
  }

  Widget buildTaskScreen() {
    return Consumer<DbManager>(builder: (context, manager, child) {
      if (manager.taskModels.isNotEmpty) {
        return TaskListScreen(
          manager: manager,
        );
      } else {
        return const EmptyTaskScreen();
      }
    });
  }
}

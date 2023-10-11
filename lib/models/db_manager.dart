import 'package:flutter/foundation.dart';
import 'package:task_management/helper/database_helper.dart';
import 'package:task_management/models/task_model.dart';

class DbManager extends ChangeNotifier {
  List<TaskModel> _taskModels = [];
  late DatabaseHelper _dbHelper;

  List<TaskModel> get taskModels => _taskModels;

  DbManager() {
    _dbHelper = DatabaseHelper();
    _getAllTask();
  }

  void _getAllTask() async {
    _taskModels = await _dbHelper.getTask();
    notifyListeners();
  }

  Future<void> addTask(TaskModel taskModel) async {
    await _dbHelper.insertTask(taskModel);
    _getAllTask();
  }

  Future<TaskModel> getTaskById(int id) async {
    return await _dbHelper.getTaskById(id);
  }

  void updateTask(TaskModel taskModel) async {
    await _dbHelper.updateTask(taskModel);
  }

  void deleteTask(int id) async {
    await _dbHelper.deleteTask(id);
    _getAllTask();
  }
}

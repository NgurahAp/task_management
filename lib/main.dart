import 'package:flutter/material.dart';
import 'package:task_management/models/db_manager.dart';
import 'package:task_management/screens/login_screen.dart';
import 'package:task_management/screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DbManager(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Management',
        theme: ThemeData(fontFamily: 'poppins'),
        routes: {
          '/': (context) => const LoginScreen(),
          '/taskscreen': (context) => const TaskScreen(),
        },
      ),
    );
  }
}

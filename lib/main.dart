import 'package:flutter/material.dart';
import 'views/home_screen.dart';
import 'views/task_list_screen.dart';
import 'views/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Tarefas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaLogin(),
        '/tasks': (context) => const TaskListScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}

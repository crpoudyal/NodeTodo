import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodetodo/bloc/todo_bloc.dart';
import 'package:nodetodo/repository/todo_repository.dart';
import 'package:nodetodo/screens/home_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<TodoBloc>(
          create: (context) => TodoBloc(TodoRepo())..add(GetTodosEvent()))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Node Todo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodetodo/bloc/todo_bloc.dart';
import 'package:nodetodo/model/todo_model.dart';
import 'package:nodetodo/repository/todo_repository.dart';
import 'package:nodetodo/widgets/textfield_widget.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  TodoRepo todoRepo = TodoRepo();
  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextfieldWidget(
              controller: title, hintText: "Enter Title", labelText: "Title"),
          const SizedBox(height: 20),
          TextfieldWidget(
              controller: content,
              hintText: "Enter Content..",
              labelText: "Content"),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                context.read<TodoBloc>().add(
                      CreateTodoEvent(
                          todos: TodoModel(
                              id: '',
                              title: title.text,
                              content: content.text,
                              isComplete: false)),
                    );
              },  
              child: const Text("Save"))
        ],
      ),
    );
  }
}

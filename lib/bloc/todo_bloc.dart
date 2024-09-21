import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodetodo/model/todo_model.dart';
import 'package:nodetodo/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepo todoRepo;

  TodoBloc(this.todoRepo) : super(TodoInitial()) {
    on<GetTodosEvent>((event, emit) async {
      emit(TodoLoadingState());
      try {
        final todoList = await todoRepo.getTodosList();
        emit(TodoLoadedState(todos: todoList));
      } catch (e) {
        emit(TodoErrorState(message: e.toString()));
      }
    });

    on<CreateTodoEvent>((event, emit) async {
      emit(TodoLoadingState());
      try {
        await todoRepo.createTodos(event.todos);
        emit(TodoAdded());
      } catch (e) {
        emit(TodoErrorState(message: e.toString()));
      }
    });
  }
}

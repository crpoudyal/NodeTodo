part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class TodoLoadingState extends TodoState {}

final class TodoLoadedState extends TodoState {
  final List<TodoModel> todos;

  TodoLoadedState({required this.todos});
}

final class TodoErrorState extends TodoState {
  final String message;

  TodoErrorState({required this.message});
}

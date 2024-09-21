part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class GetTodosEvent extends TodoEvent {}

class CreateTodoEvent extends TodoEvent {
  final TodoModel todos;

  CreateTodoEvent({required this.todos});
}

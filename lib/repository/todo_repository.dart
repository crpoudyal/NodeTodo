import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nodetodo/model/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> getTodosList();
  Future<TodoModel> postTodosList(TodoModel todos);
  Future<TodoModel> updateTodosList(TodoModel todos);
  Future<void> deleteTodosList(String todoId);
}

class TodoRepo extends TodoRepository {
  final Dio dio = Dio();
  final String baseUrl = 'http://localhost:3000';

  @override
  Future<List<TodoModel>> getTodosList() async {
    try {
      final response = await dio.get('$baseUrl/api/todos');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        return responseData.map((json) => TodoModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch todos');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
      rethrow;
    }
  }

  @override
  Future<TodoModel> postTodosList(TodoModel todos) async {}

  @override
  Future<TodoModel> updateTodosList(TodoModel todos) async {}

  @override
  Future<void> deleteTodosList(String todoId) async {}
}

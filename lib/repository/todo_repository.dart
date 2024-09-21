import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:nodetodo/model/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> getTodosList();
  Future<void> createTodos(TodoModel todos);
  Future<void> updateTodos(TodoModel todos, String id);
  Future<void> deleteTodosList(String id);
}

class TodoRepo extends TodoRepository {
  final Dio dio = Dio();
  final String baseUrl = 'http://localhost:3000/api/todos';

  @override
  Future<List<TodoModel>> getTodosList() async {
    try {
      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        // Directly use response.data as Dio already decodes the response
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
  Future<void> createTodos(TodoModel todos) async {
    try {
      final response = await dio.post(
        baseUrl,
        options: Options(
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
        ),
        data: todos.toJson(),
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to create todos');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error creating data: $e');
      }
      rethrow;
    }
  }

  @override
  Future<void> updateTodos(TodoModel todos, String id) async {
    try {
      final response = await dio.put('$baseUrl/$id',
          options: Options(
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
          ),
          data: todos.toJson());
      if (response.statusCode != 200) {
        throw Exception('Failed to update todos');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating data: $e');
      }
      rethrow;
    }
  }

  @override
  Future<void> deleteTodosList(String id) async {
    try {
      final response = await dio.delete('$baseUrl/$id');
      if (response.statusCode != 200) {
        throw Exception('Failed to delete todo');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting data: $e');
      }
      rethrow;
    }
  }
}

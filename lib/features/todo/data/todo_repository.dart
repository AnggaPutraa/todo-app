import './model/todo.dart';
import './model/database.dart';

class TodoRepository {
  final DatabaseConnection _database = DatabaseConnection();

  Future<List<Todo>> fetchTodos() async {
    final result = await _database.getTodos();
    return result;
  }
  
  void addTodo(Todo todo) async {
    _database.addTodo(todo);
  }
  
  void deleteTodo(Todo todo) async {
    _database.deleteTodo(todo);
  }  
}
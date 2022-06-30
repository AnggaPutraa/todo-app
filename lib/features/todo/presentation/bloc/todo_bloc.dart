import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/todo_repository.dart';
import '../../data/model/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository = TodoRepository();

  TodoBloc() : super(TodoInitialState()) {
    on<TodoLoadedEvent>((event, emit) async {
      final todos =  await _repository.fetchTodos();
      emit(TodoLoadedState(
        todos: todos
      ));
    });

    on<TodoAddEvent>((event, emit) async {
      if (state is TodoLoadedState) {
        _repository.addTodo(event.todo);
        final todos =  await _repository.fetchTodos(); 
        emit(TodoLoadedState(
          todos: todos
        ));
      }
    });

    on<TodoDeleteEvent>((event, emit) async {
      if (state is TodoLoadedState) {
        _repository.deleteTodo(event.todo);
        final todos =  await _repository.fetchTodos();
        emit(TodoLoadedState(
          todos: todos
        ));
      }
    });

    on<TodoToggleEvent>((event, emit) async {
      if (state is TodoLoadedState) {
        _repository.addTodo(event.todo);
        final todos =  await _repository.fetchTodos();
        emit(TodoLoadedState(
          todos: todos
        ));
      }
    });
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/todo_repository.dart';
import '../../data/model/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository = TodoRepository();

  TodoBloc() : super(TodoInitialState()) {
    on<TodoLoadedEvent>(_loadTodos);
    on<TodoAddEvent>(_addTodo);
    on<TodoDeleteEvent>(_deleteTodo);
    on<TodoToggleEvent>(_toggleTodo);
  }

  FutureOr<void> _loadTodos(
    TodoLoadedEvent event,
    Emitter<TodoState> emit,
  ) async {
    try {
      emit(TodoLoadingState());
      final todos = await _repository.fetchTodos();
      emit(TodoLoadedState(todos: todos));
    } catch (e) {
      emit(TodoErrorState());
    }
  }

  FutureOr<void> _addTodo(
    TodoAddEvent event,
    Emitter<TodoState> emit,
  ) async {
    if (state is TodoLoadedState) {
      try {
        emit(TodoLoadingState());
        _repository.addTodo(event.todo);
        final todos = await _repository.fetchTodos();
        emit(TodoLoadedState(todos: todos));
      } catch (e) {
        emit(TodoErrorState());
      }
    }
  }

  FutureOr<void> _deleteTodo(
    TodoDeleteEvent event,
    Emitter<TodoState> emit,
  ) async {
    if (state is TodoLoadedState) {
      try {
        emit(TodoLoadingState());
        _repository.deleteTodo(event.todo);
        final todos = await _repository.fetchTodos();
        emit(TodoLoadedState(todos: todos));
      } catch (e) {
        emit(TodoErrorState());
      }
    }
  }

  FutureOr<void> _toggleTodo(
    TodoToggleEvent event,
    Emitter<TodoState> emit,
  ) async {
    if (state is TodoLoadedState) {
      try {
        _repository.addTodo(event.todo);
        final todos = await _repository.fetchTodos();
        emit(TodoLoadedState(todos: todos));
      } catch (e) {
        emit(TodoErrorState());
      }
    }
  }
}

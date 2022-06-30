part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
  @override
  List<Object> get props => [];
}

class TodoInitialState extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoadingState extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoadedState extends TodoState {
  final List<Todo> todos;
  const TodoLoadedState({required this.todos});
  @override
  List<Object> get props => [todos];
}

class TodoErrorState extends TodoState {
  @override
  List<Object> get props => [];
}

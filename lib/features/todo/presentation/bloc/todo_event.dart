part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object> get props => [];
}

class TodoLoadedEvent extends TodoEvent {
  @override
  List<Object> get props => [];
}

class TodoAddEvent extends TodoEvent {
  final Todo todo;
  const TodoAddEvent({required this.todo});
  @override
  List<Object> get props => [todo];
}

class TodoDeleteEvent extends TodoEvent {
  final Todo todo;
  const TodoDeleteEvent({required this.todo});
  @override
  List<Object> get props => [todo];
}

class TodoToggleEvent extends TodoEvent {
  final Todo todo;
  const TodoToggleEvent({required this.todo});
  @override
  List<Object> get props => [todo];  
}
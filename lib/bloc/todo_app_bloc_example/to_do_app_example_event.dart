part of 'to_do_app_example_bloc.dart';

abstract class ToDoEvent extends Equatable{
  const ToDoEvent();
  }

class TodoAddEvent extends ToDoEvent{
  // final String? task;
  const TodoAddEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class TodoDeleteEvent extends ToDoEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TodoCountEvent extends ToDoEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
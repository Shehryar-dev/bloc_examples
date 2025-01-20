import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'to_do_app_example_event.dart';
part 'to_do_app_example_state.dart';

class ToDoAppBloc extends Bloc<ToDoEvent, ToDoAppState> {
  final List<String> todoList = [];
  ToDoAppBloc() : super(const ToDoAppState()) {
     on<TodoCountEvent>(_addDataEvent);
     on<TodoDeleteEvent>(_removedDataEvent);
  }

  void _addDataEvent(TodoCountEvent event, Emitter<ToDoAppState> emit){
    todoList.add(state.count.toString());
    emit(state.copyWith(c: state.count + 1,list: List.from(todoList)));
  }


  void _removedDataEvent(TodoDeleteEvent event, Emitter<ToDoAppState> emit){
    state.list.removeAt(state.count);
    todoList.removeAt(state.count);
    emit(state.copyWith());
  }
}

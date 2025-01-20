import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_example_event.dart';
part 'todo_example_state.dart';

class TodoExampleBloc extends Bloc<TodoEvent, TodoExampleState> {
  final List<String> todoList = [];
  TodoExampleBloc() : super(const TodoExampleState()) {
    on<TodoInsertEvent>(_insertRecord);
    on<TodoRemoveEvent>(_removeRecord);
  }

  void _insertRecord(TodoInsertEvent event, Emitter<TodoExampleState> emit){
    todoList.add((state.count).toString());
    emit(state.copyWith(list: List.from(todoList),c: state.count + 1));
  }

  void _removeRecord(TodoRemoveEvent event, Emitter<TodoExampleState> emit){
    todoList.remove(event.task);
    emit(state.copyWith(list: List.from(todoList),));
  }
}

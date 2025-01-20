part of 'todo_example_bloc.dart';


abstract class TodoEvent extends Equatable{
   const TodoEvent();
}



class TodoInsertEvent extends TodoEvent{
// final String task;

 // const TodoInsertEvent({,});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class TodoRemoveEvent extends  TodoEvent{
  final Object task;
  TodoRemoveEvent({required this.task});
  @override
  // TODO: implement props
  List<Object?> get props => [task];
}

class TodoCountEvent extends  TodoEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

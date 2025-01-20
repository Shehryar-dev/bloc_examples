part of 'todo_example_bloc.dart';


class TodoExampleState extends Equatable {
  final List<String>? list;
  final int count;
  const TodoExampleState({this.list = const [], this.count = 1});


  TodoExampleState copyWith({List<String>? list, int? c}){
    return TodoExampleState(
        list: list ?? this.list,
        count: c ?? count    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [list, count];
}
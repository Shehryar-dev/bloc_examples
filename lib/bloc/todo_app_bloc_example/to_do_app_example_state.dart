part of 'to_do_app_example_bloc.dart';

class ToDoAppState  extends Equatable{
  final List<String> list;
  final int count;

  const ToDoAppState({this.list =const [], this.count = 1});


  ToDoAppState copyWith({List<String>? list, int? c}){
    return ToDoAppState(
      list: list ?? this.list,
      count: c ?? count
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [list, count];
}
import 'package:bloc_example/bloc/todo_app_bloc_example/to_do_app_example_bloc.dart';
import 'package:bloc_example/bloc/todo_example/todo_example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoExample extends StatelessWidget {
  const TodoExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example #5 Todo \nInsert Delete',textAlign: TextAlign.center,),
        centerTitle: true,
        shape: const StadiumBorder(),
      ),

      body: Padding(padding:const EdgeInsets.all(16),
        child: BlocBuilder<TodoExampleBloc, TodoExampleState>(
          builder: (context, state){
            if(state.list!.isEmpty){
              return const Center(child: Text('No Data Found'),);
            }else if(state.list!.isNotEmpty){
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, ind) {
                    return ListTile(
                      title: Text('task: ${state.list![ind]}'),
                      trailing: IconButton(onPressed: (){
                         context.read<TodoExampleBloc>().add(TodoRemoveEvent(task: state.list![ind].toString()));
                        }, icon:const Icon(Icons.delete)),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const Divider();
                  },
                  itemCount: state.list!.length);
            }else{
              return const Center(child:  CircularProgressIndicator(color: Colors.white,));
            }
          },
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodoExampleBloc>().add(TodoInsertEvent());
        }, child: const Icon(Icons.add),),
    );
  }
}

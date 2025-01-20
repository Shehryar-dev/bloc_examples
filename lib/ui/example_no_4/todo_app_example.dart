import 'package:bloc_example/bloc/todo_app_bloc_example/to_do_app_example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoAppExample extends StatelessWidget {
  const TodoAppExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example #4'),
        centerTitle: true,
        shape: const StadiumBorder(),
      ),

      body: Padding(padding: EdgeInsets.all(16),
        child: BlocBuilder<ToDoAppBloc, ToDoAppState>(
          builder: (context, state){
            if(state.list.isEmpty){
              return const Center(child: Text('No Data Found'),);
            }else if(state.list.isNotEmpty){
              return ListView.separated(

                  shrinkWrap: true,
                  itemBuilder: (context, ind) {
                    return ListTile(
                      title: Text(state.list[ind].toString()),
                      trailing: IconButton(onPressed: (){
                        state.list.remove(state.list[ind].toString());
                        context.read<ToDoAppBloc>().add(TodoDeleteEvent()); }, icon:const Icon(Icons.delete)),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const Divider();
                  },
                  itemCount: state.list.length);
            }else{
              return const Center(child:  CircularProgressIndicator(color: Colors.white,));
            }
          },
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {

            context.read<ToDoAppBloc>().add(TodoCountEvent());

        }, child: const Icon(Icons.add),),
    );
  }
}


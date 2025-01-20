import 'package:bloc_example/bloc/wishlist_app/wishlist_app_bloc.dart';
import 'package:bloc_example/model/wishlist_model/wishlist_model.dart';
import 'package:bloc_example/utils/wishlist_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WishlistAppBloc>().add(FetchWishlist());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Wishlist App'),
        actions: [
          BlocBuilder<WishlistAppBloc, WishlistAppState>(
  builder: (context, state) {
    return Visibility(
      visible: state.tempList.isNotEmpty ? true : false,
      child: IconButton(onPressed: (){
              context.read<WishlistAppBloc>().add(DeleteItem());
            }, icon:const Icon(Icons.delete)),
    );
  },
)
        ],
      ),
      body: BlocBuilder<WishlistAppBloc, WishlistAppState>(
          builder: (context, state){
            switch(state.status){
              case  WishlistStatus.loading :
                return const Center(child: CircularProgressIndicator(),);
              case  WishlistStatus.success :
                return ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: (context, index){
                  final item = state.list[index];
                      return Card(
                    child: ListTile(
                      leading: Checkbox(value: state.tempList.contains(item)? true : false,
                          onChanged: (value){
                        if(value!){
                          context.read<WishlistAppBloc>().add(SelectedItems(list: item));
                        }else{
                          context.read<WishlistAppBloc>().add(UnSelectedItems(list: item));
                        }
                          }),
                      title: Text('${item.value.toString()}'),
                      trailing: IconButton(onPressed: (){
                        WishlistModel itemModel = WishlistModel(id: item.id,value: item.value, isFavourite: item.isFavourite ? false : true);
                        context.read<WishlistAppBloc>().add(WishlistItems(list: itemModel));
                      },icon: Icon(item.isFavourite ? Icons.favorite :Icons.favorite_outline)),
                    ),
                  );
                });
              case  WishlistStatus.failure :
                return const Center(child: Text('No Data'),);
            }
          } ),
    );
  }
}

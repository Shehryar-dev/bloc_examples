import 'package:bloc/bloc.dart';
import 'package:bloc_example/model/wishlist_model/wishlist_model.dart';
import 'package:bloc_example/repository/wishlist_repository/wishlist_repository.dart';
import 'package:bloc_example/utils/wishlist_status.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_app_event.dart';
part 'wishlist_app_state.dart';

class WishlistAppBloc extends Bloc<WishlistAppEvent, WishlistAppState> {
  WishlistRepository wishlistRepository;
  List<WishlistModel> list = [];
  List<WishlistModel> tempList = [];

  WishlistAppBloc(this.wishlistRepository) : super(WishlistAppState()) {
    on<FetchWishlist>(_fetchList);
    on<WishlistItems>(_wishListItems);
    on<SelectedItems>(_selectedList);
    on<UnSelectedItems>(_unSelectedItems);
    on<DeleteItem>(_deletedItems);
  }

  void _fetchList(FetchWishlist event, Emitter<WishlistAppState> emit) async{
    list = await wishlistRepository.fetchFavouriteList();
    emit(state.copyWith(wishList: List.from(list),status: WishlistStatus.success,));
  }


  void _wishListItems(WishlistItems event, Emitter<WishlistAppState> emit) async{
    final index = list.indexWhere((element)=> element.id == event.list.id);
    if(event.list.isFavourite){
      if(tempList.contains(list[index])){
        tempList.remove(list[index]);
        tempList.add(event.list);
      }
    }else{
      if(tempList.contains(list[index])){
        tempList.remove(list[index]);
        tempList.add(event.list);
      }
    }
    list[index] = event.list;
    emit(state.copyWith(wishList: List.from(list),));
  }

  void _selectedList(SelectedItems event, Emitter<WishlistAppState> emit) async{
    tempList.add(event.list);
    emit(state.copyWith(tempList: List.from(tempList),));
  }
  void _unSelectedItems(UnSelectedItems event, Emitter<WishlistAppState> emit) async{
    tempList.remove(event.list);
    emit(state.copyWith(tempList: List.from(tempList),));
  }

  void _deletedItems(DeleteItem event, Emitter<WishlistAppState> emit) async{

    for(int i = 0; i<tempList.length; i++){
      list.remove(tempList[i]);
    }
    tempList.clear();
    emit(state.copyWith(
      wishList: List.from(list),
      tempList: List.from(tempList),));
  }


}

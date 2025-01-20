part of 'wishlist_app_bloc.dart';

class WishlistAppState extends Equatable{
  final WishlistStatus status;
  final List<WishlistModel> list;
  final List<WishlistModel> tempList;
  const WishlistAppState( {
    this.status = WishlistStatus.loading,
    this.tempList = const [],
    this.list = const []});

  WishlistAppState copyWith({WishlistStatus? status, List<WishlistModel>? wishList, List<WishlistModel>? tempList}){
    return WishlistAppState(
      status: status ?? this.status,
      list: wishList ?? list,
      tempList: tempList ?? this.tempList
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [list, status, tempList];
}
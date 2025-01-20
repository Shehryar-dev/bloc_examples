part of 'wishlist_app_bloc.dart';


abstract class WishlistAppEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class FetchWishlist extends WishlistAppEvent{}


class WishlistItems extends WishlistAppEvent{
  final WishlistModel list;
  WishlistItems({required this.list});
}

class SelectedItems extends WishlistAppEvent{
  final WishlistModel list;
  SelectedItems({required this.list});
}


class UnSelectedItems extends WishlistAppEvent{
  final WishlistModel list;
  UnSelectedItems({required this.list});
}

class DeleteItem extends WishlistAppEvent{
  DeleteItem();
}

import 'dart:math';

import 'package:bloc_example/model/wishlist_model/wishlist_model.dart';

class WishlistRepository{
  Future<List<WishlistModel>> fetchFavouriteList() async{
    return await List.of(_generateList(10));
  }

  List<WishlistModel> _generateList(int length){             //unique Id Generated
    return List.generate(length, (index)=> WishlistModel(id: (index + pi).toString(), value: 'Item ${index}'));
  }



}
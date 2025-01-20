import 'package:equatable/equatable.dart';

class WishlistModel extends Equatable{
  final String id, value;
  final bool isDeleting, isFavourite;

  const WishlistModel({required this.id, required this.value, this.isDeleting = false, this.isFavourite = false});

  WishlistModel copyWith({String? id, String? value, bool? isDeleting, bool? isFavourite}){
    return WishlistModel(id: id ?? this.id,
        value: value ?? this.value, isDeleting: isDeleting ?? this.isDeleting, isFavourite: isFavourite ?? this.isFavourite);
  }


  @override
  // TODO: implement props
  List<Object?> get props => [id, value, isDeleting, isFavourite];

}
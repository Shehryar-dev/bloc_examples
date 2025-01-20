import 'package:equatable/equatable.dart';
// part of 'switch_btn_bloc.dart';

class SwitchBtnState extends Equatable{
  bool isNightMode;
  SwitchBtnState({this.isNightMode = false});

  SwitchBtnState copyWith({bool? isMode}){
    return SwitchBtnState(
      isNightMode: isMode ?? isNightMode,
    );
  }



  @override
  // TODO: implement props
  List<Object?> get props => [isNightMode];
}
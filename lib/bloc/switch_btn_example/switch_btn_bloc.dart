import 'package:bloc/bloc.dart';
import 'package:bloc_example/bloc/switch_btn_example/switch_btn_event.dart';
import 'package:bloc_example/bloc/switch_btn_example/switch_btn_state.dart';


class SwitchBtnBloc extends Bloc<SwitchEvent, SwitchBtnState> {
  SwitchBtnBloc():super(SwitchBtnState()){
    on<NightModeEvent>(_isMode);
  }


  void _isMode(NightModeEvent nightMode, Emitter<SwitchBtnState> emit){
    emit(state.copyWith(
      isMode: !state.isNightMode,
    ));
  }
}

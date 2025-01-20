import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'slider_example_event.dart';
part 'slider_example_state.dart';

class SliderExampleBloc extends Bloc<SliderExampleEvent, SliderExampleState> {
  SliderExampleBloc() : super(SliderExampleState()) {
    on<SliderEvent>(_sliderValue);
  }

  void _sliderValue(SliderEvent event, Emitter<SliderExampleState> emit){
    emit(state.copyWith(
      value: event.sliderValue
    ));
  }

}

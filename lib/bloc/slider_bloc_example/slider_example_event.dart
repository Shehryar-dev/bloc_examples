part of 'slider_example_bloc.dart';


abstract class SliderExampleEvent extends Equatable{
  const SliderExampleEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class SliderEvent extends SliderExampleEvent{
  double sliderValue;
  SliderEvent({required this.sliderValue});
}



part of 'slider_example_bloc.dart';

class SliderExampleState extends Equatable{
  double sliderValue;
  SliderExampleState({this.sliderValue = .4});

  SliderExampleState copyWith({double? value}){
    return SliderExampleState(sliderValue: value ?? sliderValue);
  }


  @override
  // TODO: implement props
  List<Object?> get props => [sliderValue];
}
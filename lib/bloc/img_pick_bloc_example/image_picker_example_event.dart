part of 'image_picker_example_bloc.dart';


abstract class ImagePickerExampleEvent extends Equatable{
  const ImagePickerExampleEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CameraCaptureEvent extends ImagePickerExampleEvent{

}


class GalleryPickerEvent extends ImagePickerExampleEvent{}

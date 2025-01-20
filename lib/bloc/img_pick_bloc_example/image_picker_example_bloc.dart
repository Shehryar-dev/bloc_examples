import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../utils/helper_functions.dart';

part 'image_picker_example_event.dart';
part 'image_picker_example_state.dart';

class ImagePickerExampleBloc extends Bloc<ImagePickerExampleEvent, ImagePickerExampleState> {

  ImagePickerExampleBloc() : super(ImagePickerExampleState()) {
    on<CameraCaptureEvent>(_cameraCapture);
    on<GalleryPickerEvent>(_galleryPickup);
  }
  final ImagePickerFunctions img = ImagePickerFunctions();

  void _cameraCapture(CameraCaptureEvent event, Emitter<ImagePickerExampleState> states) async{
    XFile? file = await img.cameraCapture();
    emit(state.copyWith(f: file));
  }
  void _galleryPickup(GalleryPickerEvent event, Emitter<ImagePickerExampleState> states) async{
    XFile? file = await img.pickImageFromGallery();
    emit(state.copyWith(g: file));
  }

}

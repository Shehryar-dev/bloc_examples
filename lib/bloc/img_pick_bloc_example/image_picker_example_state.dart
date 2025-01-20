part of 'image_picker_example_bloc.dart';


class ImagePickerExampleState extends Equatable{
  final XFile? file;
  final XFile? galleryFile;

  ImagePickerExampleState({this.file, this.galleryFile,});


  ImagePickerExampleState copyWith({XFile? f, XFile? g}){
    return ImagePickerExampleState(
      file: f ?? file,
      galleryFile:g ?? galleryFile
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [file, galleryFile];
}
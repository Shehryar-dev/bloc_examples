import 'dart:io';

import 'package:bloc_example/bloc/img_pick_bloc_example/image_picker_example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerExample extends StatelessWidget {
  const ImagePickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Bloc Example #3'),
        centerTitle: true,
        shape:const StadiumBorder(),
      ),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Camera Capture'),
            SizedBox(height: 10,),
            Center(
              child: BlocBuilder<ImagePickerExampleBloc, ImagePickerExampleState>(builder: (context, states){
                if(states.file == null){
                  return InkWell(
                    onTap: (){
                      context.read<ImagePickerExampleBloc>().add(CameraCaptureEvent());
                    },
                    child:const CircleAvatar(child: Icon(Icons.camera)),
                  );
                }else{
                  return Image.file(File(states.file!.path.toString()));
                }

              }),
            ),
            SizedBox(height: 30,),
            Text('Gallery Pickup'),
            SizedBox(height: 10,),
            Center(
              child: BlocBuilder<ImagePickerExampleBloc, ImagePickerExampleState>(builder: (context, states){
                if(states.file == null){
                  return InkWell(
                    onTap: (){
                      context.read<ImagePickerExampleBloc>().add(GalleryPickerEvent());
                    },
                    child:const CircleAvatar(child: Icon(Icons.browse_gallery)),
                  );
                }else{
                  return Image.file(File(states.file!.path.toString()));
                }

              }),
            ),
          ],
        ),
      )
    );
  }
}

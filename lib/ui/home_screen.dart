import 'package:bloc_example/ui/example_no_1/slider_ui.dart';
import 'package:bloc_example/ui/example_no_2/switch_btn_example.dart';
import 'package:bloc_example/ui/example_no_3/image_picker_example.dart';
import 'package:bloc_example/ui/example_no_4/todo_app_example.dart';
import 'package:bloc_example/ui/example_no_6/wishlist_screen.dart';
import 'package:flutter/material.dart';

import 'example_no_5/todo_example.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Padding(padding:const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SliderUi()));
                },
                child: const Center(child: Text('Slider Example #1'),)),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SwitchBtnExample()));
                },
                child: const Center(child: Text('Switch Btn Example #2'),)),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const ImagePickerExample()));
                },
                child: const Center(child: Text('Image Picker Example #3'),)),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const TodoAppExample()));
                },
                child: const Center(child: Text('Todo Counter Example #4'),)),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const TodoExample()));
                },
                child: const Center(child: Text('Todo Insert/Remove Example #5'),)),
            const SizedBox(height: 20,),

            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const WishlistScreen()));
                },
                child: const Center(child: Text('WishList App Example #6'),)),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );;
  }
}

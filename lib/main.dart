import 'package:bloc_example/bloc/img_pick_bloc_example/image_picker_example_bloc.dart';
import 'package:bloc_example/bloc/slider_bloc_example/slider_example_bloc.dart';
import 'package:bloc_example/bloc/switch_btn_example/switch_btn_bloc.dart';
import 'package:bloc_example/bloc/todo_app_bloc_example/to_do_app_example_bloc.dart';
import 'package:bloc_example/bloc/todo_example/todo_example_bloc.dart';
import 'package:bloc_example/bloc/wishlist_app/wishlist_app_bloc.dart';
import 'package:bloc_example/repository/wishlist_repository/wishlist_repository.dart';
import 'package:bloc_example/ui/home_screen.dart';
import 'package:bloc_example/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SliderExampleBloc()),
        BlocProvider(create: (context) => SwitchBtnBloc()),
        BlocProvider(create: (context) => ImagePickerExampleBloc()),
        BlocProvider(create: (context) => ToDoAppBloc()),
        BlocProvider(create: (context) => TodoExampleBloc()),
        BlocProvider(create: (context) => WishlistAppBloc(WishlistRepository())),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc Example',
        themeMode: ThemeMode.dark,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}


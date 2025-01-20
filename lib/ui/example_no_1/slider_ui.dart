import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/slider_bloc_example/slider_example_bloc.dart';

class SliderUi extends StatelessWidget {
  const SliderUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example #1'),
        centerTitle: true,
        shape: const StadiumBorder(),
      ),
      body: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('Slider Example'),),
            const SizedBox(height: 20,),
            BlocBuilder<SliderExampleBloc, SliderExampleState>(
              builder: (context, state) {
                return Container(
                  width: 300,
                  height: 300,
                  color: Colors.red.withOpacity(state.sliderValue),
                );
              },
            ),
            const SizedBox(height: 20,),
            BlocBuilder<SliderExampleBloc, SliderExampleState>(
              builder: (context, state) {
                return Slider(value: state.sliderValue, onChanged: (v) {
                  debugPrint('$v');
                  context.read<SliderExampleBloc>().add(SliderEvent(sliderValue: v));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

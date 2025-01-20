import 'package:bloc_example/bloc/switch_btn_example/switch_btn_bloc.dart';
import 'package:bloc_example/bloc/switch_btn_example/switch_btn_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/switch_btn_example/switch_btn_state.dart';

class SwitchBtnExample extends StatelessWidget {
  const SwitchBtnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example #2'),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('Switch Button'),),
            const SizedBox(height: 20,),
            BlocBuilder<SwitchBtnBloc, SwitchBtnState>(
              buildWhen: (previous,current)=> previous.isNightMode != current.isNightMode,
              builder: (context, state) {
                return Switch(
                    value: state.isNightMode, onChanged: (value) {
                  debugPrint('$value');
                  context.read<SwitchBtnBloc>().add(NightModeEvent());
                });
              },
            )
          ],),
      ),
    );
  }
}

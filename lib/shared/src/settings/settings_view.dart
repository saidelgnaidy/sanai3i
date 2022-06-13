import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanai3i/shared/src/settings/settings_cubit.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return Column(
                children: const [Center(child: Text('Home'))],
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sanai3i/shared/src/settings/settings_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return Center(
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/animations/${Theme.of(context).brightness == Brightness.light ? "loadD" : "loadL"}.json',
                      width: 150,
                      height: 150,
                      frameRate: FrameRate(60),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

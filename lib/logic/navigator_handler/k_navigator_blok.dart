import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class KNavigatorState {
  const KNavigatorState();
}

class KNavigatorBloc extends Cubit<KNavigatorState> {
  KNavigatorBloc() : super(const KNavigatorState());

  static KNavigatorBloc of(BuildContext context) {
    return BlocProvider.of<KNavigatorBloc>(context);
  }

  int currentIndex = 0;

  nav_taped(int index) {
    currentIndex = index;
    emit(KNavigatorState());
  }
}

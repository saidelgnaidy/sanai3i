import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanai3i/shared/theme/helper.dart';

@immutable
class KNavigatorState {
  final int index;
  const KNavigatorState({required this.index});
}

class KNavigatorBloc extends Cubit<KNavigatorState> {
  KNavigatorBloc() : super(const KNavigatorState(index: 0));

  static KNavigatorBloc of(BuildContext context) {
    return BlocProvider.of<KNavigatorBloc>(context);
  }

  nav_taped(int index) {
    emit(KNavigatorState(index: index));
  }

  List<IconData> nav_Items = [KHelper.home, KHelper.notifications, KHelper.chat, KHelper.person];
}

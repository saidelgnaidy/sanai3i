import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:sanai3i/models/user/user_model.dart';

@immutable
class KUsersTilesState {
  final List<KUser> users;
  const KUsersTilesState({required this.users});
}

class KUsersTilesBloc extends Cubit<KUsersTilesState> {
  KUsersTilesBloc() : super(const KUsersTilesState(users: []));

  static KUsersTilesBloc of(BuildContext context) {
    return BlocProvider.of<KUsersTilesBloc>(context);
  }

  List<KUser> tabedMarkers = [];
  List<String> tapedMarkerUid = [];
  final PageController ctrl = PageController();

  add(KUser user) {
    if (tapedMarkerUid.contains(user.uid)) {
      animateToPage(tapedMarkerUid.indexOf(user.uid!));
    } else {
      tabedMarkers.add(user);
      tapedMarkerUid.add(user.uid!);
      animateToPage(tapedMarkerUid.indexOf(user.uid!));
      emit(KUsersTilesState(users: tabedMarkers));
    }
  }

  animateToPage(int page) {
    ctrl.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  scrollTo(KUser user) {
    int index = tabedMarkers.indexWhere((element) => element.uid == user.uid) + 1;
    ctrl.animateTo(
      index * Get.width - 20,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
    debugPrint('****************** ************ Scrolling to $index');
  }
}

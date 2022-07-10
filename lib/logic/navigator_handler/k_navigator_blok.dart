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

  IconData get fabIcon {
    if (pageCtrl.page?.toInt() == 1) return KHelper.add;
    return KHelper.search;
  }

  PageController pageCtrl = PageController();

  ///  0  , 1 , 2 , 3

  nav_taped(int page) {
    if (page != pageCtrl.page?.toInt()) {
      pageCtrl.jumpToPage((pageCtrl.page ?? 0) < page ? page - 1 : page + 1);
      pageCtrl.animateToPage(page, duration: const Duration(milliseconds: 450), curve: Curves.easeOutCubic);
      emit(KNavigatorState(index: page));
    }
  }

  List<IconData> nav_Items = [KHelper.home, KHelper.favorite, KHelper.chat, KHelper.person];
}

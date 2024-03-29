import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanai3i/logic/navigator_handler/k_navigator_blok.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/view/bookmarks/bookmarks_view.dart';
import 'package:sanai3i/view/chats/chats_list.dart';
import 'package:sanai3i/view/home/home_view.dart';
import 'package:sanai3i/view/profile/profile.dart';
import 'package:sanai3i/view/widgets/appbar.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KNavigatorBloc, KNavigatorState>(
      buildWhen: (previous, current) => previous.index != current.index,
      builder: (context, nav) {
        return Scaffold(
          appBar: const KAppBar(),
          extendBody: true,
          body: PageView(
            controller: KNavigatorBloc.of(context).pageCtrl,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomeView(),
              BookmarksView(),
              ChatsList(),
              Profile(),
            ],
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: KNavigatorBloc.of(context).nav_Items,
            activeIndex: nav.index,
            shadow: Shadow(color: KColors.of(context).shadow, blurRadius: 10),
            backgroundColor: KColors.of(context).background,
            gapLocation: GapLocation.none,
            notchSmoothness: NotchSmoothness.smoothEdge,
            onTap: KNavigatorBloc.of(context).nav_taped,
            activeColor: KColors.of(context).activeIcons,
            inactiveColor: KColors.of(context).inactiveIcons,
            splashColor: KColors.of(context).activeIcons,
          ),
        );
      },
    );
  }
}

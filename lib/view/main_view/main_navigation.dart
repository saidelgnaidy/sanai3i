import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sanai3i/logic/navigator_handler/k_navigator_blok.dart';
import 'package:sanai3i/shared/src/settings/settings_cubit.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/widgets/appbar.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KNavigatorBloc, KNavigatorState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const KAppBar(),
          body: IndexedStack(
            index: KNavigatorBloc.of(context).currentIndex,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return Center(
                      child: Column(
                        children: [
                          Lottie.asset(
                            'assets/animations/working.json',
                            frameRate: FrameRate(60),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(),
              const SizedBox(),
              const SizedBox(),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: KColors.of(context).fabBackground,
            elevation: 20,
            child: Icon(Icons.search, color: KColors.of(context).reIcon),
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: const [Icons.home, Icons.notifications, Icons.chat, Icons.account_circle],
            activeIndex: KNavigatorBloc.of(context).currentIndex,
            shadow: Shadow(color: KColors.of(context).shadow, blurRadius: 60),
            backgroundColor: KColors.of(context).background,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.smoothEdge,
            blurEffect: true,
            onTap: KNavigatorBloc.of(context).nav_taped,
            activeColor: KColors.of(context).activeIcons,
            inactiveColor: KColors.of(context).inactiveIcons,
            leftCornerRadius: 20,
            rightCornerRadius: 20,
            splashColor: KColors.of(context).activeIcons,
          ),
        );
      },
    );
  }
}

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sanai3i/logic/navigator_handler/k_navigator_blok.dart';
import 'package:sanai3i/shared/src/settings/settings_cubit.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/widgets/appbar.dart';
import 'package:sanai3i/view/auth/profile/profile.dart';

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
      builder: (context, state) {
        return Scaffold(
          appBar: const KAppBar(),
          body: IndexedStack(
            index: state.index,
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
              const Profile(),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: KColors.of(context).fabBackground,
            elevation: 20,
            child: Icon(KHelper.search(state.index), color: KColors.of(context).reIcon),
          ),
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons:  KNavigatorBloc.of(context).nav_Items,
            activeIndex: state.index,
            shadow: Shadow(color: KColors.of(context).shadow, blurRadius: 10),
            backgroundColor: KColors.of(context).background,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.smoothEdge,
            blurEffect: true,
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

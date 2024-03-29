import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sanai3i/logic/auth/auth_bloc.dart';
import 'package:sanai3i/logic/bookmarks/bookmarks_bloc.dart';
import 'package:sanai3i/logic/chat/chats_bloc.dart';
import 'package:sanai3i/logic/complete_register/complete_regster.dart';
import 'package:sanai3i/logic/maps_ctrl/pick_location_bloc.dart';
import 'package:sanai3i/logic/navigator_handler/k_navigator_blok.dart';
import 'package:sanai3i/logic/service_provider/service_provicer_bloc.dart';
import 'package:sanai3i/logic/services_getter/services_getter_bloc.dart';
import 'package:sanai3i/logic/settings/settings_cubit.dart';
import 'package:sanai3i/logic/user_existace/user_existace.dart';
import 'package:sanai3i/logic/user_existace/user_existace_state.dart';
import 'package:sanai3i/logic/user_info/user_info_bloc.dart';
import 'package:sanai3i/shared/notifications/notifications_api.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/view/main/main_navigation.dart';
import 'package:sanai3i/shared/theme/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sanai3i/view/auth/auth_landing.dart';
import 'package:sanai3i/view/profile/complete_info.dart';
import 'package:sanai3i/view/widgets/error_view.dart';
import 'package:sanai3i/view/widgets/loading_overlay.dart';
import 'package:sanai3i/view/widgets/no_conniction_view.dart';
import 'shared/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  await GetStorage().erase();
  await FirebaseAuth.instance.signOut();
  NotificationCtrl.firebaseMSG();
  NotificationCtrl.initNotification();
  debugPrint('**************************** My UID is  : ${FirebaseAuth.instance.currentUser?.uid} ');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(create: (context) => SettingsBloc()..loadSettings()),
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<KNavigatorBloc>(create: (context) => KNavigatorBloc()),
        BlocProvider<UserExistenceBloc>(create: (context) => UserExistenceBloc()..call()),
        BlocProvider<LocationPickerBloc>(create: (context) => LocationPickerBloc()..init),
        BlocProvider<CompleteRegisterBloc>(create: (context) => CompleteRegisterBloc()),
        BlocProvider<ServicesGetterBloc>(create: (context) => ServicesGetterBloc()..getServices()),
        BlocProvider<UserInfoBloc>(create: (context) => UserInfoBloc()..getUser()),
        BlocProvider<ServiceProvidersBloc>(create: (context) => ServiceProvidersBloc()),
        BlocProvider<BookmarksBloc>(create: (context) => BookmarksBloc()..getFromCache()),
        BlocProvider<ChatBloc>(create: (context) => ChatBloc()),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return GetMaterialApp(
            title: 'صنايعي',
            debugShowCheckedModeBanner: false,
            localizationsDelegates: Tr.delegates,
            supportedLocales: Tr.supportedLocales,
            locale: SettingsBloc.of(context).locale,
            localeResolutionCallback: (Locale? locale, Iterable<Locale> iterable) {
              return SettingsBloc.of(context).locale;
            },
            theme: KThemeData.light,
            darkTheme: KThemeData.dark,
            themeMode: SettingsBloc.of(context).themeMode,
            home: AnnotatedRegion<SystemUiOverlayStyle>(
              value: KThemeData.of(context).overlayStyle,
              child: const Wrapper(),
            ),
          );
        },
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).focusedChild?.unfocus();
      },
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const LandingView();
          }
          return BlocBuilder<UserExistenceBloc, UserExistenceState>(
            builder: (context, state) {
              return state.when(
                loading: () => const KLoadingOverlay(isLoading: true, child: Scaffold()),
                completed: () => const MainNavigation(),
                offline: () => KOfflineView(onTryAgain: () => UserExistenceBloc.of(context).call()),
                error: () => KErrorView(onTryAgain: () => UserExistenceBloc.of(context).call()),
                missing: () => const CompleteInfoView(),
              );
            },
          );
        },
      ),
    );
  }
}

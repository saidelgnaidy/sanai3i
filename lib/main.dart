import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sanai3i/logic/auth/auth_bloc.dart';
import 'package:sanai3i/logic/complete_register/complete_regester.dart';
import 'package:sanai3i/logic/complete_register/complete_register_state.dart';
import 'package:sanai3i/logic/navigator_handler/k_navigator_blok.dart';
import 'package:sanai3i/logic/settings/settings_cubit.dart';
import 'package:sanai3i/shared/notifications/notifications_api.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/view/main_view/main_navigation.dart';
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
  FirebaseAuth.instance.setLanguageCode('ar');
  NotificationCtrl.firebaseMSG();
  NotificationCtrl.initNotification();
  await FirebaseAuth.instance.signOut();

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
        BlocProvider<CompleteRegisterBloc>(create: (context) => CompleteRegisterBloc()..registerCompleted()),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return GetMaterialApp(
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
          if (!snapshot.hasData) {
            return const LandingView();
          }
          return BlocBuilder<CompleteRegisterBloc, CompleteRegisterState>(
            builder: (context, state) {
              return state.when(
                loading: () => const LoadingOverlay(isLoading: true, child: Scaffold()),
                completed: () => const MainNavigation(),
                offline: () => KOfflineView(onTryAgain: () => CompleteRegisterBloc.of(context).registerCompleted()),
                error: () => KErrorView(onTryAgain: () => CompleteRegisterBloc.of(context).registerCompleted()),
                missing: () => const CompleteInfoView(),
              );
            },
          );
        },
      ),
    );
  }
}

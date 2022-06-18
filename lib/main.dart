import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sanai3i/logic/auth/auth_bloc.dart';
import 'package:sanai3i/shared/notifications/notifications_api.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/src/settings/settings_cubit.dart';
import 'package:sanai3i/shared/src/settings/settings_view.dart';
import 'package:sanai3i/shared/src/settings/theme_mode.dart';
import 'package:sanai3i/shared/widgets/appbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sanai3i/view/auth/landing.dart';
import 'shared/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  FirebaseAuth.instance.setLanguageCode('ar');
  FirebaseAuth.instance.signOut();
  NotificationCtrl.firebaseMSG();
  NotificationCtrl.initNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
          ..focusedChild
          ..unfocus();
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SettingsBloc>(create: (context) => SettingsBloc()..loadSettings()),
          BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
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
              home: Builder(
                builder: (context) {
                  return AnnotatedRegion<SystemUiOverlayStyle>(
                    value: KThemeData.of(context).overlayStyle,
                    child: const Wrapper(),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: const KAppBar(),
          body: !snapshot.hasData ? const LandingView() : const HomeView(),
        );
      },
    );
  }
}

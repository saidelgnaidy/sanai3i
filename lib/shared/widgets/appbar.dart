import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanai3i/shared/const.dart';
import 'package:sanai3i/shared/src/settings/settings_cubit.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('صنايعي'),
      centerTitle: true,
      titleTextStyle: KTextStyle.of(context).appBar,
      leading: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return KIconButton(
            icon: Theme.of(context).brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode,
            onPressed: SettingsBloc.of(context).updateThemeMode,
          );
        },
      ),
      actions: const [
        LangSwitch(),
      ],
    );
  }
}

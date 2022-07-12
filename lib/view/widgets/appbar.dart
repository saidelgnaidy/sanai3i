import 'package:flutter/material.dart';
import 'package:sanai3i/view/widgets/shared_components.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/widgets/theme_toggle_btn.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'appBar',
      child: AppBar(
        title: const Text('صنايعي'),
        centerTitle: true,
        titleTextStyle: KTextStyle.of(context).appBar,
        leading: ThemeToggleBtn(),
        actions: const [
          LangSwitch(),
        ],
      ),
    );
  }
}

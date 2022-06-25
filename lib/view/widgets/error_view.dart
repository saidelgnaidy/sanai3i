import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/widgets/appbar.dart';

class KErrorView extends StatelessWidget {
  final void Function()? onTryAgain;

  const KErrorView({Key? key, this.onTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Tr.get.try_later,
              style: KTextStyle.of(context).body,
            ),
            Lottie.asset('assets/animations/error.json'),
            const SizedBox(height: 25),
            if (onTryAgain != null)
              TextButton(
                onPressed: onTryAgain,
                child: Text('try again', style: KTextStyle.of(context).textBtn),
              ),
          ],
        ),
      ),
    );
  }
}
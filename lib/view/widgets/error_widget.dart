import 'package:flutter/material.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';

class KErrorWidget extends StatelessWidget {
  final void Function()? onTryAgain;
  final String? error;
  final Widget? widget;

  const KErrorWidget({Key? key, this.onTryAgain, this.error, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget != null) widget!,
            Text(
              error ?? Tr.get.try_later,
              style: KTextStyle.of(context).error,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            if (onTryAgain != null && error != Tr.get.location_denaid_permanently)
              TextButton(
                onPressed: onTryAgain,
                child: Text(Tr.get.try_again, style: KTextStyle.of(context).textBtn),
              ),
          ],
        ),
      ),
    );
  }
}

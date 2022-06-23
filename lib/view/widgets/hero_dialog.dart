import 'dart:ui';

import 'package:flutter/material.dart';

class HeroDialog extends PageRoute {
  final WidgetBuilder builder;
  final bool? isDismissible;
  HeroDialog({required this.builder, required this.settings ,this.isDismissible = true});

  @override
  final RouteSettings settings;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => isDismissible!;

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black.withOpacity(.3);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 450);

  @override
  String get barrierLabel => 'popup';

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }
}

class HeroTween extends RectTween {
  HeroTween({required Rect? begin, required Rect? end}) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    final elasticCurveValue = Curves.decelerate.transform(t);
    return Rect.fromLTRB(
      lerpDouble(begin!.left, end!.left, elasticCurveValue)!,
      lerpDouble(begin!.top, end!.top, elasticCurveValue)!,
      lerpDouble(begin!.right, end!.right, elasticCurveValue)!,
      lerpDouble(begin!.bottom, end!.bottom, elasticCurveValue)!,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sanai3i/shared/theme/colors.dart';

class BubbleSpecialThree extends StatelessWidget {
  final bool isSender;
  final String text;
  final bool tail;
  final bool sent;
  final bool delivered;
  final bool seen;
  final TextStyle textStyle;

  const BubbleSpecialThree({
    Key? key,
    this.isSender = true,
    required this.text,
    this.tail = true,
    this.sent = false,
    this.delivered = false,
    this.seen = false,
    this.textStyle = const TextStyle(
      color: Colors.black87,
      fontSize: 16,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool stateTick = false;
    Icon? stateIcon;
    if (sent) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (delivered) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF97AD8E),
      );
    }
    if (seen) {
      stateTick = true;
      stateIcon = const Icon(
        Icons.done_all,
        size: 18,
        color: Color(0xFF92DEDA),
      );
    }

    return Align(
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: CustomPaint(
          painter: SpecialChatBubbleThree(
              color: isSender ? KColors.of(context).msgBubble.withOpacity(.4) : KColors.of(context).msgBubble.withOpacity(.1),
              alignment: isSender ? Alignment.topRight : Alignment.topLeft,
              tail: tail),
          child: Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .7),
            margin: isSender
                ? stateTick
                    ? const EdgeInsets.fromLTRB(7, 7, 14, 7)
                    : const EdgeInsets.fromLTRB(7, 7, 17, 7)
                : const EdgeInsets.fromLTRB(17, 7, 7, 7),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: stateTick ? const EdgeInsets.only(left: 4, right: 20) : const EdgeInsets.only(left: 4, right: 4),
                  child: Text(text, style: textStyle, textAlign: TextAlign.left),
                ),
                if (stateIcon != null && stateTick) Positioned(bottom: 0, right: 0, child: stateIcon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SpecialChatBubbleThree extends CustomPainter {
  final Color color;
  final Alignment alignment;
  final bool tail;

  SpecialChatBubbleThree({required this.color, required this.alignment, required this.tail});

  final double _radius = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    var h = size.height;
    var w = size.width;
    if (alignment == Alignment.topRight) {
      if (tail) {
        var path = Path();

        path.moveTo(_radius * 2, 0);

        path.quadraticBezierTo(0, 0, 0, _radius * 1.5);

        path.lineTo(0, h - _radius * 1.5);

        path.quadraticBezierTo(0, h, _radius * 2, h);

        path.lineTo(w - _radius * 3, h);

        path.quadraticBezierTo(w - _radius * 1.5, h, w - _radius * 1.5, h - _radius * 0.6);

        path.quadraticBezierTo(w - _radius * 1, h, w, h);

        path.quadraticBezierTo(w - _radius * 0.8, h, w - _radius, h - _radius * 1.5);

        path.lineTo(w - _radius, _radius * 1.5);

        path.quadraticBezierTo(w - _radius, 0, w - _radius * 3, 0);

        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      } else {
        var path = Path();

        path.moveTo(_radius * 2, 0);

        path.quadraticBezierTo(0, 0, 0, _radius * 1.5);

        path.lineTo(0, h - _radius * 1.5);

        path.quadraticBezierTo(0, h, _radius * 2, h);

        path.lineTo(w - _radius * 3, h);

        path.quadraticBezierTo(w - _radius, h, w - _radius, h - _radius * 1.5);

        path.lineTo(w - _radius, _radius * 1.5);

        path.quadraticBezierTo(w - _radius, 0, w - _radius * 3, 0);

        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      }
    } else {
      if (tail) {
        var path = Path();

        path.moveTo(_radius * 3, 0);

        path.quadraticBezierTo(_radius, 0, _radius, _radius * 1.5);

        path.lineTo(_radius, h - _radius * 1.5);
        path.quadraticBezierTo(_radius * .8, h, 0, h);

        path.quadraticBezierTo(_radius * 1, h, _radius * 1.5, h - _radius * 0.6);

        path.quadraticBezierTo(_radius * 1.5, h, _radius * 3, h);

        path.lineTo(w - _radius * 2, h);

        path.quadraticBezierTo(w, h, w, h - _radius * 1.5);

        path.lineTo(w, _radius * 1.5);

        path.quadraticBezierTo(w, 0, w - _radius * 2, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      } else {
        var path = Path();

        path.moveTo(_radius * 3, 0);

        path.quadraticBezierTo(_radius, 0, _radius, _radius * 1.5);

        path.lineTo(_radius, h - _radius * 1.5);

        path.quadraticBezierTo(_radius, h, _radius * 3, h);

        path.lineTo(w - _radius * 2, h);

        path.quadraticBezierTo(w, h, w, h - _radius * 1.5);

        path.lineTo(w, _radius * 1.5);

        path.quadraticBezierTo(w, 0, w - _radius * 2, 0);
        canvas.clipPath(path);
        canvas.drawRRect(
            RRect.fromLTRBR(0, 0, w, h, Radius.zero),
            Paint()
              ..color = color
              ..style = PaintingStyle.fill);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

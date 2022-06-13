import 'package:flutter/material.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'hero_dialog.dart';

class CustomDrop extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Widget? child;
  final String? tag;
  final double? width;
  final Color? color;

  const CustomDrop({super.key, this.title, this.icon, this.tag, this.width, this.color, this.child});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Hero(
      tag: tag!,
      createRectTween: (begin, end) {
        return HeroTween(begin: begin, end: end);
      },
      child: Container(
        width: width ?? size.width,
        margin: const EdgeInsets.fromLTRB(5, 8, 5, 0),
        height: 50,
        decoration: BoxDecoration(
          color: color,
          //boxShadow: shadow,
          borderRadius: BorderRadius.circular(25),
        ),
        child: RawMaterialButton(
          shape: const StadiumBorder(),
          onPressed: () {
            Navigator.push(
              context,
              HeroDialog(
                builder: (context) => child!,
                settings: RouteSettings(
                  name: tag,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: [
                Icon(icon, color: Colors.transparent, size: 20),
                Text(
                  title!,
                  style: TextStyle(color: color, fontSize: 16),
                ),
                Icon(
                  icon,
                  color: Colors.green,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDropMini extends StatelessWidget {
  final String? title;
  final Widget? child;
  final String? tag;

  const CustomDropMini({super.key, this.title, this.tag, this.child});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Hero(
      tag: tag!,
      createRectTween: (begin, end) {
        return HeroTween(begin: begin, end: end);
      },
      child: Container(
        width: size.width * .5 - 5,
        margin: EdgeInsets.fromLTRB(tag == 'pickJop' ? .1 : 5, 0, tag != 'pickJop' ? 0 : 0, 0),
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(tag == 'pickJop' ? 15 : 0), topLeft: Radius.circular(tag == 'pickJop' ? 0 : 15)),
        ),
        child: RawMaterialButton(
          shape: const StadiumBorder(),
          onPressed: () {
            Navigator.push(
                context,
                HeroDialog(
                  builder: (context) => child!,
                  settings: RouteSettings(
                    name: tag,
                  ),
                ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.ltr,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: RawMaterialButton(
                  padding: EdgeInsets.zero,
                  shape: const StadiumBorder(),
                  child: const Icon(Icons.clear, color: Colors.green, size: 20),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    title!,
                    style: KTextStyle.of(context).body,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}

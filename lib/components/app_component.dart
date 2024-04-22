import 'package:flutter/material.dart';
import 'package:tech_blog/Constants/themecolors.dart';

class Divder extends StatelessWidget {
  const Divder({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      thickness: .5,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tech_blog/Constants/themecolors.dart';
import 'package:tech_blog/Models/fake_data.dart';
import 'package:tech_blog/gen/assets.gen.dart';

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

// Tags component
class CatsTags extends StatelessWidget {
  CatsTags({
    super.key,
    required this.centerMargin,
    required this.textTheme,
    required this.index,
  });

  final double centerMargin;
  final TextTheme textTheme;

  var index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? centerMargin : 16, 8),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          gradient: LinearGradient(
              colors: GradientColor.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ImageIcon(
                Assets.images.icons.hash.provider(),
                color: SolidColors.whiteColor,
                size: 16,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                tagCategory[index].title,
                style: textTheme.displayMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}

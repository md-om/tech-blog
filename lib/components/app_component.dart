import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/Constants/themecolors.dart';
import 'package:tech_blog/Models/fake_data.dart';
import 'package:tech_blog/controller/home_screen.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

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
  const CatsTags({
    super.key,
    required this.centerMargin,
    required this.textTheme,
    required this.index,
  });

  final double centerMargin;
  final TextTheme textTheme;

  final int index;
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
                Get.find<HomeScreenController>().tagsList[index].title!,
                style: textTheme.displayMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// URL Launcher
showUrlOnWeb(String url) async {
  var uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception("Could not launch $uri");
  }
}

PreferredSize techAppbar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(80),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Center(
              child: Text(title),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: SolidColors.primaryColor.withAlpha(100),
            ),
            child: const Icon(
              CupertinoIcons.arrow_right,
              color: SolidColors.whiteColor,
            ),
          ),
        ),
      ),
    ),
  );
}

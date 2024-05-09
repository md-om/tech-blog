import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tech_blog/Constants/themecolors.dart';
import 'package:tech_blog/Models/articles.dart';
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
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
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

Padding listScreen(
    RxList<ArticlesModel> ascal, double screenWidth, double screenHeight) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Obx(
      () => ListView.builder(
        itemCount: ascal.length,
        itemBuilder: (context, index) {
          var textTheme = Theme.of(context).textTheme;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth / 4,
                  height: screenHeight / 7,
                  child: CachedNetworkImage(
                    imageUrl: ascal[index].image!,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(
                          ascal[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: textTheme.titleMedium,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            ascal[index].author!,
                            style: textTheme.displaySmall,
                          ),
                          Text(
                            '${ascal[index].view} بازدید ',
                            style: textTheme.displaySmall,
                          ),
                          Text(
                            ascal[index].catName!,
                            style: textTheme.headlineSmall,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
          // Text('Width is ${Get.width}');
        },
      ),
    ),
  );
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/Constants/strings.dart';
import 'package:tech_blog/Constants/themecolors.dart';
import 'package:tech_blog/Models/fake_data.dart';
import 'package:tech_blog/components/app_component.dart';
import 'package:tech_blog/controller/home_screen.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class HomeScreenBody extends StatelessWidget {
  HomeScreenBody({
    super.key,
    required this.size,
    required this.textTheme,
    required this.centerMargin,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  final Size size;
  final TextTheme textTheme;
  final double centerMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            HomePageBanner(size: size, textTheme: textTheme),
            const SizedBox(
              height: 16,
            ),
            CategoryTags(centerMargin: centerMargin, textTheme: textTheme),
            const SizedBox(
              height: 32,
            ),
            HotestScrollTitle(centerMargin: centerMargin, textTheme: textTheme),
            topArticle(),
            HotestPodcastTitle(
                centerMargin: centerMargin, textTheme: textTheme),
            topPodcasts(),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget topArticle() {
    var hsctv = homeScreenController.topVisited;
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hsctv.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  16, 10, index == 0 ? centerMargin : 16, 5),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 5.4,
                    width: size.width / 2.5,
                    child: CachedNetworkImage(
                      imageUrl: hsctv[index].image!,
                      imageBuilder: (context, imageProvider) =>
                          Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                          foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            gradient: LinearGradient(
                                colors: GradientColor.blogOverlay,
                                begin: Alignment.bottomCenter,
                                end: Alignment.center),
                          ),
                        ),
                        Positioned(
                            bottom: 10,
                            right: 0,
                            left: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  hsctv[index].author!,
                                  style: textTheme.displayMedium,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      hsctv[index].view!,
                                      style: textTheme.displayMedium,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      size: 16,
                                      color: SolidColors.whiteColor,
                                    )
                                  ],
                                ),
                              ],
                            ))
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: SizedBox(
                      width: size.width / 2.5,
                      child: Text(
                        hsctv[index].title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget topPodcasts() {
    var hsctp = homeScreenController.topPodcast;
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hsctp.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  16, 10, index == 0 ? centerMargin : 16, 5),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 5.4,
                    width: size.width / 2.5,
                    child: CachedNetworkImage(
                      imageUrl: hsctp[index].poster!,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      ),
                      placeholder: (context, url) => const SpinKitFadingGrid(
                        color: SolidColors.dividerColor,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.image_not_supported_outlined,
                        size: 32.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: SizedBox(
                      width: size.width / 2.5,
                      child: Text(
                        hsctp[index].title!,
                        style: textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class HotestPodcastTitle extends StatelessWidget {
  const HotestPodcastTitle({
    super.key,
    required this.centerMargin,
    required this.textTheme,
  });

  final double centerMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, centerMargin, 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.images.icons.mic.provider(),
            color: SolidColors.titleColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            TextStrings.mostNewPodcast,
            style: textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

class HotestScrollTitle extends StatelessWidget {
  const HotestScrollTitle({
    super.key,
    required this.centerMargin,
    required this.textTheme,
  });

  final double centerMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, centerMargin, 8),
      child: Row(
        children: [
          ImageIcon(
            Assets.images.icons.pen.provider(),
            color: SolidColors.titleColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            TextStrings.mostHotNews,
            style: textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}

class CategoryTags extends StatelessWidget {
  const CategoryTags({
    super.key,
    required this.centerMargin,
    required this.textTheme,
  });

  final double centerMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagCategory.length,
        itemBuilder: (context, index) {
          return CatsTags(
              centerMargin: centerMargin, textTheme: textTheme, index: index);
        },
      ),
    );
  }
}

class HomePageBanner extends StatelessWidget {
  const HomePageBanner({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.19,
          height: size.height / 4.20,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
                image: AssetImage(coverHeaderMap['imagePath']),
                fit: BoxFit.cover),
          ),
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: GradientColor.bannerOverlayCover),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    coverHeaderMap['writer'] + " - " + coverHeaderMap['date'],
                    style: textTheme.displayMedium,
                  ),
                  Row(
                    children: [
                      Text(
                        coverHeaderMap['views'],
                        style: textTheme.displayMedium,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        size: 16,
                        color: SolidColors.whiteColor,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                coverHeaderMap['title'],
                style: textTheme.displayLarge,
              )
            ],
          ),
        ),
      ],
    );
  }
}

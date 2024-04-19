import 'package:flutter/material.dart';
import 'package:tech_blog/Constants/strings.dart';
import 'package:tech_blog/Constants/themecolors.dart';
import 'package:tech_blog/Models/fake_data.dart';

import 'gen/assets.gen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double centerMargin = size.width / 16;
    return SafeArea(
      child: Scaffold(
        body: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // App Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.menu),
                    Image(
                      image: Assets.images.public.logo.provider(),
                      height: size.height / 13.64,
                    ),
                    const Icon(Icons.search)
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                // Banner
                Stack(
                  children: [
                    Container(
                      width: size.width / 1.19,
                      height: size.height / 4.20,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
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
                                coverHeaderMap['writer'] +
                                    " - " +
                                    coverHeaderMap['date'],
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
                ),
                const SizedBox(
                  height: 16,
                ),
                // Tags category
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tagCategory.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 8, index == 0 ? centerMargin : 16, 8),
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
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                // Hotest title
                Padding(
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
                ),

                // Hotest items
                SizedBox(
                  height: size.height / 3.5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotestArticle.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                            16, 10, index == 0 ? centerMargin : 16, 5),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height / 5.4,
                              width: size.width / 2.5,
                              child: Stack(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            hotestArticle[index].imageUrl),
                                        fit: BoxFit.cover),
                                  ),
                                  foregroundDecoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          hotestArticle[index].writer,
                                          style: textTheme.displayMedium,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              hotestArticle[index].views,
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
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: SizedBox(
                                width: size.width / 2.5,
                                child: Text(
                                  hotestArticle[index].title,
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

                // Hotest Podcast title
                Padding(
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
                        TextStrings.mostNewPodcast,
                        style: textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                // Hotest podcast item
              ],
            ),
          ),
        ),
      ),
    );
  }
}

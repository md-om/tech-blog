import 'package:flutter/material.dart';
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
                SizedBox(
                  height: 16,
                ),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

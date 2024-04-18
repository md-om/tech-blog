import 'package:flutter/material.dart';
import 'package:tech_blog/Constants/themecolors.dart';

import 'gen/assets.gen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                            image: Image(
                                    image:
                                        Assets.images.public.cover.provider())
                                .image,
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: size.width / 1.19,
                      height: size.height / 4.20,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: GradientColor.bannerOverlayCover),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

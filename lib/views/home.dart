import 'package:flutter/material.dart';
import 'package:tech_blog/Constants/themecolors.dart';
import 'package:tech_blog/views/home_screen_body.dart';
import 'package:tech_blog/views/profile_screen_body.dart';
import '../gen/assets.gen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double centerMargin = size.width / 16;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: SolidColors.whiteColor,
          automaticallyImplyLeading: false,
          surfaceTintColor: SolidColors.whiteColor,
          flexibleSpace: Row(
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
        ),
        body: Stack(
          children: [
            // Positined.fill will fill all remain free space
            Center(
              child: Positioned.fill(
                child: ProfileScreenBody(
                    size: size,
                    textTheme: textTheme,
                    centerMargin: centerMargin),
              ),
            ),

            BottomNavigationBar(size: size, centerMargin: centerMargin),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({
    super.key,
    required this.size,
    required this.centerMargin,
  });

  final Size size;
  final double centerMargin;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 12,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: GradientColor.bottomNavBg,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              right: centerMargin, left: centerMargin, bottom: 8),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                  colors: GradientColor.bottomNavs,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    Assets.images.icons.home.provider(),
                    color: SolidColors.whiteColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(Assets.images.icons.write.provider(),
                      color: SolidColors.whiteColor),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(Assets.images.icons.user.provider(),
                      color: SolidColors.whiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

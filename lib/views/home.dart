import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tech_blog/Constants/themecolors.dart';
import 'package:tech_blog/views/home_screen_body.dart';
import 'package:tech_blog/views/profile_screen_body.dart';
import 'package:tech_blog/views/register_intro.dart';
import '../gen/assets.gen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// For access to all scaffold items
final GlobalKey<ScaffoldState> _key = GlobalKey();

class _HomeState extends State<Home> {
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double centerMargin = size.width / 16;
    List<Widget> selectedPageScreen = [
      HomeScreenBody(
          size: size, textTheme: textTheme, centerMargin: centerMargin),
      const RegisterIntro(),
      ProfileScreenBody(
          size: size, textTheme: textTheme, centerMargin: centerMargin)
    ];
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.whiteColor,
          child: Padding(
            padding: EdgeInsets.only(left: centerMargin, right: centerMargin),
            child: ListView(
              children: [
                SizedBox(
                  child: Center(
                    child: Image.asset(
                      Assets.images.public.logo.path,
                      scale: 2,
                    ),
                  ),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  title: const Text('پروفایل کاربری'),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('درباره تک بلاگ'),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  title: const Text('اشتراک گذاری تک بلاگ'),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  title: const Text('تماس با ما'),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: SolidColors.whiteColor,
          automaticallyImplyLeading: false,
          surfaceTintColor: SolidColors.whiteColor,
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: const Icon(Icons.menu)),
              Image(
                image: Assets.images.public.logo.provider(),
                height: size.height / 13.64,
              ),
              const Icon(Icons.search),
            ],
          ),
        ),
        body: Stack(
          children: [
            // Positined.fill will fill all remain free space
            Positioned.fill(
              child: selectedPageScreen[selectedPageIndex],
            ),

            BottomNavigationBar(
              size: size,
              centerMargin: centerMargin,
              changeScreen: (value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
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
    required this.changeScreen,
  });

  final Size size;
  final double centerMargin;
  final Function(int) changeScreen;

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
                  onPressed: () => changeScreen(0),
                  icon: ImageIcon(
                    Assets.images.icons.home.provider(),
                    color: SolidColors.whiteColor,
                  ),
                ),
                IconButton(
                  onPressed: () => changeScreen(1),
                  icon: ImageIcon(Assets.images.icons.write.provider(),
                      color: SolidColors.whiteColor),
                ),
                IconButton(
                  onPressed: () => changeScreen(2),
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

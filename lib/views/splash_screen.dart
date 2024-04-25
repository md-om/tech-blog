import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/views/home.dart';
import 'package:tech_blog/views/user_cats.dart';
import '../Constants/themecolors.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Code for after splash screen
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const UserCats(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: Assets.images.public.logo.provider(), height: 64),
          const SizedBox(
            height: 32,
          ),
          const Text('لطفاً چند لحظه صبر کنید...'),
          const SizedBox(
            height: 32,
          ),
          const SpinKitRing(
            color: SolidColors.primaryColor,
            size: 50.0,
          ),
        ],
      ),
    );
  }
}

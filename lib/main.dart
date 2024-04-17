import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Constants/themecolors.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/gen/fonts.gen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Farsi
      ],
      theme: ThemeData(
        fontFamily: FontFamily.dana,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
      ),
    );
  }
}

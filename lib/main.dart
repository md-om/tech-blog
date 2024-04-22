import 'package:tech_blog/Constants/themecolors.dart';
import 'package:tech_blog/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/views/splash_screen.dart';

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
          titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: SolidColors.primaryColor),
          bodySmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: SolidColors.blackColor),
          displayLarge: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: SolidColors.coverTitle),
          displayMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: SolidColors.coverSubTitle),
          titleLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: SolidColors.titleColor),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

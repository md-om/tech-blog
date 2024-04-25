import 'package:tech_blog/Constants/themecolors.dart';
import 'package:tech_blog/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/views/register_intro.dart';
import 'package:tech_blog/views/splash_screen.dart';
import 'package:tech_blog/views/user_cats.dart';

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
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(width: 2),
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                )),
                backgroundColor:
                    MaterialStateProperty.all(SolidColors.primaryColor),
                foregroundColor:
                    MaterialStateProperty.all(SolidColors.whiteColor),
                textStyle: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const TextStyle(
                        fontSize: 26, color: SolidColors.primaryColor);
                  }
                  return const TextStyle(
                      fontSize: 26, color: Color.fromARGB(255, 0, 0, 0));
                }))),
        fontFamily: FontFamily.dana,
        textTheme: const TextTheme(
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
          titleMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SolidColors.blackColor),
          titleSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: SolidColors.hintColor),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // home: const RegisterIntro(),
    );
  }
}

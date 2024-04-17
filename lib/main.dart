import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        fontFamily: 'dana',
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Text('Salam'),
    );
  }
}

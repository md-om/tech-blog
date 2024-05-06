import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/Constants/themecolors.dart';
import 'package:tech_blog/components/app_component.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: techAppbar('لیست مقالات'),
    ));
  }
}

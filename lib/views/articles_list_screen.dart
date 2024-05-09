import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tech_blog/Models/articles.dart';
import 'package:tech_blog/components/app_component.dart';
import 'package:tech_blog/controller/articles_screen.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});
  final ArticleScreenController articleScreenController =
      Get.put(ArticleScreenController());

  @override
  Widget build(BuildContext context) {
    var ascal = articleScreenController.articleList;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: techAppbar('لیست مقالات'),
      body: listScreen(ascal, screenWidth, screenHeight),
    ));
  }
}

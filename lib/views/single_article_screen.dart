import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/Constants/strings.dart';
import 'package:tech_blog/Constants/themecolors.dart';
import 'package:tech_blog/components/app_component.dart';
import 'package:tech_blog/controller/single_article_screen.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/views/articles_list_screen.dart';

class SingleArticleScreen extends StatelessWidget {
  SingleArticleScreen({super.key});
  // final SingleArticleController articleScreenController =
  //     Get.put(SingleArticleController());
  @override
  Widget build(BuildContext context) {
    // var asca = articleScreenController.article;
    var screenHeight = MediaQuery.of(context).size.height;
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double centerMargin = size.width / 16;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    placeholder: (context, url) => const SpinKitFadingGrid(
                        color: SolidColors.dividerColor),
                    imageUrl: '',
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Image(
                          image: Assets.images.public.error.provider());
                    },
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: GradientColor.singleBlog,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            CupertinoIcons.arrow_right,
                            color: SolidColors.whiteColor,
                          ),
                          Expanded(child: SizedBox()),
                          Icon(
                            Icons.bookmark_outline_rounded,
                            color: SolidColors.whiteColor,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.share, color: SolidColors.whiteColor),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Text(
                'رازهای اساسینز کرید والهالا؛ از هری پاتر و ارباب حلقه‌ها تا دارک سولز',
                style: textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Image(
                    image: Assets.images.public.defaultAvatar.provider(),
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'فاطمه امیری',
                    style: textTheme.bodySmall,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '2 روز پیش',
                    style: textTheme.displaySmall,
                  )
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: centerMargin, right: centerMargin),
                child: const HtmlWidget('''
                  <h1> H1 Element </h1>
                  <h2> H1 Element </h2>
                  <h3> H1 Element </h3>
                  <h4> H1 Element </h4>
                  <h5> H1 Element </h5>
                  '''),
              ),
              // Tags
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: SizedBox(
                  height: 45,
                  child: GridView.builder(
                    itemCount: 5,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10,
                            childAspectRatio: .3),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: centerMargin),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: SolidColors.favTagsBg,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'تست',
                              style: textTheme.titleMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24, right: centerMargin),
                child: Row(
                  children: [
                    ImageIcon(
                      Assets.images.icons.pen.provider(),
                      color: SolidColors.titleColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      TextStrings.relatedPost,
                      style: textTheme.titleLarge,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 3.5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          16, 10, index == 0 ? centerMargin : 16, 5),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height / 5.4,
                            width: size.width / 2.5,
                            child: CachedNetworkImage(
                              imageUrl: '',
                              imageBuilder: (context, imageProvider) =>
                                  Stack(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                  foregroundDecoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    gradient: LinearGradient(
                                        colors: GradientColor.blogOverlay,
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.center),
                                  ),
                                ),
                                Positioned(
                                    bottom: 10,
                                    right: 0,
                                    left: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'نویسنده',
                                          style: textTheme.displayMedium,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '100 بازدید',
                                              style: textTheme.displayMedium,
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            const Icon(
                                              Icons.remove_red_eye_sharp,
                                              size: 16,
                                              color: SolidColors.whiteColor,
                                            )
                                          ],
                                        ),
                                      ],
                                    ))
                              ]),
                              errorWidget: (context, url, error) {
                                return const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 35,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: SizedBox(
                              width: size.width / 2.5,
                              child: Text(
                                'تست پست',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

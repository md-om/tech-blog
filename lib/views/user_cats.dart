import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_blog/Constants/strings.dart';
import 'package:tech_blog/Constants/themecolors.dart';
import 'package:tech_blog/Models/fake_data.dart';
import 'package:tech_blog/Models/list.dart';
import 'package:tech_blog/components/app_component.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class UserCats extends StatefulWidget {
  const UserCats({super.key});

  @override
  State<UserCats> createState() => _UserCatsState();
}

class _UserCatsState extends State<UserCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double centerMargin = size.width / 16;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: centerMargin, right: centerMargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 64,
                ),
                SvgPicture.asset(
                  Assets.images.public.techbot.path,
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  TextStrings.successRegisterMsg,
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: centerMargin, right: centerMargin),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        hintText: 'نام و نام خانوادگی',
                        hintStyle: textTheme.titleSmall),
                  ),
                ),
                // Category Tags
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: SizedBox(
                    height: 130,
                    child: GridView.builder(
                      itemCount: tagCategory.length,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 3,
                              mainAxisSpacing: 3,
                              childAspectRatio: .3),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              favCategory.add(
                                  ListTags(title: tagCategory[index].title));
                            });
                          },
                          child: CatsTags(
                            centerMargin: centerMargin,
                            textTheme: textTheme,
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Image.asset(
                  Assets.images.public.downArrow.path,
                  scale: 2,
                ),
                const SizedBox(
                  height: 16,
                ),
                // FavTags
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: SizedBox(
                    height: 45,
                    child: GridView.builder(
                      itemCount: favCategory.length,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 10,
                              childAspectRatio: .3),
                      itemBuilder: (context, index) {
                        return favCategory.isNotEmpty
                            ? Container(
                                decoration: const BoxDecoration(
                                  color: SolidColors.favTagsBg,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    favCategory[index].title,
                                    style: textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : null;
                      },
                    ),
                  ),
                ),
                // Continue btn
                Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: SizedBox(
                    width: size.width / 2.67,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserCats(),
                              ));
                        },
                        child: Text(
                          'ادامه',
                          style: textTheme.displayLarge,
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

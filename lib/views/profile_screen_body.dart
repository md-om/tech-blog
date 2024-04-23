import 'package:flutter/material.dart';
import 'package:tech_blog/Constants/strings.dart';
import 'package:tech_blog/Constants/themecolors.dart';
import 'package:tech_blog/components/app_component.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
    required this.size,
    required this.textTheme,
    required this.centerMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double centerMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Image(
            image: Assets.images.public.defaultAvatar.provider(),
            height: 100,
          ),
          const SizedBox(
            height: 12,
          ),
          EditProfileText(centerMargin: centerMargin, textTheme: textTheme),
          const SizedBox(
            height: 60,
          ),
          Text(
            'مهرداد حسینی',
            style: textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'mehrdad3373@hotmail.com',
            style: textTheme.bodySmall,
          ),
          const SizedBox(
            height: 48,
          ),
          Divder(size: size),
          SizedBox(
            height: 40,
            child: InkWell(
              onTap: () {},
              splashColor: SolidColors.primaryColor,
              child: Center(
                child: Text(
                  TextStrings.favArticle,
                  style: textTheme.bodyMedium,
                ),
              ),
            ),
          ),
          Divder(size: size),
          SizedBox(
            height: 40,
            child: InkWell(
              onTap: () {},
              splashColor: SolidColors.primaryColor,
              child: Center(
                child: Text(
                  TextStrings.favPodcast,
                  style: textTheme.bodyMedium,
                ),
              ),
            ),
          ),
          Divder(size: size),
          SizedBox(
            height: 40,
            child: InkWell(
              onTap: () {},
              splashColor: SolidColors.primaryColor,
              child: Center(
                child: Text(
                  TextStrings.logout,
                  style: textTheme.bodyMedium,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          )
        ]));
  }
}

class EditProfileText extends StatelessWidget {
  const EditProfileText({
    super.key,
    required this.centerMargin,
    required this.textTheme,
  });

  final double centerMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, centerMargin, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageIcon(
            Assets.images.icons.pen.provider(),
            color: SolidColors.titleColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            TextStrings.editProfileImage,
            style: textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

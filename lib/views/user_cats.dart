import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_blog/Constants/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class UserCats extends StatelessWidget {
  const UserCats({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double centerMargin = size.width / 16;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.public.techbot,
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
              padding: EdgeInsets.only(left: centerMargin, right: centerMargin),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    hintText: 'نام و نام خانوادگی',
                    hintStyle: textTheme.titleSmall),
              ),
            )
          ],
        ),
      ),
    );
  }
}

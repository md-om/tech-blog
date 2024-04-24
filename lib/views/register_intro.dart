import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/Constants/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/views/user_cats.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.public.techbot,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: TextStrings.welcomemsg,
                      style: textTheme.titleMedium,
                    )),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: size.width / 2.67,
                child: ElevatedButton(
                  onPressed: () {
                    _showEmailModal(context, textTheme, size);
                  },
                  child: Text(
                    "بزن بریم",
                    style: textTheme.displayLarge,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailModal(
      BuildContext context, TextTheme textTheme, Size size) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            // Set Modal sheet top of the keyboard
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TextStrings.enterEmail,
                      style: textTheme.bodyMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              hintText: 'Example: your.name@gmail.com',
                              hintStyle: textTheme.titleSmall),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2.67,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _showConfirmCodeModal(context, textTheme, size);
                          },
                          child: Text(
                            'ادامه',
                            style: textTheme.displayLarge,
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<dynamic> _showConfirmCodeModal(
      BuildContext context, TextTheme textTheme, Size size) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            // Set Modal sheet top of the keyboard
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TextStrings.confirmCode,
                      style: textTheme.bodyMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              hintText: '******',
                              hintStyle: textTheme.titleSmall),
                        ),
                      ),
                    ),
                    SizedBox(
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
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

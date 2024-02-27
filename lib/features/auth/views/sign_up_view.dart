import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smart_home/animations/fade_in_slide.dart';
import 'package:smart_home/common/loading_overlay.dart';
import 'package:smart_home/common/text_style_ext.dart';
import 'package:smart_home/features/auth/widgets/widgets.dart';
import 'package:smart_home/router/app_routes.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> termsCheck = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),
          FadeInSlide(
            duration: .3,
            child: Text(
              "Join Smartome Today 👤",
              style: context.hm!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          FadeInSlide(
            duration: .4,
            child: Text(
              "Join Smartome, Your Gateway to Smart Living.",
              style: context.tm,
            ),
          ),
          const SizedBox(height: 25),
          FadeInSlide(
            duration: .5,
            child: Text(
              "Email",
              style: context.tm!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          const FadeInSlide(
            duration: .5,
            child: EmailField(),
          ),
          const SizedBox(height: 20),
          FadeInSlide(
            duration: .6,
            child: Text(
              "Password",
              style: context.tm!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          const FadeInSlide(
            duration: .6,
            child: PasswordField(),
          ),
          const SizedBox(height: 20),
          FadeInSlide(
            duration: .7,
            child: Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: termsCheck,
                  builder: (context, value, child) {
                    return CupertinoCheckbox(
                      inactiveColor: isDark ? Colors.white : Colors.black87,
                      value: value,
                      onChanged: (_) {
                        termsCheck.value = !termsCheck.value;
                      },
                    );
                  },
                ),
                RichTwoPartsText(
                  text1: "I agree to Smartome ",
                  text2: "Terms and Conditions.",
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          FadeInSlide(
            duration: .8,
            child: RichTwoPartsText(
              text1: "Already have an account? ",
              text2: "Sign In",
              onTap: () {
                context.pushReplacementNamed(AppRoutes.signIn.name);
              },
            ),
          ),
          const SizedBox(height: 30),
          FadeInSlide(
            duration: .9,
            child: Row(
              children: [
                const Expanded(
                    child: Divider(
                  thickness: .3,
                )),
                Text(
                  "   or   ",
                  style: context.tm,
                ),
                const Expanded(
                    child: Divider(
                  thickness: .3,
                )),
              ],
            ),
          ),
          const SizedBox(height: 20),
          FadeInSlide(
            duration: 1.0,
            child: LoginButton(
              icon: Brand(Brands.google, size: 25),
              text: "Continue with Google",
              onPressed: () {},
            ),
          ),
          SizedBox(height: height * 0.02),
          FadeInSlide(
            duration: 1.1,
            child: LoginButton(
              icon: Icon(
                Icons.apple,
                color: isDark ? Colors.white : Colors.black,
              ),
              text: "Continue with Apple",
              onPressed: () {},
            ),
          ),
          SizedBox(height: height * 0.02),
          FadeInSlide(
            duration: 1.2,
            child: LoginButton(
              icon: Brand(Brands.facebook, size: 25),
              text: "Continue with Facebook",
              onPressed: () {},
            ),
          ),
          SizedBox(height: height * 0.02),
          FadeInSlide(
            duration: 1.3,
            child: LoginButton(
              icon: Brand(Brands.twitter, size: 25),
              text: "Continue with Twitter",
              onPressed: () {},
            ),
          ),
        ],
      ),
      // persistentFooterAlignment: AlignmentDirectional.center,
      bottomNavigationBar: FadeInSlide(
        duration: 1,
        direction: FadeSlideDirection.btt,
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 30),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: .2, color: Colors.white),
            ),
          ),
          child: FilledButton(
            onPressed: () async {
              LoadingScreen.instance()
                  .show(context: context, text: "Sign Up...");
              await Future.delayed(const Duration(seconds: 1));
              for (var i = 0; i <= 100; i++) {
                LoadingScreen.instance().show(context: context, text: '$i...');
                await Future.delayed(const Duration(milliseconds: 10));
              }
              LoadingScreen.instance()
                  .show(context: context, text: "Signed Up New User");
              await Future.delayed(const Duration(seconds: 1));
              LoadingScreen.instance().hide();
              context.goNamed(AppRoutes.signIn.name);
            },
            style: FilledButton.styleFrom(
              fixedSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}

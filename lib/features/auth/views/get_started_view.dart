import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smart_home/animations/fade_in_slide.dart';
import 'package:smart_home/common/app_colors.dart';
import 'package:smart_home/features/auth/widgets/widgets.dart';
import 'package:smart_home/router/app_routes.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    final height = size.height;
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            const FadeInSlide(
              duration: .4,
              child: Icon(
                Icons.dashboard_rounded,
                size: 60,
              ),
            ),
            const Spacer(),
            FadeInSlide(
              duration: .5,
              child: Text(
                "Let's Get Started!",
                style: theme.textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height * 0.015),
            const FadeInSlide(
              duration: .6,
              child: Text(
                "Let's dive in into your account",
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            FadeInSlide(
              duration: .7,
              child: LoginButton(
                icon: Brand(Brands.google, size: 25),
                text: "Continue with Google",
                onPressed: () {},
              ),
            ),
            SizedBox(height: height * 0.02),
            FadeInSlide(
              duration: .8,
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
              duration: .9,
              child: LoginButton(
                icon: Brand(Brands.facebook, size: 25),
                text: "Continue with Facebook",
                onPressed: () {},
              ),
            ),
            SizedBox(height: height * 0.02),
            FadeInSlide(
              duration: 1.0,
              child: LoginButton(
                icon: Brand(Brands.twitter, size: 25),
                text: "Continue with Twitter",
                onPressed: () {},
              ),
            ),
            const Spacer(),
            FadeInSlide(
              duration: 1.1,
              child: FilledButton(
                onPressed: () => context.push(AppRoutes.signUp.path),
                style: FilledButton.styleFrom(
                  fixedSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            FadeInSlide(
              duration: 1.2,
              child: FilledButton(
                onPressed: () => context.push(AppRoutes.signIn.path),
                style: FilledButton.styleFrom(
                  fixedSize: const Size.fromHeight(50),
                  backgroundColor: isDark
                      ? AppColors.greyColor
                      : theme.colorScheme.primaryContainer,
                ),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: isDark ? Colors.white : AppColors.seedColor,
                  ),
                ),
              ),
            ),
            const Spacer(),
            const FadeInSlide(
              duration: 1.0,
              direction: FadeSlideDirection.btt,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Privacy Policy"),
                  Text("   -   "),
                  Text("Terms of Service"),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }
}

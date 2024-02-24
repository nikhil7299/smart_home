import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/animations/fade_in_slide.dart';
import 'package:smart_home/common/app_colors.dart';
import 'package:smart_home/common/clippers.dart';
import 'package:smart_home/features/oboarding/onboarding_data.dart';
import 'package:smart_home/router/app_routes.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final brightness = MediaQuery.platformBrightnessOf(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: onboardingData.length,
              controller: _pageController,
              clipBehavior: Clip.none,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingWidget(
                  assetPathLight: onboardingData[index].assetPathLight,
                  assetPathDark: onboardingData[index].assetPathDark,
                  title: onboardingData[index].title,
                  subTitle: onboardingData[index].subTitle,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(onboardingData.length, (index) {
                return Indicator(isActive: index == _pageIndex);
              }),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(thickness: .2),
          const SizedBox(height: 20),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeOut,
            child: _pageIndex < 2
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilledButton(
                        onPressed: () {
                          _pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOut);
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: brightness == Brightness.dark
                              ? AppColors.greyColor
                              : theme.colorScheme.primaryContainer,
                          fixedSize: Size(size.width * 0.42, 50),
                        ),
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: brightness == Brightness.dark
                                ? Colors.white
                                : AppColors.seedColor,
                          ),
                        ),
                      ),
                      FilledButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                          );
                        },
                        style: FilledButton.styleFrom(
                          fixedSize: Size(size.width * 0.42, 50),
                        ),
                        child: const Text("Continue",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                : FilledButton(
                    onPressed: () => context.go(AppRoutes.getStarted.path),
                    style: FilledButton.styleFrom(
                        fixedSize: Size(size.width * 0.9, 50)),
                    child: const Text(
                      "Let's Get Started",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final PageController _pageController;
  final bool isLastPage;
  const CustomButton({
    super.key,
    required PageController pageController,
    this.isLastPage = false,
  }) : _pageController = pageController;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: isLastPage ? 120 : 50,
      height: 50,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.seedColor,
          padding: EdgeInsets.zero,
        ),
        child: isLastPage
            ? RichText(
                text: TextSpan(
                  text: "Log In ",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                  children: const [
                    WidgetSpan(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                      ),
                    )
                  ],
                ),
              )
            : const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
        onPressed: () {
          if (isLastPage) {
            // Navigator.push(
            //   context,
            //   LoginView.route(),
            // );

            // Navigator.pushReplacement(context, LoginView.route());
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
            );
          }
        },
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({
    super.key,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 200,
      ),
      curve: Curves.easeOut,
      width: isActive ? 30 : 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Colors.grey.withOpacity(.3),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class OnboardingWidget extends StatelessWidget {
  final String assetPathLight;
  final String assetPathDark;
  final String title;
  final String subTitle;
  const OnboardingWidget({
    super.key,
    required this.assetPathLight,
    required this.assetPathDark,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipPath(
          clipper: ArcClipper(),
          child: Stack(
            children: [
              Container(
                height: size.height * 0.55,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                ),
              ),
              Positioned(
                bottom: -30,
                left: 0,
                right: 0,
                child: FadeInSlide(
                  duration: .5,
                  fadeOffset: size.height * 0.25,
                  direction: FadeSlideDirection.btt,
                  child: Image.asset(
                    isDark ? assetPathDark : assetPathLight,
                    height: size.height * 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: FadeInSlide(
            duration: .5,
            fadeOffset: 60,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: textTheme.headlineLarge!.copyWith(
                height: 1.3,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: FadeInSlide(
            duration: .6,
            fadeOffset: 60,
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: textTheme.titleMedium!.copyWith(height: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/animations/fade_in_slide.dart';
import 'package:smart_home/common/app_colors.dart';
import 'package:smart_home/common/clippers.dart';
import 'package:smart_home/common/text_style_ext.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: onboardingData.length,
              controller: _pageController,
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
          SizedBox(height: size.height * 0.01),
          const Divider(thickness: .2),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.02, bottom: size.height * 0.043),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeOutBack,
          switchOutCurve: Curves.easeOutBack,
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
                        backgroundColor: isDark
                            ? AppColors.greyColor
                            : colorScheme.primaryContainer,
                        fixedSize: Size(size.width * 0.42, 50),
                      ),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: isDark ? Colors.white : colorScheme.primary,
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
                  curve: Curves.easeOutBack,
                  child: Image.asset(
                    isDark ? assetPathDark : assetPathLight,
                    height: size.height * 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: size.height * 0.02),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FadeInSlide(
            duration: .5,
            fadeOffset: 60,
            curve: Curves.easeOutBack,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: context.hl!.copyWith(
                height: 1.3,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.02),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: FadeInSlide(
            duration: .5,
            fadeOffset: 60,
            curve: Curves.easeOutBack,
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: context.tm!.copyWith(height: 1.5),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

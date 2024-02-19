import 'package:smart_home/common/app_assets.dart';
import 'package:smart_home/common/app_strings.dart';
import 'package:smart_home/features/oboarding/onboarding_model.dart';

final List<OnboardingModel> onboardingData = [
  const OnboardingModel(
    assetPath: AppAssets.onboardingOne,
    title: AppStrings.onboardingOneTitle,
    subTitle: AppStrings.onboardingOneSubtitle,
  ),
  const OnboardingModel(
    assetPath: AppAssets.onboardingTwo,
    title: AppStrings.onboardingTwoTitle,
    subTitle: AppStrings.onboardingTwoSubtitle,
  ),
  const OnboardingModel(
    assetPath: AppAssets.onboardingThree,
    title: AppStrings.onboardingThreeTitle,
    subTitle: AppStrings.onboardingThreeSubtitle,
  ),
];

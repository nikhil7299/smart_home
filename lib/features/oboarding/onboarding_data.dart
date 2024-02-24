import 'package:smart_home/common/app_assets.dart';
import 'package:smart_home/common/app_strings.dart';
import 'package:smart_home/features/oboarding/onboarding_model.dart';

final List<OnboardingModel> onboardingData = [
  const OnboardingModel(
    assetPathLight: AppAssets.onboardOneLight,
    assetPathDark: AppAssets.onboardOneDark,
    title: AppStrings.onboardingOneTitle,
    subTitle: AppStrings.onboardingOneSubtitle,
  ),
  const OnboardingModel(
    assetPathLight: AppAssets.onboardTwoLight,
    assetPathDark: AppAssets.onboardTwoDark,
    title: AppStrings.onboardingTwoTitle,
    subTitle: AppStrings.onboardingTwoSubtitle,
  ),
  const OnboardingModel(
    assetPathLight: AppAssets.onboardThreeLight,
    assetPathDark: AppAssets.onboardThreeDark,
    title: AppStrings.onboardingThreeTitle,
    subTitle: AppStrings.onboardingThreeSubtitle,
  ),
];

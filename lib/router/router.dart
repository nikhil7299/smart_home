import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/features/auth/views/get_started_view.dart';
import 'package:smart_home/features/auth/views/sign_in_view.dart';
import 'package:smart_home/features/auth/views/sign_up_view.dart';
import 'package:smart_home/features/oboarding/onboarding_view.dart';
import 'package:smart_home/router/app_routes.dart';

final router = GoRouter(
  initialLocation: AppRoutes.onboard.path,
  // redirect: (context, state) async{

  // },
  routes: [
    GoRoute(
      path: AppRoutes.onboard.path,
      name: AppRoutes.onboard.name,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: AppRoutes.getStarted.path,
      name: AppRoutes.getStarted.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: GetStartedView(),
      ),
    ),
    GoRoute(
      path: AppRoutes.signUp.path,
      name: AppRoutes.signUp.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: SignUpView(),
      ),
    ),
    GoRoute(
      path: AppRoutes.signIn.path,
      name: AppRoutes.signIn.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: SignInView(),
      ),
    ),
    // GoRoute(
    //   path: '/',
    //   name: 'home',
    //   pageBuilder: (context, state) => const CupertinoPage(
    //     child: HomeView(),
    //   ),
    // ),
  ],
);

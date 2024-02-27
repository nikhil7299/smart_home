import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:smart_home/animations/fade_in_slide.dart';
import 'package:smart_home/common/text_style_ext.dart';
import 'package:smart_home/router/app_routes.dart';

class PasswordChangedView extends StatelessWidget {
  const PasswordChangedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const FadeInSlide(
              duration: .4, child: Icon(IconlyBold.login, size: 60)),
          const SizedBox(height: 20),
          FadeInSlide(
            duration: .5,
            child: Text(
              "You're All Set!",
              textAlign: TextAlign.center,
              style: context.hm!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          FadeInSlide(
            duration: .6,
            child: Text(
              "Your Password has been successfully changed",
              textAlign: TextAlign.center,
              style: context.tm,
            ),
          ),
        ],
      ),
      bottomNavigationBar: FadeInSlide(
        duration: 1,
        direction: FadeSlideDirection.btt,
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 30),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: .2, color: Colors.grey),
            ),
          ),
          child: FilledButton(
            onPressed: () async {
              context.goNamed(AppRoutes.signIn.name);
            },
            style: FilledButton.styleFrom(
              fixedSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              "Back To Login",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}

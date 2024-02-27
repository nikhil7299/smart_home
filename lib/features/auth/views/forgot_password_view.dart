import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:smart_home/animations/fade_in_slide.dart';
import 'package:smart_home/common/app_colors.dart';
import 'package:smart_home/common/loading_overlay.dart';
import 'package:smart_home/common/text_style_ext.dart';
import 'package:smart_home/router/app_routes.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),
          FadeInSlide(
            duration: .4,
            child: Text(
              "Forgot Your Password 🔑",
              style: context.hm!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          FadeInSlide(
            duration: .5,
            child: Text(
              "We've got you covered. Enter your registered email to reset your password. We will send an OTP code to your email for the next steps.",
              style: context.tm,
            ),
          ),
          const SizedBox(height: 25),
          FadeInSlide(
            duration: .6,
            child: Text(
              "Your Registered Email",
              style: context.tm!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          FadeInSlide(
            duration: .7,
            child: TextField(
              onTapOutside: (event) =>
                  FocusManager.instance.primaryFocus!.unfocus(),
              cursorColor: isDark ? Colors.grey : Colors.black54,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.textFieldColor,
                hintText: "Email",
                prefixIcon: const Icon(IconlyLight.message, size: 20),
                prefixIconColor: isDark ? Colors.white : Colors.black87,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
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
              final goRouter = GoRouter.of(context);
              LoadingScreen.instance()
                  .show(context: context, text: "Sending OTP...");
              await Future.delayed(const Duration(seconds: 1));
              for (var i = 0; i <= 100; i++) {
                LoadingScreen.instance().show(context: context, text: '$i...');
                await Future.delayed(const Duration(milliseconds: 10));
              }
              LoadingScreen.instance()
                  .show(context: context, text: "OTP Sent Successfully");
              await Future.delayed(const Duration(seconds: 1));
              LoadingScreen.instance().hide();
              goRouter.pushNamed(AppRoutes.otpInput.name);
            },
            style: FilledButton.styleFrom(
              fixedSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              "Send OTP Code",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}

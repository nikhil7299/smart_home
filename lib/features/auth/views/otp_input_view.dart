import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/animations/fade_in_slide.dart';
import 'package:smart_home/common/app_colors.dart';
import 'package:smart_home/common/text_style_ext.dart';
import 'package:smart_home/router/app_routes.dart';

class OTPInputView extends StatelessWidget {
  const OTPInputView({super.key});

  @override
  Widget build(BuildContext context) {
    final count = ValueNotifier(6);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count.value--;
      if (timer.tick == 6 || !context.mounted) {
        timer.cancel();
      }
    });

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),
          FadeInSlide(
            duration: .4,
            child: Text(
              "Enter OTP Code 🔐",
              style: context.hm!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          FadeInSlide(
            duration: .5,
            child: Text(
              "Please check your email inbox for a message from Smartome. Enter the one-time verification code below.",
              style: context.tm,
            ),
          ),
          const SizedBox(height: 25),
          _buildPinPut(context),
          const SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: count,
            builder: (context, value, child) {
              return Column(
                children: [
                  FadeInSlide(
                    duration: .7,
                    child: Text(
                      "You can resend the code in $value seconds",
                      style: context.tm,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),
                  FadeInSlide(
                    duration: .8,
                    child: TextButton(
                      onPressed: value > 0 ? null : () {},
                      child: const Text("Resend Code"),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPinPut(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 80,
      height: 70,
      textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: AppColors.textFieldColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: AppColors.seedColor.withOpacity(.1),
      border: Border.all(color: AppColors.seedColor, width: 2),
      borderRadius: BorderRadius.circular(15),
    );

    // final submittedPinTheme = defaultPinTheme.copyWith(
    //   decoration: defaultPinTheme.decoration?.copyWith(
    //     color: const Color.fromRGBO(234, 239, 243, 1),
    //   ),
    // );

    return FadeInSlide(
      duration: .6,
      child: Pinput(
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        // submittedPinTheme: submittedPinTheme,
        validator: (s) {
          return s == '2222' ? null : 'Pin is incorrect';
        },
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        autofocus: true,
        onCompleted: (pin) {
          print(pin);
          if (pin == '2222') {
            context.goNamed(AppRoutes.newPassword.name);
          }
        },
      ),
    );
  }
}

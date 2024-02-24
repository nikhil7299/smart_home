import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/common/loading_overlay.dart';
import 'package:smart_home/common/text_style_ext.dart';
import 'package:smart_home/features/auth/widgets/widgets.dart';
import 'package:smart_home/router/app_routes.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20),
          Text(
            "Secure Your Account 🔒",
            style: context.hm!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Text(
            'Almost there! Create a new password for your Smartify account to keep it secure. Remember to choose a strong and unique password.',
            style: context.tm,
          ),
          const SizedBox(height: 35),
          Text(
            "New Password",
            style: context.tm!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          PasswordField(isDark: isDark),
          const SizedBox(height: 25),
          Text(
            "Confirm New Password",
            style: context.tm!.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          PasswordField(isDark: isDark),
        ],
      ),
      bottomNavigationBar: Container(
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
                .show(context: context, text: "Changing Password");
            await Future.delayed(const Duration(seconds: 1));
            for (var i = 0; i <= 100; i++) {
              LoadingScreen.instance().show(context: context, text: '$i...');
              await Future.delayed(const Duration(milliseconds: 10));
            }
            LoadingScreen.instance()
                .show(context: context, text: "Password Changed Successfully");
            await Future.delayed(const Duration(seconds: 1));
            LoadingScreen.instance().hide();
            goRouter.goNamed(AppRoutes.passwordChanged.name);
          },
          style: FilledButton.styleFrom(
            fixedSize: const Size(double.infinity, 50),
          ),
          child: const Text(
            "Save New Password",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}

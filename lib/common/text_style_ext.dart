import 'package:flutter/material.dart';

extension UIThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  //textTheme
  TextStyle? get bl => theme.textTheme.bodyLarge;
  TextStyle? get bm => theme.textTheme.bodyMedium;
  TextStyle? get bs => theme.textTheme.bodySmall;
  TextStyle? get dl => theme.textTheme.displayLarge;
  TextStyle? get dm => theme.textTheme.displayMedium;
  TextStyle? get ds => theme.textTheme.displaySmall;
  TextStyle? get hl => theme.textTheme.headlineLarge;
  TextStyle? get hm => theme.textTheme.headlineMedium;
  TextStyle? get hs => theme.textTheme.headlineSmall;
  TextStyle? get ll => theme.textTheme.labelLarge;
  TextStyle? get lm => theme.textTheme.labelMedium;
  TextStyle? get ls => theme.textTheme.labelSmall;
  TextStyle? get tl => theme.textTheme.titleLarge;
  TextStyle? get tm => theme.textTheme.titleMedium;
  TextStyle? get ts => theme.textTheme.titleSmall;
  //primaryTextTheme
  TextStyle? get pbl => theme.primaryTextTheme.bodyLarge;
  TextStyle? get pbm => theme.primaryTextTheme.bodyMedium;
  TextStyle? get pbs => theme.primaryTextTheme.bodySmall;
  TextStyle? get pdl => theme.primaryTextTheme.displayLarge;
  TextStyle? get pdm => theme.primaryTextTheme.displayMedium;
  TextStyle? get pds => theme.primaryTextTheme.displaySmall;
  TextStyle? get phl => theme.primaryTextTheme.headlineLarge;
  TextStyle? get phm => theme.primaryTextTheme.headlineMedium;
  TextStyle? get phs => theme.primaryTextTheme.headlineSmall;
  TextStyle? get pll => theme.primaryTextTheme.labelLarge;
  TextStyle? get plm => theme.primaryTextTheme.labelMedium;
  TextStyle? get pls => theme.primaryTextTheme.labelSmall;
  TextStyle? get ptl => theme.primaryTextTheme.titleLarge;
  TextStyle? get ptm => theme.primaryTextTheme.titleMedium;
  TextStyle? get pts => theme.primaryTextTheme.titleSmall;
}

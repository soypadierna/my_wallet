import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:my_wallet/core/theme/app_colors.dart';

abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
  static const double screenPadding = 16;
}

abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 20;
  static const double xl = 28;
  static const double sheet = 32;
  static const double header = 40;
  static const double pill = 999;

  static const BorderRadius card = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius button = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius chip = BorderRadius.all(Radius.circular(md));
  static const BorderRadius pillRadius =
      BorderRadius.all(Radius.circular(pill));
  static const BorderRadius sheetTop = BorderRadius.vertical(
    top: Radius.circular(sheet),
  );
  static const BorderRadius headerBottom = BorderRadius.vertical(
    bottom: Radius.circular(header),
  );
}

abstract final class AppTextStyles {
  static TextStyle get _base => GoogleFonts.inter(
        color: AppColors.textPrimary,
        letterSpacing: -0.2,
      );

  /// Monto grande ($12.329) bold.
  static TextStyle get amountLarge => _base.copyWith(
        fontSize: 56,
        fontWeight: FontWeight.w800,
        letterSpacing: -2,
        height: 1.1,
      );

  /// Monto grande para pantallas oscuras ($3.569).
  static TextStyle get amountLargeOnDark =>
      amountLarge.copyWith(color: AppColors.textOnDark, fontSize: 52);

  /// Centavos pequeños y grises (,20).
  static TextStyle get amountCents => _base.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        letterSpacing: 0,
      );

  static TextStyle get amountCentsOnDark =>
      amountCents.copyWith(color: AppColors.textOnDarkSecondary);

  static TextStyle get amountMedium => _base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get sectionTitle => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get sectionTitleOnDark =>
      sectionTitle.copyWith(color: AppColors.textOnDark);

  static TextStyle get screenTitle => _base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.textOnDark,
      );

  static TextStyle get greeting => _base.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 1.2,
      );

  static TextStyle get greetingMuted =>
      greeting.copyWith(color: AppColors.textSecondary);

  static TextStyle get subtitle => _base.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  static TextStyle get body => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get transactionAmount => _base.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
      );

  static TextStyle get chip => _base.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnDark,
        letterSpacing: 0,
      );

  static TextStyle get button => _base.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        color: AppColors.textOnDark,
      );

  static TextStyle get keypad => _base.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get axisLabel => _base.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: AppColors.textOnDark,
      );

  static TextStyle get axisSubLabel => _base.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: AppColors.textOnDarkSecondary,
      );
}

abstract final class AppTheme {
  static ThemeData get theme {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.lavender,
        onPrimary: AppColors.textPrimary,
        secondary: AppColors.green,
        surface: AppColors.background,
        onSurface: AppColors.textOnDark,
      ),
    );

    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: AppColors.textOnDark,
        displayColor: AppColors.textOnDark,
      ),
      splashFactory: NoSplash.splashFactory,
      dividerColor: AppColors.divider,
    );
  }
}
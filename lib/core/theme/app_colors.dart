import 'package:flutter/material.dart';

abstract final class AppColors {
  // Fondos oscuros
  static const Color background = Color(0xFF000000);
  static const Color backgroundSoft = Color(0xFF1A1A1C);
  static const Color backgroundGradientTop = Color(0xFF2E2E31);
  static const Color surfaceDark = Color(0xFF3F3F45);
  static const Color surfaceDarkAlt = Color(0xFF55555C);

  // Lavanda (header y teclado)
  static const Color lavender = Color(0xFFCECAE6);
  static const Color lavenderKey = Color(0xFFDCDAF2);
  static const Color lavenderDark = Color(0xFFB9B5DA);

  // Botones Send / Request
  static const Color actionButton = Color(0xFF4B4B53);

  // Tarjetas y hoja clara
  static const Color sheet = Color(0xFFE7E8E7);
  static const Color card = Color(0xFFF3F4F3);
  static const Color cardMuted = Color(0xFFE2E3E2);
  static const Color iconCircle = Color(0xFFE4E5E4);

  // Verde (chips y gráfica)
  static const Color green = Color(0xFF5B9A2D);
  static const Color greenDark = Color(0xFF2F4F1A);
  static const Color greenFill = Color(0xFF3E6A1F);
  static const Color greenLight = Color(0xFFCFE6B8);

  // Texto
  static const Color textPrimary = Color(0xFF0B0B0C);
  static const Color textOnDark = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8A8A90);
  static const Color textOnDarkSecondary = Color(0xFF9B9BA2);
  static const Color textMuted = Color(0xFFB4B4BA);

  // Varios
  static const Color divider = Color(0x1F000000);
  static const Color handle = Color(0xFF3A3A3D);
  static const Color transparent = Color(0x00000000);
}
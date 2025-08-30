import 'package:daily_list/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.textAlign,
    this.decoration,
    this.letterSpacing,
    this.style,
    this.decorationColor,
    this.softWrap = false,
    this.isLocalizedKey =
        true, // Bu parameter bilan localizatsiya key yoki oddiy text ekanligini belgilaymiz
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final int? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? letterSpacing;
  final TextStyle? style;
  final Color? decorationColor;
  final bool softWrap;
  final bool
  isLocalizedKey; // Agar true bo'lsa text localization key, false bo'lsa oddiy text

  @override
  Widget build(BuildContext context) {
    final fw = AppFonts.getFontWeight(fontWeight);
    final localizedText = isLocalizedKey ? text.tr() : text;

    return Text(
      localizedText,
      softWrap: softWrap,
      style:
          style ??
          TextStyle(
            fontSize: fontSize,
            fontWeight: fw,
            color: color ?? AppColors.primary,
            fontFamily: AppFonts.getFontFamily(fontWeight),
            letterSpacing: letterSpacing,
            overflow: TextOverflow.ellipsis,
            decoration: decoration ?? TextDecoration.none,
            decorationColor: decorationColor ?? Colors.black,
          ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

// Qo'shimcha: named argumentlar bilan localization uchun
class AppTextWithArgs extends StatelessWidget {
  const AppTextWithArgs({
    super.key,
    required this.text,
    this.namedArgs,
    this.args,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.textAlign,
    this.decoration,
    this.letterSpacing,
    this.style,
    this.decorationColor,
    this.softWrap = false,
  });

  final String text;
  final Map<String, String>? namedArgs; // Named argumentlar uchun
  final List<String>? args; // Oddiy argumentlar uchun
  final Color? color;
  final double? fontSize;
  final int? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? letterSpacing;
  final TextStyle? style;
  final Color? decorationColor;
  final bool softWrap;

  @override
  Widget build(BuildContext context) {
    final fw = AppFonts.getFontWeight(fontWeight);

    // Argumentlar bilan localized text olish
    String localizedText;
    if (namedArgs != null) {
      localizedText = text.tr(namedArgs: namedArgs!);
    } else if (args != null) {
      localizedText = text.tr(args: args!);
    } else {
      localizedText = text.tr();
    }

    return Text(
      localizedText,
      softWrap: softWrap,
      style:
          style ??
          TextStyle(
            fontSize: fontSize,
            fontWeight: fw,
            color: color,
            fontFamily: AppFonts.getFontFamily(fontWeight),
            letterSpacing: letterSpacing,
            overflow: TextOverflow.ellipsis,
            decoration: decoration ?? TextDecoration.none,
            decorationColor: decorationColor ?? Colors.black,
          ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class AppFonts {
  AppFonts._();

  static const String poppinsRegular = 'PoppinsRegular';
  static const String poppinsMedium = 'PoppinsMedium';
  static const String poppinsSemiBold = 'PoppinsSemiBold';
  static const String poppinsBold = 'PoppinsBold';
  static const String poppinsExtraBold = 'PoppinsExtraBold';
  static const String poppinsBlack = 'PoppinsBlack';

  static String getFontFamily(int? weight) {
    switch (weight) {
      case 400:
        return poppinsRegular;
      case 500:
        return poppinsMedium;
      case 600:
        return poppinsSemiBold;
      case 700:
        return poppinsBold;
      case 800:
        return poppinsExtraBold;
      case 900:
        return poppinsBlack;
      default:
        return poppinsRegular;
    }
  }

  static FontWeight? getFontWeight(int? weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
      default:
        return FontWeight.w400;
    }
  }
}

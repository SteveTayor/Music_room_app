import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Primary font (Syne) - for most text
  static TextStyle get heading1 => GoogleFonts.syne(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: -0.5,
  );

  static TextStyle get heading2 => GoogleFonts.syne(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: -0.3,
  );

  static TextStyle get heading3 => GoogleFonts.syne(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0,
  );

  static TextStyle get subtitle1 => GoogleFonts.syne(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: 0.15,
  );

  static TextStyle get subtitle2 => GoogleFonts.syne(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white70,
    letterSpacing: 0.1,
  );

  static TextStyle get body1 => GoogleFonts.syne(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  static TextStyle get body2 => GoogleFonts.syne(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
    letterSpacing: 0.25,
  );

  static TextStyle get caption => GoogleFonts.syne(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white54,
    letterSpacing: 0.4,
  );

  static TextStyle get button => GoogleFonts.syne(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.75,
  );

  // Decorative font for "Free Demo" text
  static TextStyle get decorativeLobster => GoogleFonts.lobster(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 1.0,
  );

  // App bar title
  static TextStyle get appBarTitle => GoogleFonts.syne(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  // Service card styles
  static TextStyle get serviceTitle => GoogleFonts.syne(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.1,
  );

  static TextStyle get serviceDescription => GoogleFonts.syne(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
    letterSpacing: 0.25,
  );

  // Navigation styles
  static TextStyle get navLabel => GoogleFonts.syne(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
  );

  // Specific text styles matching your design
  static TextStyle get claimYourText => GoogleFonts.syne(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  static TextStyle get freeDemoText => GoogleFonts.lobster(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 1.0,
  );

  static TextStyle get customMusicText => GoogleFonts.syne(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  static TextStyle get hireHandPickedText => GoogleFonts.syne(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  static TextStyle get bookNowText =>
      GoogleFonts.syne(fontWeight: FontWeight.w600, letterSpacing: 0.5);
}

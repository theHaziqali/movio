import 'package:flutter/material.dart';
import 'package:movio/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
@immutable
class AppTheme{
  static const colors=AppColors();

  const AppTheme._();

  static ThemeData define(){
      var baseTheme = ThemeData();
    return ThemeData( textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),

    primaryColor:const Color(0x00f6f6fa),
    focusColor: const Color(0x00827D88));


  }

}
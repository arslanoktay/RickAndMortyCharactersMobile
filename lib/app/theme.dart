import 'package:flutter/material.dart';

class AppTheme {
  // Yeni nesne yaratılmasından kurtulmak için bu şekilde kullanıyoruz
  AppTheme._();


  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'Inter',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light( // kullanıldığı yerde gerekli gerkleri tutacak
      primary: Color(0xFF42B4CA), // hex kodlarında başına 0x geliyor / 0xFF dersek opaklığı max oluyor
      secondary: Color(0xFFD5E9ED),
      surface: Colors.white,
      onSurface: Color(0xFF414A4C), // Yazı arkası arka plan
      error: Color(0xFFEA7979),
      tertiary: Color(0xFFB5C4C7) // altbar renkleri
    ), 
    iconButtonTheme:  IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: const Color(0xFF42B4CA)
      )
    ),
  );
}


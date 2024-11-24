import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  // Yeni nesne yaratılmasından kurtulmak için bu şekilde kullanıyoruz
  ThemeMode themeMode = ThemeMode.system; // telefon temasını oto alır / varsayılan system teması yani
  ThemeData get theme => themeMode == ThemeMode.light ? lightTheme : darkTheme;
  void toggleTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
            // kullanıldığı yerde gerekli gerkleri tutacak
            primary: Color(
                0xFF42B4CA), // hex kodlarında başına 0x geliyor / 0xFF dersek opaklığı max oluyor
            secondary: Color(0xFFD5E9ED),
            surface: Colors.white,
            onSurface: Color(0xFF414A4C), // Yazı arkası arka plan
            error: Color(0xFFEA7979),
            tertiary: Color(0xFFB5C4C7) // altbar renkleri
            ),
        iconButtonTheme: IconButtonThemeData(
            style:
                IconButton.styleFrom(foregroundColor: const Color(0xFF42B4CA))),
      );

  static ThemeData get darkTheme => ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFF414A4C),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF97C3E9), // hex kodlarında başına 0x geliyor / 0xFF dersek opaklığı max oluyor
          secondary: Color(0xFF778899),
          surface: Color(0xFF414A4C),
          onSurface: Colors.white, // Yazı arkası arka plan
          error: Color(0xFF414A4C),
          tertiary: Color(0xFFB5C4C7) 
        ),
        iconButtonTheme: IconButtonThemeData(
            style:
                IconButton.styleFrom(foregroundColor: const Color(0xFF97C3E9))),
      );
}

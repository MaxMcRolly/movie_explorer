import 'package:movie_explorer/imports.dart';

ThemeData themeData() {
  return ThemeData(
      accentColor: Colors.white,
      textTheme: TextTheme(
          bodyLarge: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 16,
          ),
          bodyMedium: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 14,
          ),
          bodySmall: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 12,
          ),
          titleLarge: GoogleFonts.montserrat(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700),
          titleMedium: GoogleFonts.montserrat(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)));
}

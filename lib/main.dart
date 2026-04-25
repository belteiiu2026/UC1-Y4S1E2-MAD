import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mad/screen/startup_screen.dart';
import 'package:mad/widgets/app_color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAD',
      theme: ThemeData(

        // fontFamily: 'NotoSansKhmer',
        // fontFamily: 'Hanuman',
        // fontFamily: 'KantumruyPro',
        colorScheme: ColorScheme.fromSeed(seedColor: app_background),
        // primarySwatch: ColorScheme.fromSeed(seedColor: Colors.green),

        // Google Font
        // textTheme: TextTheme(
        //   labelLarge: GoogleFonts.notoSansKhmer(),
        //   labelMedium: GoogleFonts.notoSansKhmer(),
        //   labelSmall: GoogleFonts.notoSansKhmer(),
        // ),
      ),
      home: StartupScreen(),
    );
  }
}
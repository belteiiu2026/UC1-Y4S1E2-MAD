import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mad/screen/startup_screen.dart';
import 'package:mad/widgets/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initData();
  runApp(const App());
}

Future<void> _initData() async {
  final pref = await SharedPreferences.getInstance();
  await pref.setString("username", "mad@gmail.com");
  await pref.setString("password", "123456");
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
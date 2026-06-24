import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad/data/db_manager.dart';
import 'package:mad/firebase_options.dart';
import 'package:mad/screen/startup_screen.dart';
import 'package:mad/widgets/app_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Configure with Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
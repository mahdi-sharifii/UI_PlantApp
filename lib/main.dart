import 'package:flutter/material.dart';
import 'package:plant_app/Theme/theme.dart';

import 'package:plant_app/pages/main-wrapper/main_wrapper.dart';
import 'package:plant_app/pages/splash_page/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyMaterial());
}

class MyMaterial extends StatefulWidget {
  const MyMaterial({super.key});

  @override
  State<MyMaterial> createState() => _MyMaterialState();
}

class _MyMaterialState extends State<MyMaterial> {
  bool? isFirst;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      title: "plant",
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final prefs = snapshot.data as SharedPreferences;
            final isFirstTime = prefs.getBool('isFirstTime') ?? true;
            return isFirstTime ? const SplashPage() : const MainWrapper();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

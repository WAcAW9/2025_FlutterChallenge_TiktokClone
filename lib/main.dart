import 'package:flutter/material.dart';
import 'package:tiktokclone/features/tabNavigation/tabNavigation_main.dart';
import 'package:tiktokclone/features/users/user_profile_screen.dart';

void main() {
  runApp(const TickTokApp());
}

class TickTokApp extends StatelessWidget {
  const TickTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // 모든 scaffold의 배경 white
        // appBarTheme: AppBarTheme(
        //   centerTitle: true, // 제목 가운데 정렬

        //   iconTheme: IconThemeData(color: Colors.blue),
        //   foregroundColor: Colors.black,
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   titleTextStyle: TextStyle(
        //     color: Colors.black,
        //     fontSize: Sizes.size16,
        //   ),
        // ),
        primaryColor: Colors.blue,
      ),
      darkTheme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: const TabnavigationMain(),
    );
  }
}

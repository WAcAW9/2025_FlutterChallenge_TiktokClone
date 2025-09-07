import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktokclone/features/post_configuration/post_config2.dart';
import 'package:tiktokclone/features/post_configuration/post_config4.dart';
import 'package:tiktokclone/features/tabNavigation/repos/darkscreen_config_repo.dart';
import 'package:tiktokclone/features/tabNavigation/view_models/darkscreen_configvm.dart';
import 'package:tiktokclone/firebase_options.dart';
import 'package:tiktokclone/router.dart';

void main() async {
  // ✅ Flutter 엔진 초기화 (필수!)
  WidgetsFlutterBinding.ensureInitialized();

  // firebase 초기화 하는 방법
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final preferences = await SharedPreferences.getInstance();
  final repository = DarkscreenConfigRepo(preferences);
  // 레포지토리를 ready 시킴, view모델 초기화 가능

  runApp(
    ProviderScope(
      overrides: [
        DarkscreenConfigProvider.overrideWith(
          () => DarkscreenConfigvm(repository),
        ),
      ],
      child: TickTokApp(),
    ),
  );
}

class TickTokApp extends ConsumerWidget {
  const TickTokApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: 'TikTok Clone',
      themeMode:
          ref
              .watch(DarkscreenConfigProvider)
              .dark // context.watch<DarkscreenConfigvm>().isdark
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent, // ✅ 틴트 제거
        ),
        textTheme: Typography.blackMountainView,
        primaryColor: Colors.blue,
        tabBarTheme: TabBarThemeData(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.black,
        ),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.black), // 라이트
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        textTheme: Typography.whiteMountainView,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          surfaceTintColor: Colors.transparent, // ✅ 틴트 제거
        ),
        primaryColor: Colors.blue,
        tabBarTheme: TabBarThemeData(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.white,
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.white,
          textColor: Colors.white,
        ),
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),

        iconTheme: const IconThemeData(color: Colors.white), // 다크
      ),
    );
  }
}

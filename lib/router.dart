import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktokclone/features/activities/activity_screen.dart';
import 'package:tiktokclone/features/authentication/Inital_screen.dart';
import 'package:tiktokclone/features/authentication/create_account_screen.dart';
import 'package:tiktokclone/features/authentication/customize_experience_screen.dart';
import 'package:tiktokclone/features/authentication/customize_experience_screen2.dart';
import 'package:tiktokclone/features/authentication/password_screen.dart';
import 'package:tiktokclone/features/search/search_screen.dart';
import 'package:tiktokclone/features/settings/privacy_screen.dart';
import 'package:tiktokclone/features/settings/settings_screen.dart';
import 'package:tiktokclone/features/tabNavigation/views/post_home.dart';
import 'package:tiktokclone/features/tabNavigation/views/tabNavigation_main.dart';
import 'package:tiktokclone/features/users/user_profile_screen.dart';

final router = GoRouter(
  initialLocation: TabnavigationMain.routeName,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return TabnavigationMain(child: child); // BottomNav 공통 뼈대
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => const PostHome()),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/activity',
          builder: (context, state) => const ActivityScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) =>
              const UserProfileScreen(username: 'wacaw', tab: ""),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: '/settings/privacy',
          builder: (context, state) => const PrivacyScreen(),
        ),
      ],
    ),
    GoRoute(
      path: SettingsScreen.routeName,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: PrivacyScreen.routeName,
      builder: (context, state) => const PrivacyScreen(),
    ),
  ],

  // GoRoute(
  //   path: TabnavigationMain.routeName,
  //   builder: (context, state) => const TabnavigationMain(),
  // ),
  // GoRoute(
  //   path: SearchScreen.routeName,
  //   builder: (context, state) => const SearchScreen(),
  // ),

  // GoRoute(
  //   path: UserProfileScreen.routeName,
  //   builder: (context, state) =>
  //       UserProfileScreen(username: "Wacaw", tab: ""),
  // ),

  // GoRoute(
  //   path: ActivityScreen.routeName,
  //   builder: (context, state) => const ActivityScreen(),
  // ),

  // GoRoute(
  //   path: InitalScreen.routeName,
  //   builder: (context, state) => const InitalScreen(),
  // ),
  // GoRoute(
  //   path: CreateAccountScreen.routeName,
  //   pageBuilder: (context, state) {
  //     return CustomTransitionPage(
  //       child: CreateAccountScreen(),
  //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //         return FadeTransition(
  //           opacity: animation,
  //           child: ScaleTransition(scale: animation, child: child),
  //         );
  //       },
  //     );
  //   },
  // ),
  // GoRoute(
  //   path: PasswordScreen.routeName,
  //   builder: (context, state) => const PasswordScreen(),
  // ),
  // GoRoute(
  //   name: "customizeExperienc1",
  //   path: CustomizeExperienceScreen.routeName,
  //   builder: (context, state) => const CustomizeExperienceScreen(),
  // ),
  // GoRoute(
  //   path: CustomizeExperienceScreen2.routeName,
  //   builder: (context, state) => const CustomizeExperienceScreen2(),
  // ),
  // GoRoute(
  //   path: "/users/:username", // json 형태로 username 저장
  //   builder: (context, state) {
  //     final username = state.params['username']; // username을 전달
  //     // 파싱하는 방법
  //     final tab = state
  //         .queryParams["show"]; //        context.push("/users/lynn?show=liks");
  //     return UserProfileScreen(username: username!, tab: tab!);
  //   },
  // ),
  // ],
);

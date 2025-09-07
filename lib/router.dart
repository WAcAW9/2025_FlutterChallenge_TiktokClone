import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktokclone/features/activities/activity_screen.dart';
import 'package:tiktokclone/features/authentication/Inital_screen.dart';
import 'package:tiktokclone/features/authentication/create_account_screen.dart';
import 'package:tiktokclone/features/authentication/customize_experience_screen.dart';
import 'package:tiktokclone/features/authentication/customize_experience_screen2.dart';
import 'package:tiktokclone/features/authentication/password_screen.dart';
import 'package:tiktokclone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktokclone/features/search/search_screen.dart';
import 'package:tiktokclone/features/settings/privacy_screen.dart';
import 'package:tiktokclone/features/settings/settings_screen.dart';
import 'package:tiktokclone/features/tabNavigation/views/post_home.dart';
import 'package:tiktokclone/features/tabNavigation/views/tabNavigation_main.dart';
import 'package:tiktokclone/features/users/user_profile_screen.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      // state 값에 따른 redirect 가능
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      // 사용자가 로그인 안되었을 때
      if (!isLoggedIn) {
        // 초기 화면이 아닌 곳으로 가려고 하면
        if (state.subloc != InitalScreen.routeName) {
          // 리다이렉트
          return InitalScreen.routeName;
        }
        return null;
      }
    },
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
          GoRoute(
            path: '/inital',
            builder: (context, state) => const InitalScreen(),
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
  );
});

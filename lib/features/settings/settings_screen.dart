import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tiktokclone/features/settings/privacy_screen.dart';
import 'package:tiktokclone/features/tabNavigation/view_models/darkscreen_configvm.dart';
import 'package:tiktokclone/utils.dart';

class SettingsScreen extends ConsumerWidget {
  static const String routeName = '/settings';
  const SettingsScreen({super.key});

  // bool _notifications = false;

  // void _onNotificationsChanged(bool? newValue) {
  //   if (newValue == null) return;
  //   setState(() {
  //     _notifications = newValue;
  //   });
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Settings'))),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            // watch는 변경사항 항상 변화, read는 한번만 읽고 변하지 않믐
            value: ref
                .watch(DarkscreenConfigProvider)
                .dark, //context.watch<DarkscreenConfigvm>().isdark,
            secondary: FaIcon(FontAwesomeIcons.lightbulb),
            onChanged: (value) => {
              ref.read(DarkscreenConfigProvider.notifier).setDark(value),
            }, // 스위치가 value 값을 넣어줄 것이다.
            //context.read<DarkscreenConfigvm>().setDark(value),
            title: const Text("Dark Mode"),
          ),

          ListTile(
            leading: FaIcon(FontAwesomeIcons.userPlus),
            title: const Text("Follow and invite friends"),
          ),

          ListTile(
            leading: FaIcon(FontAwesomeIcons.bell),
            title: const Text("Notifications"),
          ),

          ListTile(
            leading: FaIcon(FontAwesomeIcons.userPlus),
            onTap: () {
              context.push(PrivacyScreen.routeName); // '/interests'
            },
            title: const Text("Privacy"),
          ),

          ListTile(
            leading: FaIcon(FontAwesomeIcons.circleUser),
            title: const Text("Account"),
          ),

          ListTile(
            leading: FaIcon(FontAwesomeIcons.handshake),
            title: const Text("Help"),
          ),

          // 방법1
          ListTile(
            onTap: () => showAboutDialog(
              context: context,
              applicationVersion: "1.0",
              applicationLegalese: "All rights reseverd.",
            ),
            leading: FaIcon(FontAwesomeIcons.circleInfo),
            title: const Text("About"),
          ),
          ListTile(
            title: const Text("Log out"),
            textColor: Colors.blue,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("Plz dont go"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

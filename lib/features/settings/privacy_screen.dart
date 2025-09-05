import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tiktokclone/features/post_configuration/post_config.dart';
import 'package:tiktokclone/features/post_configuration/post_config2.dart';
import 'package:tiktokclone/features/post_configuration/post_config3.dart';
import 'package:tiktokclone/features/post_configuration/post_config4.dart';
import 'package:tiktokclone/features/tabNavigation/view_models/darkscreen_configvm.dart';
import 'package:tiktokclone/utils.dart';

class PrivacyScreen extends StatefulWidget {
  static const String routeName = '/settings/privacy'; // 추가!
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<PrivacyScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Settings'))),
      body: ListView(
        children: [
          // AnimatedBuilder(
          //   // 값 변경에도 사용된다.
          //   animation: postConfig3,
          //   builder: (context, child) => SwitchListTile.adaptive(
          //     // value: postConfig2.egg
          //     value: postConfig3.value,
          //     secondary: FaIcon(FontAwesomeIcons.lock),
          //     onChanged: (vlaue) {
          //       // postConfig2.toggleEgg();
          //       postConfig3.value = !postConfig3.value;
          //     },
          //     title: const Text("Privacy profile(test easter Egg)"),
          //   ),
          // ),
          // ValueListenableBuilder(
          //   valueListenable: postConfig3,
          //   builder: (context, value, child) => SwitchListTile.adaptive(
          //     // value: postConfig2.egg
          //     value: postConfig3.value,
          //     secondary: FaIcon(FontAwesomeIcons.lock),
          //     onChanged: (vlaue) {
          //       // postConfig2.toggleEgg();
          //       postConfig3.value = !postConfig3.value;
          //     },
          //     title: const Text("Privacy profile(test easter Egg)"),
          //   ),
          // ),
          // SwitchListTile.adaptive(
          //   // watch는 변경사항 항상 변화, read는 한번만 읽고 변하지 않믐
          //   value: context.watch<DarkscreenConfigvm>().isdark,
          //   secondary: FaIcon(FontAwesomeIcons.lock),
          //   onChanged:
          //       (value) => // 스위치가 value 값을 넣어줄 것이다.
          //           context.read<DarkscreenConfigvm>().setDark(value),
          //   title: const Text("Dark Mode"),
          // ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.at),
            title: const Text("Account"),
            trailing: FaIcon(FontAwesomeIcons.arrowRight, color: Colors.grey),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.bellSlash),
            title: const Text("Muted"),
            trailing: FaIcon(FontAwesomeIcons.arrowRight, color: Colors.grey),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.eyeSlash),
            title: const Text("Hidden Words"),
            trailing: FaIcon(FontAwesomeIcons.arrowRight, color: Colors.grey),
          ),

          ListTile(
            leading: FaIcon(FontAwesomeIcons.users),
            title: const Text("Profiles you follow"),
            trailing: FaIcon(FontAwesomeIcons.arrowRight, color: Colors.grey),
          ),

          ListTile(
            title: const Text("Other privacy settings"),
            subtitle: const Text(
              "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
              style: TextStyle(color: Colors.grey),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey,
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.circleXmark),
            title: const Text("Blocked profiles"),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey,
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.heartCrack),
            title: const Text("Hide likes"),
            trailing: FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

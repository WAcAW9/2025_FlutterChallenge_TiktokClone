import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyScreen extends StatefulWidget {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text('Settings')),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: _notifications,
            secondary: FaIcon(FontAwesomeIcons.lock),
            onChanged: _onNotificationsChanged,
            title: const Text("Privacy profile"),
          ),
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

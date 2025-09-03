import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/features/authentication/customize_experience_screen2.dart';
import 'package:tiktokclone/features/authentication/widgets/form_button.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  static const String routeName = '/customize_experience'; // 추가!
  const CustomizeExperienceScreen({super.key});

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool _isOn = false; // 스위치 상태

  void _onNextTap() {
    if (!_isOn) {
      return;
    }
    context.push(CustomizeExperienceScreen2.routeName); // '/interests'
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(FontAwesomeIcons.twitter, color: Colors.blue, size: 28),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(
          children: [
            Text(
              "Customize your experience",
              style: TextStyle(
                fontSize: Sizes.size40,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v6,
            Text(
              "Track where you see Twitter content across the web",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v6,
            Row(
              children: [
                Expanded(
                  // 또는 Flexible
                  child: Text(
                    "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.",
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Switch(
                  value: _isOn, // 현재 상태
                  activeColor: Colors.green,

                  onChanged: (value) {
                    setState(() {
                      _isOn = value; // 상태 변경
                    });
                  },
                ),
              ],
            ),
            Gaps.v6,
            Expanded(
              child: Text(
                "TBy signing up, you agree to our Terms, Privacy Policy, and Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy. Learn more",
                style: TextStyle(
                  fontSize: Sizes.size14,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.size20),
        child: GestureDetector(
          onTap: _onNextTap,
          child: FormButton(disable: !_isOn),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/features/authentication/create_account_screen.dart';
import 'package:tiktokclone/features/authentication/widgets/auth_botton.dart';

class InitalScreen extends StatelessWidget {
  static const String routeName = '/'; // 추가!
  const InitalScreen({super.key});

  // 이전방식
  // void _onTapCreateAccount(BuildContext context) {
  //   Navigator.of(
  //     context,
  //   ).push(MaterialPageRoute(builder: (context) => CreateAccountScreen()));
  // }

  void _onTapCreateAccount(BuildContext context) {
    context.push(CreateAccountScreen.routeName); // '/interests'
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(FontAwesomeIcons.twitter, color: Colors.blue, size: 28),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
        child: Text(
          "See what's happening in the world right now.",
          style: TextStyle(fontSize: Sizes.size36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center, // 텍스트 줄바꿈 시 가운데 정렬
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 330,
        color: Colors.white,
        child: Column(
          children: [
            AuthButton(
              text: "Continue with Google",
              icon: FaIcon(FontAwesomeIcons.google),
            ),
            Gaps.v10,
            AuthButton(
              text: "Continue with Apple",
              icon: FaIcon(FontAwesomeIcons.apple),
            ),
            Gaps.v10,
            Text('______________________ or ______________________'),
            Gaps.v10,
            GestureDetector(
              onTap: () => _onTapCreateAccount(context),
              child: AuthButton(text: "Create account", icon: null),
            ),
            Gaps.v16,
            Text(
              'By signing up, you agree to our Terms, Privacy Policy, and CookieUse.',
            ),
            Gaps.v16,
            Text("Have an account already? Log in"),
          ],
        ),
      ),
    );
  }
}

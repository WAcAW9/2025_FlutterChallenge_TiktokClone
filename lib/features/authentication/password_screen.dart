import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/features/authentication/password_screen.dart';
import 'package:tiktokclone/features/authentication/widgets/H1.dart';
import 'package:tiktokclone/features/authentication/widgets/H5.dart';
import 'package:tiktokclone/features/authentication/widgets/default_appbar.dart';
import 'package:tiktokclone/features/onbording/interest_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InterestScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.size24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            H1(text: 'You\'ll need a password'),
            Gaps.v12,
            H5(text: 'Make sure it\'s 8 characters or more.'),
            Gaps.v20,
            // 패스워드 입력란
            TextField(
              // 텍스트 입력 위젯
              controller: _passwordController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                label: Text('Password'),
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.eyeSlash,
                      size: Sizes.size20,
                      color: Colors.grey,
                    ),
                    Gaps.h3,
                    FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      color: _password.length < 8
                          ? Colors.grey.shade500
                          : Colors.green,
                      size: Sizes.size20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v10,
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight, // AppBar 높이로 맞춤
                child: CupertinoButton(
                  color: _password.length < 8 ? Colors.black45 : Colors.black,
                  borderRadius: BorderRadius.circular(40),
                  onPressed: _password.length < 8 ? () {} : _onNextTap,
                  child: Text('Next', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/features/authentication/password_screen.dart';
import 'package:tiktokclone/features/authentication/widgets/H1.dart';
import 'package:tiktokclone/features/authentication/widgets/H5.dart';
import 'package:tiktokclone/features/authentication/widgets/default_appbar.dart';

class ConfirmationCodeScreen extends StatefulWidget {
  const ConfirmationCodeScreen({super.key});

  @override
  State<ConfirmationCodeScreen> createState() => _ConfirmationCodeScreenState();
}

class _ConfirmationCodeScreenState extends State<ConfirmationCodeScreen> {
  final List<TextEditingController> _vertifyEmailCodeController = List.generate(
    5,
    (_) => TextEditingController(),
  );

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PasswordScreen()),
    );
  }

  @override
  void dispose() {
    for (final c in _vertifyEmailCodeController) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          // ✅ 스크롤 가능하게 변경
          padding: const EdgeInsets.all(Sizes.size24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const H1(text: 'We sent you a code'),
              Gaps.v12,
              const H5(text: 'Enter it below to verify'),
              const H5(text: 'jhon.mobbin@gamil.com'),
              Gaps.v20,

              // ✅ 이메일 인증 코드 입력란 (가로 5칸)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  return SizedBox(
                    width: 50,
                    child: TextField(
                      controller: _vertifyEmailCodeController[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLength: 1,
                      decoration: InputDecoration(counterText: ""),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 4) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),

      // ✅ 하단 버튼 영역
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Didn\'t receive email?',
                style: TextStyle(color: Colors.blueAccent),
              ),
              Gaps.v10,
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight,
                child: CupertinoButton(
                  color:
                      _vertifyEmailCodeController.every(
                        (c) => c.text.isNotEmpty,
                      )
                      ? Colors.black87
                      : Colors.black26,
                  borderRadius: BorderRadius.circular(40),
                  onPressed:
                      _vertifyEmailCodeController.every(
                        (c) => c.text.isNotEmpty,
                      )
                      ? _onNextTap
                      : () {},
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

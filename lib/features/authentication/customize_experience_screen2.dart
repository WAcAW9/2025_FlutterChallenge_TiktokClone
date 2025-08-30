import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/features/authentication/widgets/form_button.dart';

class CustomizeExperienceScreen2 extends StatefulWidget {
  const CustomizeExperienceScreen2({super.key});

  @override
  State<CustomizeExperienceScreen2> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState
    extends State<CustomizeExperienceScreen2> {
  final bool _isOn = false; // 스위치 상태

  void _onNextTap() {}

  // 체크 아이콘 위젯
  Widget _greenCheck() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          FontAwesomeIcons.solidCircleCheck,
          color: Colors.green,
          size: Sizes.size20,
        ),
      ],
    );
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create your account",
              style: TextStyle(
                fontSize: Sizes.size32,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: TextEditingController(text: "kim"), // 임시 데이터
              decoration: InputDecoration(
                hintText: "Name",
                suffix: _greenCheck(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,
            TextField(
              controller: TextEditingController(
                text: "kim@example.com",
              ), // 임시 데이터
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                suffix: _greenCheck(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,
            TextField(
              controller: TextEditingController(text: "2000-01-01"), // 임시 데이터
              enabled: false,
              decoration: InputDecoration(
                hintText: "Date of birth",
                suffix: _greenCheck(),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Sizes.size16),
        child: GestureDetector(
          onTap: _onNextTap,
          child: FormButton(disable: false),
        ),
      ),
    );
  }
}

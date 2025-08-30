import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/features/authentication/customize_experience_screen.dart';
import 'package:tiktokclone/features/authentication/widgets/form_button.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  // 유저가 입력한 이룸 저장
  String _username = "";
  // 유저가 입력한 이룸 저장
  String _email = "";
  DateTime initialDate = DateTime.now(); // 오늘의 날짜 가져오기

  @override
  void initState() {
    super.initState(); // 앞에 선언
    // textfield 입력 이벤트리스너
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
    // textfield 입력 이벤트리스너
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
    _setTextFieldDate(initialDate);
  }

  // 오늘의 날짜 출력
  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  void dispose() {
    _usernameController.dispose(); //_userController와 관련된 이벤트 리스너 모두 제거
    _emailController.dispose(); //_userController와 관련된 이벤트 리스너 모두 제거
    _birthdayController.dispose(); //_userController와 관련된 이벤트 리스너 모두 제거
    super.dispose(); // 뒤에 선언
  }

  String? _isEmailVaild() {
    if (_email.isEmpty) return null;
    // perform some val.
    final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!regExp.hasMatch(_email)) {
      return "Email not vaild";
    }
    return null;
  }

  void _onNextTap() {
    if (_username.isEmpty && _isEmailVaild() != null) {
      return;
    }
    // context를 받지 않는다. 그것은 stateful 위젯 안이기 때문에 어디서든 context를 쓸 수 있다.
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CustomizeExperienceScreen(),
      ),
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
              // 텍스트 입력 위젯
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Name",
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      color: _username.isEmpty
                          ? Colors.grey.shade500
                          : Colors.green,
                      size: Sizes.size20,
                    ),
                  ],
                ),
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
              // 텍스트 입력 위젯
              controller: _emailController,
              keyboardType: TextInputType.emailAddress, // 이메일용 키보드
              decoration: InputDecoration(
                hintText: "Email",
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      color: _email.isEmpty
                          ? Colors
                                .grey
                                .shade500 // 입력이 없으면 회색
                          : _isEmailVaild() ==
                                null // 유효하면
                          ? Colors
                                .green // 초록
                          : Colors.grey.shade500, // 유효하지 않으면 빨강
                      size: Sizes.size20,
                    ),
                  ],
                ),
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
              // 텍스트 입력 위젯
              enabled: false, // 유저가 입력 못하게 막기 비활성화
              controller: _birthdayController,
              decoration: InputDecoration(
                hintText: "Date of birth",
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
            GestureDetector(
              onTap: _onNextTap,
              child: FormButton(
                disable:
                    _username.isEmpty ||
                    _email.isEmpty ||
                    _isEmailVaild() != null,
              ),
            ), //textButton을 쓰지 ㅇ낳은건? 사용자 ui 만들기
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        height: 300,
        child: Container(
          child: CupertinoDatePicker(
            maximumDate: initialDate,
            initialDateTime: initialDate,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: _setTextFieldDate,
          ),
        ),
      ),
    );
  }
}

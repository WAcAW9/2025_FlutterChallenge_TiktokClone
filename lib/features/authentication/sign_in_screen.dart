import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktokclone/constrants/gaps.dart';
import 'package:tiktokclone/constrants/sizes.dart';
import 'package:tiktokclone/features/authentication/confirmation_code_screen.dart';
import 'package:tiktokclone/features/authentication/customize_experience_screen.dart';
import 'package:tiktokclone/features/authentication/view_models/signup_view_model.dart';
import 'package:tiktokclone/features/authentication/widgets/form_button.dart';
import 'package:tiktokclone/features/tabNavigation/views/post_home.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static const String routeName = '/sign_in'; // 추가!
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      _email = _emailController.text;
    });
    _passwordController.addListener(() {
      _password = _passwordController.text;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit() async {
    if (_email.isEmpty && _password.isEmpty) return;
    // 키보드 닫기
    FocusScope.of(context).unfocus();
    ref.read(signupForm.notifier).state = {
      "email": _email,
      "password": _password,
    };
    //print(ref.read(signupForm));

    // signUp이 끝날 때까지 기다림
    await ref.read(signUpProvider.notifier).signUp();

    // 회원가입이 성공했을 때만 이동
    if (mounted && !ref.read(signUpProvider).hasError) {
      context.go('/');
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => PostHome()),
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.size16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('English(US)'),
              Gaps.v96,
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.size6,
                  horizontal: Sizes.size11,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(Sizes.size20),
                ),

                child: FaIcon(
                  FontAwesomeIcons.threads,
                  size: Sizes.size64,
                  color: Colors.white,
                ),
              ),
              Gaps.v96,
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  hintText: "Mobile number or email",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _passwordController,

                decoration: InputDecoration(
                  hintText: "Password",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                ),
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(disable: ref.watch(signUpProvider).isLoading),
                // child: Container(
                //   width: double.infinity, // 화면 가로 전체 차지'
                //   padding: EdgeInsets.symmetric(vertical: Sizes.size16),
                //   color: Theme.of(context).primaryColor,
                //   child: Center(
                //     child: Text(
                //       'Log in',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   ),
                // ),
              ),
              Gaps.v16,
              Text(
                "Forgot password?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Gaps.v96,
              Gaps.v16,
              Container(
                width: double.infinity, // 화면 가로 전체 차지'
                padding: EdgeInsets.symmetric(vertical: Sizes.size7),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(child: Text('Create new account')),
              ),
              Gaps.v16,
              Text('Meta', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

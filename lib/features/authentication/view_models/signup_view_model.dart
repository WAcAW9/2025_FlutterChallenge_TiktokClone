import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktokclone/features/authentication/repos/authentication_repo.dart';

// 계정을 만들 때 로딩화면을 보여주고 계정 생성을 트리거 한다
class SignupViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepo _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp() async {
    state = const AsyncValue.loading();
    final form = ref.read(signupForm);
    state = await AsyncValue.guard(
      () => _authRepo.signUp(form['email']!, form['password']!),
    );
  }
}

final signupForm = StateProvider<Map<String, String>>((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignupViewModel, void>(
  () => SignupViewModel(),
);

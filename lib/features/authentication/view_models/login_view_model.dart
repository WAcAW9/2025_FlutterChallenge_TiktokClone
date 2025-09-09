// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:tiktokclone/features/authentication/repos/authentication_repo.dart';

// class LoginViewMdoel extends AsyncNotifier<void> {
//   late final AuthenticationRepo _repository;

//   @override
//   FutureOr<void> build() {
//     _repository = ref.read(authRepo);
//   }

//   Future<void> login(
//     String email,
//     String password,
//     BuildContext context,
//   ) async {
//     state = AsyncValue.loading();
//     state = await AsyncValue.guard(
//       () async => await _repository.signIn(email, password),
//     );
//     if (state.hasError) {
//       final snack = SnackBar(content: Text("oops eerror."));
//       ScaffoldMessenger.of(context).showSnackBar(snack);
//     }
//   }
// }

// final LoginProvider = AsyncNotifierProvider(() => LoginViewMdoel());

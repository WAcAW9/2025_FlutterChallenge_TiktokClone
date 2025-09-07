import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepo {
  // Firebase Authentication과 직접 소통
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isLoggedIn => user != null;
  User? get user => _firebaseAuth.currentUser;
}

// 간단한 프로바이더 생성
final authRepo = Provider((ref) => AuthenticationRepo());

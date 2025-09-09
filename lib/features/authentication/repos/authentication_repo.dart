import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepo {
  // Firebase Authentication과 직접 소통
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isLoggedIn => user != null;
  User? get user => _firebaseAuth.currentUser;

  Stream<User?> authStateChange() => _firebaseAuth.authStateChanges();

  Future<void> signUp(String email, String password) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}

// 간단한 프로바이더 생성
final authRepo = Provider((ref) => AuthenticationRepo());

// 변화에 대해 알림( 로그인, 로그아웃 등 )
final authState = StreamProvider((ref) {
  final repo = ref.read(authRepo);
  return repo.authStateChange();
});

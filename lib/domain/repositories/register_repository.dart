import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterRepository {
  Future<void> verifyNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
    required Duration timeout,
    int? forceResendingToken,
  });

  Future<String?> verifyAndLogin(AuthCredential credential);
  Future<String?> getCredential(PhoneAuthCredential credential);
  Future<String?> getPhoneNumberPrefs(String phoneNumber);
  Future<void> setLimitedTimePrefs(String phoneNumber, DateTime futureTime);
  Future<String?> getLimtedTimePrefs(String phoneNumber);
  Future<void> setUserIdPrefs(String? uid);
}

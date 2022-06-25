import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sanai3i/logic/auth/auth_state_event.dart';
import 'package:sanai3i/logic/connection_ckecker.dart';
import 'package:sanai3i/main.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  static AuthCubit of(BuildContext context) {
    return BlocProvider.of<AuthCubit>(context);
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  String _verificationId = '';
  int? _forceResendCode = 0;
  bool codeSentFlag = false;

  Future<bool> get connected async {
    return await ConnectivityCheck.call();
  }

  FutureOr<void> validatePhone(String phone) async {
    try {
      emit(const AuthState.loading());
      codeSentFlag = false;

      if (await connected) {
        await auth.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: const Duration(seconds: 120),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
          forceResendingToken: _forceResendCode,
        );
      } else {
        emit(AuthState.error(Tr.get.no_connection));
      }
    } catch (e) {
      emit(AuthState.error(Tr.get.something_went_wrong));
    }
  }

  void codeSent(String verificationId, int? forceResendingToken) {
    debugPrint('*** Code Sent ***');
    codeSentFlag = true;
    _verificationId = verificationId;
    _forceResendCode = forceResendingToken;
    emit(const AuthState.codeSent());
  }

  validateCode(String code) async {
    debugPrint('*** Validait With Code ***');
    emit(const AuthState.loading());
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: code);
      verificationCompleted(credential);
    } catch (e) {
      debugPrint('*** Code Sent Error $e ***');
      handleError(e);
    }
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    debugPrint('*** Code Auto Retrieval Timeout ***');
    codeSentFlag = false;
    emit(AuthState.error(Tr.get.code_expired));
  }

  void verificationFailed(FirebaseAuthException e) {
    debugPrint('*** Verification Failed: $e ***');
    handleError(e);
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    debugPrint('*** Verification Completed ***');

    try {
      UserCredential userCredential = await auth.signInWithCredential(credential);
      emit(const AuthState.loaded());
      if (userCredential.user != null) {
        Get.offAll(() => const Wrapper());
      }
    } catch (e) {
      handleError(e);
    }
  }

  void handleError(Object e) async {
    if (await connected) {
      if (e.toString().contains("invalid-phone-number")) {
        emit(AuthState.error(Tr.get.wrong_phone));
      } else if (e.toString().contains('missing-phone-number')) {
        emit(AuthState.error(Tr.get.missing));
      } else if (e.toString().contains('phone auth credential is invalid')) {
        emit(AuthState.error(Tr.get.wrong_code));
      } else if (e.toString().contains('The code entered was invalid')) {
        emit(AuthState.error(Tr.get.wrong_code));
      } else if (e.toString().contains('The sms code has expired')) {
        emit(AuthState.error(Tr.get.code_expired));
      } else if (e.toString().contains('phone auth credential is invalid')) {
        emit(AuthState.error(Tr.get.wrong_code));
      } else {
        emit(AuthState.error(Tr.get.something_went_wrong));
      }
    } else {
      emit(AuthState.error(Tr.get.no_connection));
    }
  }
}

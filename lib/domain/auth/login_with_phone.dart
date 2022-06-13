import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sanai3i/repository/auth/auth_repo.dart';
import 'package:sanai3i/shared/error/failuer.dart';

 class LoginWithPhone {
  final AuthRepo authRepo;

  LoginWithPhone(this.authRepo);
  Future<Either<Failuer, User>> call() async {
    return await authRepo.logInWithPhone();
  }
}

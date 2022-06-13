import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:sanai3i/service/auth/auth_service.dart';
import 'package:sanai3i/shared/error/failuer.dart';

abstract class AuthRepo {
  Future<Either<Failuer, User>> logInWithPhone();
  Future<Either<Failuer, User>> signUpWithPhone();
}

class AuthRepoImplement implements AuthRepo {
  final AuthRemoteDataSrc remoteDataSrc;

  AuthRepoImplement({required this.remoteDataSrc});

  @override
  Future<Either<Failuer, User>> logInWithPhone() {
    // TODO: implement signUpWithPhone
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, User>> signUpWithPhone() {
    // TODO: implement signUpWithPhone
    throw UnimplementedError();
  }
}


// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'register_model.freezed.dart';
part 'register_model.g.dart';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

@freezed
abstract class RegisterModel with _$RegisterModel {
  const factory RegisterModel({
    required String name,
    required String phone,
    required AccountType accountType,
    required String jop,
  }) = _RegisterModel;


  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);
}

@freezed
abstract class AccountType with _$AccountType{
  const factory AccountType.client() = AccountTypeClient;
  const factory AccountType.worker() = AccountTypeWorker;
  const factory AccountType.shop() = AccountTypeShop;
  factory AccountType.fromJson(Map<String, dynamic> json) => _$AccountTypeFromJson(json);

}
// flutter pub run build_runner watch --delete-conflicting-outputs 



// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterModel _$$_RegisterModelFromJson(Map<String, dynamic> json) =>
    _$_RegisterModel(
      name: json['name'] as String,
      phone: json['phone'] as String,
      accountType:
          AccountType.fromJson(json['accountType'] as Map<String, dynamic>),
      jop: json['jop'] as String,
    );

Map<String, dynamic> _$$_RegisterModelToJson(_$_RegisterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'accountType': instance.accountType,
      'jop': instance.jop,
    };

_$AccountTypeClient _$$AccountTypeClientFromJson(Map<String, dynamic> json) =>
    _$AccountTypeClient(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AccountTypeClientToJson(_$AccountTypeClient instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$AccountTypeWorker _$$AccountTypeWorkerFromJson(Map<String, dynamic> json) =>
    _$AccountTypeWorker(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AccountTypeWorkerToJson(_$AccountTypeWorker instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$AccountTypeShop _$$AccountTypeShopFromJson(Map<String, dynamic> json) =>
    _$AccountTypeShop(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AccountTypeShopToJson(_$AccountTypeShop instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

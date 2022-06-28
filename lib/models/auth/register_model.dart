import 'dart:convert';

import 'package:flutter/cupertino.dart';

class RegisterModel {
  String? name;
  String? phone;
  String? accType;
  String? serviceId;
  dynamic location;
  RegisterModel({
    this.name,
    this.phone,
    this.accType,
    this.serviceId,
    this.location,
  });

  RegisterModel copyWith({
    String? name,
    String? phone,
    String? accType,
    String? serviceId,
    dynamic location,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      accType: accType ?? this.accType,
      serviceId: serviceId ?? this.serviceId,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (accType != null) {
      result.addAll({'accType': accType});
    }
    if (serviceId != null) {
      result.addAll({'serviceId': serviceId});
    }
    if (location != null) {
      result.addAll({'location': location});
    }

    return result;
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      name: map['name'],
      phone: map['phone'],
      accType: map['accType'],
      serviceId: map['serviceId'],
      location: map['location'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterModel(name: $name, phone: $phone, accType: $accType, serviceId: $serviceId, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterModel &&
        other.name == name &&
        other.phone == phone &&
        other.accType == accType &&
        other.serviceId == serviceId &&
        other.location == location;
  }

  @override
  int get hashCode {
    return name.hashCode ^ phone.hashCode ^ accType.hashCode ^ serviceId.hashCode ^ location.hashCode;
  }
}

@immutable
abstract class AccType {
  static AccType client = _ClientAccType();
  static AccType serviceProvider = _ServiceProviderAccType();
  const AccType();

  factory AccType.fromStr(String str) {
    return str == _ServiceProviderAccType().toString() ? _ServiceProviderAccType() : _ClientAccType();
  }
}

@immutable
class _ClientAccType extends AccType {
  @override
  String toString() {
    return 'Client';
  }
}

@immutable
class _ServiceProviderAccType extends AccType {
  @override
  String toString() {
    return 'ServiceProvider';
  }
}

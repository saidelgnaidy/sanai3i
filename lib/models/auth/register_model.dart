import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:sanai3i/models/service_model/service_model.dart';

class RegisterModel {
  String? name;
  String? phone;
  String? accType;
  String? serviceId;
  dynamic location;
  bool? available;
  ServiceModel? service;
  RegisterModel({
    this.name,
    this.phone,
    this.accType,
    this.serviceId,
    this.location,
    this.available = true,
    this.service,
  });

  RegisterModel copyWith({
    String? name,
    String? phone,
    String? accType,
    String? serviceId,
    dynamic location,
    bool? available,
    ServiceModel? service,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      accType: accType ?? this.accType,
      serviceId: serviceId ?? this.serviceId,
      location: location ?? this.location,
      available: available ?? this.available,
      service: service ?? this.service,
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
    result.addAll({'location': location});
    if (available != null) {
      result.addAll({'available': available});
    }
    if (service != null) {
      result.addAll({'service': service!.toMap()});
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
      available: map['available'],
      service: map['service'] != null ? ServiceModel.fromMap(map['service']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterModel(name: $name, phone: $phone, accType: $accType, serviceId: $serviceId, location: $location, available: $available, service: $service)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterModel &&
        other.name == name &&
        other.phone == phone &&
        other.accType == accType &&
        other.serviceId == serviceId &&
        other.location == location &&
        other.available == available &&
        other.service == service;
  }

  @override
  int get hashCode {
    return name.hashCode ^ phone.hashCode ^ accType.hashCode ^ serviceId.hashCode ^ location.hashCode ^ available.hashCode ^ service.hashCode;
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

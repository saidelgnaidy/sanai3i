import 'dart:convert';

import 'package:sanai3i/models/auth/register_model.dart';
import 'package:sanai3i/models/service_model/service_model.dart';

class KUser {
  String? name;
  String? phone;
  AccType? accType;
  String? serviceId;
  ServiceModel? service;
  bool? available;
  KUser({
    this.name,
    this.phone,
    this.accType,
    this.serviceId,
    this.service,
    this.available,
  });

  KUser copyWith({
    String? name,
    String? phone,
    AccType? accType,
    String? serviceId,
    ServiceModel? service,
    bool? available,
  }) {
    return KUser(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      accType: accType ?? this.accType,
      serviceId: serviceId ?? this.serviceId,
      service: service ?? this.service,
      available: available ?? this.available,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(name != null){
      result.addAll({'name': name});
    }
    if(phone != null){
      result.addAll({'phone': phone});
    }
    if(accType != null){
      result.addAll({'accType': accType!.toString()});
    }
    if(serviceId != null){
      result.addAll({'serviceId': serviceId});
    }
    if(service != null){
      result.addAll({'service': service!.toMap()});
    }
    if(available != null){
      result.addAll({'available': available});
    }
  
    return result;
  }

  factory KUser.fromMap(Map<String, dynamic> map) {
    return KUser(
      name: map['name'],
      phone: map['phone'],
      accType: map['accType'] != null ? AccType.fromStr(map['accType']) : null,
      serviceId: map['serviceId'],
      service: map['service'] != null ? ServiceModel.fromMap(map['service']) : null,
      available: map['available'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KUser.fromJson(String source) => KUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'KUser(name: $name, phone: $phone, accType: $accType, serviceId: $serviceId, service: $service, available: $available)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KUser &&
        other.name == name &&
        other.phone == phone &&
        other.accType == accType &&
        other.serviceId == serviceId &&
        other.service == service &&
        other.available == available;
  }

  @override
  int get hashCode {
    return name.hashCode ^ phone.hashCode ^ accType.hashCode ^ serviceId.hashCode ^ service.hashCode ^ available.hashCode;
  }
}

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:sanai3i/models/auth/register_model.dart';
import 'package:sanai3i/models/user/my_geo_point.dart';
import 'package:sanai3i/models/service_model/service_model.dart';

class KUser {
  String? name;
  String? phone;
  AccType? accType;
  String? serviceId;
  ServiceModel? service;
  bool? available;
  KGeoFirePoint? location;
  List<String>? bookmark;
  String? picURL;
  String? rate;
  String? uid;
  KUser({
    this.name,
    this.phone,
    this.accType,
    this.serviceId,
    this.service,
    this.available,
    this.location,
    this.bookmark,
    this.picURL,
    this.rate,
    this.uid,
  });

  KUser copyWith({
    String? name,
    String? phone,
    AccType? accType,
    String? serviceId,
    ServiceModel? service,
    bool? available,
    KGeoFirePoint? location,
    List<String>? bookmark,
    String? picURL,
    String? rate,
    String? uid,
  }) {
    return KUser(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      accType: accType ?? this.accType,
      serviceId: serviceId ?? this.serviceId,
      service: service ?? this.service,
      available: available ?? this.available,
      location: location ?? this.location,
      bookmark: bookmark ?? this.bookmark,
      picURL: picURL ?? this.picURL,
      rate: rate ?? this.rate,
      uid: uid ?? this.uid,
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
      result.addAll({'accType': accType!.toMap()});
    }
    if (serviceId != null) {
      result.addAll({'serviceId': serviceId});
    }
    if (service != null) {
      result.addAll({'service': service!.toMap()});
    }
    if (location != null) {
      result.addAll({'location': location!.toMap()});
    }
    if (available != null) {
      result.addAll({'available': available});
    }
    if (bookmark != null) {
      result.addAll({'bookmark': bookmark});
    }
    if (picURL != null) {
      result.addAll({'picURL': picURL});
    }
    if (rate != null) {
      result.addAll({'rate': rate});
    }
    if (uid != null) {
      result.addAll({'uid': uid});
    }

    return result;
  }

  Map<String, dynamic> toCache() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (accType != null) {
      result.addAll({'accType': accType!.toMap()});
    }
    if (serviceId != null) {
      result.addAll({'serviceId': serviceId});
    }
    if (service != null) {
      result.addAll({'service': service!.toMap()});
    }

    if (available != null) {
      result.addAll({'available': available});
    }
    if (bookmark != null) {
      result.addAll({'bookmark': bookmark});
    }
    if (picURL != null) {
      result.addAll({'picURL': picURL});
    }
    if (rate != null) {
      result.addAll({'rate': rate});
    }
    if (uid != null) {
      result.addAll({'uid': uid});
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
      location: map['location'] != null ? KGeoFirePoint.fromMap(map) : null,
      bookmark: map['bookmark'] != null ? List<String>.from(map['bookmark']) : [],
      picURL: map['picURL'],
      rate: map['rate'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KUser.fromJson(String source) => KUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'KUser(name: $name, phone: $phone, accType: $accType, serviceId: $serviceId, service: $service, available: $available, location: $location, bookmark: $bookmark, picURL: $picURL, rate: $rate, uid: $uid)';
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
        other.available == available &&
        other.location == location &&
        listEquals(other.bookmark, bookmark) &&
        other.picURL == picURL &&
        other.rate == rate &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phone.hashCode ^
        accType.hashCode ^
        serviceId.hashCode ^
        service.hashCode ^
        available.hashCode ^
        location.hashCode ^
        bookmark.hashCode ^
        picURL.hashCode ^
        rate.hashCode ^
        uid.hashCode;
  }
}

//GeoFirePoint(map['location']['geopoint'].latitude, map['location']['geopoint'].longitude)
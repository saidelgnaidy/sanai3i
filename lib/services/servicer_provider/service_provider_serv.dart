import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/services/connection_ckecker.dart';
import 'package:sanai3i/shared/error/exceptions.dart';

class ServiceProvidersServ {
  static Future<Stream<List<DocumentSnapshot<Map<String, dynamic>>>>> startQuery(
      {required String serviceId, required BehaviorSubject<double> radius, required Position position}) async {
    bool connected = await ConnectivityCheck.call();
    if (connected) {
      try {
        var queryRef = FBCR.users.where('serviceId', isEqualTo: serviceId);

        GeoFirePoint center = GeoFirePoint(position.latitude, position.longitude);

        final geoRef = GeoFireCollectionRef(queryRef);

        return radius.switchMap((rad) {
          return geoRef.within(center: center, radius: rad, field: 'location', strictMode: true);
        });
      } catch (e) {
        rethrow;
      }
    } else {
      throw const KExceptionOffline();
    }
  }
}

import 'dart:async';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/logic/connection_ckecker.dart';
import 'package:sanai3i/shared/error/exceptions.dart';

class ServiceProvidersServ {
  static Future<GeoFireCollectionRef> startQuery({required String serviceId}) async {
    bool connected = await ConnectivityCheck.call();
    if (connected) {
      try {
        var queryRef = FBCR.users.where('serviceId', isEqualTo: serviceId);

        return GeoFireCollectionRef(queryRef);
      } catch (e) {
        rethrow;
      }
    } else {
      throw const KExceptionOffline();
    }
  }
}

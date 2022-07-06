import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class KGeoFirePoint extends GeoFirePoint {
  KGeoFirePoint(super.latitude, super.longitude);

  factory KGeoFirePoint.fromMap(Map<String, dynamic> map) {
    final GeoPoint point = map['location']['geopoint'];
    return KGeoFirePoint(point.latitude, point.longitude);
  }

  Map<String, dynamic> toMap() {
    return {'geopoint': geoPoint, 'geohash': hash};
  }
}

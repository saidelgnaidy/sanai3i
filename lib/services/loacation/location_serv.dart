import 'package:geolocator/geolocator.dart';
import 'package:sanai3i/services/connection_ckecker.dart';
import 'package:sanai3i/shared/error/exceptions.dart';

class KLocationService {
  static Future<Position> call() async {
    bool connected = await ConnectivityCheck.call();

    if (connected) {
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw const KException.locationDiabled();
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw const KException.locationDenaid();
        }
      }
      if (permission == LocationPermission.deniedForever) {
        throw const KException.locationDenaidPermenetl();
      }
      return await Geolocator.getCurrentPosition();
    } else {
      throw const KException.offline();
    }
  }
}

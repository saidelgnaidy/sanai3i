import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityCheck {
  final Connectivity connect = Connectivity();

  static Future<bool> call() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}

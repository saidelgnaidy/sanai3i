import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/logic/connection_ckecker.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/storage_key.dart';

class UserExistaceService {
  static Future<bool> call() async {
    var userExist = GetStorage().read(StorageKeys.userExist);
    debugPrint("*** User Existance: $userExist ***");

    if (userExist != null) {
      return true;
    }

    bool connected = await ConnectivityCheck.call();
    if (connected) {
      try {
        final doc = await FBCR.me.get();
        if (doc.exists) {
          GetStorage().write(StorageKeys.userExist, true);
          return true;
        } else {
          return false;
        }
      } catch (e) {
        rethrow;
      }
    } else {
      throw const KExceptionOffline();
    }
  }
}

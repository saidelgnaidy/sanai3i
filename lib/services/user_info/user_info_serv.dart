import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/logic/connection_ckecker.dart';
import 'package:sanai3i/models/user/user_model.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/storage_key.dart';

class UserInfoService {
  static Future<KUser> call() async {
    var cached_user = GetStorage().read(StorageKeys.user);
    debugPrint("*** User Model from  Cache: $cached_user***");

    if (cached_user != null) {
      return KUser.fromMap(cached_user);
    }

    bool connected = await ConnectivityCheck.call();
    if (connected) {
      try {
        final doc = await FBCR.me.get();
        if (doc.exists) {
          final user = KUser.fromMap(doc.data() as Map<String, dynamic>);
          GetStorage().write(StorageKeys.user, user.toMap());
          return user;
        } else {
          throw const KExceptionUserNotFound();
        }
      } catch (e) {
        rethrow;
      }
    } else {
      throw const KExceptionOffline();
    }
  }
}

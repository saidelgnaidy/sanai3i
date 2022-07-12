import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/logic/connection_ckecker.dart';
import 'package:sanai3i/models/user/user_model.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/storage_key.dart';

class UserInfoService {
  static Future<KUser> getUser() async {
    var cached_user = GetStorage().read(StorageKeys.user);
    if (cached_user != null) {
      final user = KUser.fromMap(cached_user);
      debugPrint('**************************** User from  Cache : ${user.name} ');
      return user;
    }

    bool connected = await ConnectivityCheck.call();
    if (connected) {
      try {
        final doc = await FBCR.me(FirebaseAuth.instance.currentUser!.uid).get();
        if (doc.exists) {
          final user = KUser.fromDoc(doc);
          GetStorage().write(StorageKeys.user, user.toCache());
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

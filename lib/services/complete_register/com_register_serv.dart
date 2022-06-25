import 'package:get_storage/get_storage.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/logic/connection_ckecker.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/storage_key.dart';

class CompleteRegisterService {
  static Future<bool> call() async {
    var local_user = GetStorage().read(StorageKeys.user);

    if (local_user != null) {
      return true;
    }

    bool connected = await ConnectivityCheck.call();
    if (connected) {
      try {
        final doc = await FBCR.users.doc().get();

        if (doc.exists) {
          GetStorage().write('user_model', doc.data() as Map);
          return true;
        } else {
          return false;
        }
      } catch (e) {
        rethrow;
      }
    } else {
      throw OfflineException();
    }
  }
}

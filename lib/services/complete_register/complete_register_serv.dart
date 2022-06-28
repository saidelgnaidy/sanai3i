import 'package:get_storage/get_storage.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/logic/connection_ckecker.dart';
import 'package:sanai3i/models/auth/register_model.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/storage_key.dart';

class CompleteRegisterService {
  static Future call(RegisterModel model) async {
    //GetStorage().write(StorageKeys.user, model.toMap());

    bool connected = await ConnectivityCheck.call();
    if (connected) {
      try {
        await FBCR.me.set(model.toMap());
      } catch (e) {
        rethrow;
      }
    } else {
      throw const KException.offline();
    }
  }
}

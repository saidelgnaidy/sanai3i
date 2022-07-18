import 'package:firebase_auth/firebase_auth.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/services/connection_ckecker.dart';
import 'package:sanai3i/models/auth/register_model.dart';
import 'package:sanai3i/shared/error/exceptions.dart';

class CompleteRegisterService {
  static Future call(RegisterModel model) async {
    bool connected = await ConnectivityCheck.call();
    if (connected) {
      try {
        await FBCR.me(FirebaseAuth.instance.currentUser!.uid).set(model.toMap());
      } catch (e) {
        rethrow;
      }
    } else {
      throw const KException.offline();
    }
  }
}

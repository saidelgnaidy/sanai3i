import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/logic/connection_ckecker.dart';
import 'package:sanai3i/models/service_model/service_model.dart';
import 'package:sanai3i/shared/error/exceptions.dart';

class ServicesGetterService {
  static Future<List<ServiceModel>> call() async {
    List<ServiceModel> list = [];
    bool connected = await ConnectivityCheck.call();
    if (connected) {
      try {
        final QuerySnapshot<Object?> query = await FBCR.services.get();
        for (var doc in query.docs) {
          list.add(ServiceModel.fromMap(doc.data() as Map<String, dynamic>).copyWith(id: doc.id));
        }
        return list;
      } catch (e) {
        rethrow;
      }
    } else {
      throw const KException.offline();
    }
  }
}
    /// List<Map<String, dynamic>> toCache = [];
    /// final cashed = GetStorage().read(StorageKeys.services);
    /// if (cashed != null) {
    ///   debugPrint('*** Fetshing (Services) from Cache ***');
    ///   final temp = List.from(cashed);
    ///   for (var doc in temp) {
    ///     list.add(ServiceModel.fromMap(doc as Map<String, dynamic>));
    ///   }
    ///   return list;
    /// }
    /// debugPrint('*** Fetshing (Services) from Backend ***');
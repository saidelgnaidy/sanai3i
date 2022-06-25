import 'package:cloud_firestore/cloud_firestore.dart';

class FBCR {
  static final FirebaseFirestore fbi = FirebaseFirestore.instance ;

  static final CollectionReference users = fbi.collection('Users');

  static DocumentReference myFarm(String uid) {
    return fbi.collection('Farms').doc(uid);
  }

  static CollectionReference sheeps(String uid) {
    return myFarm(uid).collection('Sheeps');
  }

  static CollectionReference feedWarehouse(String uid) {
    return myFarm(uid).collection('FeedWarehouse');
  }

  static CollectionReference feedConsumption(String uid) {
    return myFarm(uid).collection('FeedConsumption');
  }

  static CollectionReference medicineWarehouse(String uid) {
    return myFarm(uid).collection('MedicineWarehouse');
  }

  static CollectionReference medConsumption(String uid) {
    return myFarm(uid).collection('MedConsumption');
  }

  static CollectionReference sheepsMilkQty(String uid) {
    return myFarm(uid).collection('SheepsMilkQty');
  }
}

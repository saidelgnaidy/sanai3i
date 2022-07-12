import 'package:cloud_firestore/cloud_firestore.dart';

class FBCR {
  static final FirebaseFirestore fbi = FirebaseFirestore.instance;

  static final CollectionReference<Map<String, dynamic>> users = fbi.collection('UsersCollection');
  static final CollectionReference<Map<String, dynamic>> services = fbi.collection('Services');
  static final CollectionReference<Map<String, dynamic>> chats = fbi.collection('Chats');
  static DocumentReference me(String uid) => users.doc(uid);
}

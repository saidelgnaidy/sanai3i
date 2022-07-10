import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FBCR {
  static final FirebaseFirestore fbi = FirebaseFirestore.instance;
  static final WriteBatch batch = FirebaseFirestore.instance.batch();

  static final CollectionReference<Map<String, dynamic>> users = fbi.collection('UsersCollection');
  static final CollectionReference<Map<String, dynamic>> services = fbi.collection('Services');
  static final DocumentReference me = users.doc(FirebaseAuth.instance.currentUser?.uid);
}

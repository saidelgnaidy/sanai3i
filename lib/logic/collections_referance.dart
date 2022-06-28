import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FBCR {
  static final FirebaseFirestore fbi = FirebaseFirestore.instance;

  static final CollectionReference users = fbi.collection('UsersCollection');
  static final CollectionReference services = fbi.collection('Services');
  static final DocumentReference me = users.doc(FirebaseAuth.instance.currentUser?.uid);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/models/user/user_model.dart';

updateAllUsers() async {
  List<KUser> users = [];
  final docs = await FBCR.users.get();

  for (var doc in docs.docs) {
    users.add(KUser.fromDoc(doc));
  }

  debugPrint('**************************** Found ${users.length} user ');

  WriteBatch batch = FBCR.batch;

  for (var element in users) {
    final docRef = FBCR.users.doc(element.uid);
    batch.update(docRef, {'uid': element.uid});
  }

  batch.commit();
}

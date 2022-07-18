import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/models/chat/message_model.dart';
import 'package:sanai3i/models/chat/room_model.dart';

class ChatService {
  static Future sendMessage({required MessageModel messageModel, required RoomModel roomModel}) async {
    final roomId = _calcRoomId(messageModel.receiver!);
    try {
      WriteBatch batch = FirebaseFirestore.instance.batch();

      final room = FBCR.chats.doc(roomId);
      final msgCollection = room.collection('messages').doc();

      batch.set(room, roomModel.toMap());
      batch.set(msgCollection, messageModel.toMap());

      batch.commit();
    } catch (e) {
      debugPrint('**************************** Chat Service Error  : $e ');
      rethrow;
    }
  }

  static Stream<List<MessageModel>> chatStream(String roomId) {
    return FBCR.chats.doc(roomId).collection('messages').orderBy('timestamp', descending: true).snapshots().map(
      (snap) {
        List<MessageModel> messages = [];
        for (var doc in snap.docs) {
          messages.add(MessageModel.fromMap(doc.data()));
        }
        return messages;
      },
    );
  }

  static String _calcRoomId(String receiverUid) {
    String roomId = '';
    if (FirebaseAuth.instance.currentUser!.uid.codeUnits.fold<int>(0, (p, c) => p + c) > receiverUid.codeUnits.fold<int>(0, (p, c) => p + c)) {
      roomId = '${FirebaseAuth.instance.currentUser!.uid}_$receiverUid';
    } else {
      roomId = '${receiverUid}_${FirebaseAuth.instance.currentUser!.uid}';
    }
    return roomId;
  }
}

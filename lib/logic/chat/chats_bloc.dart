import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanai3i/logic/chat/chat_states.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/models/chat/message_model.dart';
import 'package:sanai3i/services/chats/chats_service.dart';
import 'package:sanai3i/models/chat/room_model.dart';

class ChatBloc extends Cubit<ChatState> {
  ChatBloc() : super(const ChatState.initial());

  static ChatBloc of(BuildContext context) {
    return BlocProvider.of<ChatBloc>(context);
  }

  final auth = FirebaseAuth.instance;
  final CollectionReference chats = FBCR.chats;
  final String receiverUID = '';
  final TextEditingController teCtrl = TextEditingController();
  MessageModel? messageModel;
  RoomModel? roomModel;

  setMsg(String receiver) {
    messageModel = MessageModel(
      receiver: receiver,
      sender: FirebaseAuth.instance.currentUser!.uid,
    );
    roomModel = RoomModel(
      lastSeen: false,
      lastSender: auth.currentUser!.uid,
      roomId: calcRoomId(receiver),
      users: [auth.currentUser!.uid, receiver],
    );
  }

  Future get sendMessage async {
    if (teCtrl.text.isNotEmpty) {
      try {
        ChatService.sendMessage(messageModel: messageModel!.copyWith(content: teCtrl.text), roomModel: roomModel!);
        teCtrl.clear();
      } catch (e) {
        debugPrint('**************************** $e : ');
      }
    }
  }

  Stream<List<MessageModel>> get chatStream {
    return ChatService.chatStream(roomModel!.roomId!);
  }

  Stream get conversationsListStream {
    return chats.where('users', arrayContains: auth.currentUser!.uid).orderBy('timestamp', descending: true).snapshots().map(
      (snap) {
        List<RoomModel> conversations = [];
        for (var doc in snap.docs) {
          conversations.add(RoomModel.fromMap(doc.data() as Map<String, dynamic>));
        }
        return conversations;
      },
    );
  }

  Stream<QuerySnapshot> get checkUnSeenMsg {
    return chats
        .where('users', arrayContains: auth.currentUser!.uid)
        .where('lastSeen', isEqualTo: false)
        .where('lastSender', isNotEqualTo: auth.currentUser!.uid)
        .snapshots();
  }

  Stream<int> get numOFUnReadMSG {
    return chats
        .doc(calcRoomId(receiverUID))
        .collection('messages')
        .where('sender', isNotEqualTo: auth.currentUser!.uid)
        .where('seen', isEqualTo: false)
        .snapshots()
        .map((snap) {
      return snap.docs.length;
    });
  }

  markAsSeen({required String receiverUid}) async {
    final doc = await chats.doc(calcRoomId(receiverUid)).get();
    try {
      if (doc.get('lastSeen') == false && doc.get('lastSender') != auth.currentUser!.uid) {
        chats.doc(calcRoomId(receiverUid)).update({
          'lastSeen': true,
        });
      }
    } catch (e) {
      debugPrint('**************************** $e : ');
    }

    final result = await chats.doc(calcRoomId(receiverUid)).collection('messages').where('seen', isEqualTo: false).get();
    for (var doc in result.docs) {
      if (doc.get('sender') != auth.currentUser!.uid) {
        await chats.doc(calcRoomId(receiverUid)).collection('messages').doc(doc.id).update({
          'seen': true,
        });
      } else {
        continue;
      }
    }
  }

  String calcRoomId(String receiverUid) {
    String roomId = '';
    if (auth.currentUser!.uid.substring(0, 1).codeUnitAt(0) > receiverUid.substring(0, 1).codeUnitAt(0)) {
      roomId = '${receiverUid}_${auth.currentUser!.uid}';
    } else {
      roomId = '${auth.currentUser!.uid}_$receiverUid';
    }
    return roomId;
  }
}

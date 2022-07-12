import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageModel {
  final String? content;
  final String? sender;
  final String? receiver;
  final Timestamp? timestamp;
  final bool? isMe;
  final bool? seen;

  MessageModel({this.content, this.sender, this.receiver, this.timestamp, this.isMe, this.seen});

  MessageModel copyWith({
    String? content,
    String? sender,
    String? receiver,
    bool? isSender,
    final bool? seen,
  }) {
    return MessageModel(
      content: content ?? this.content,
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver,
      isMe: isSender ?? isMe,
      seen: seen ?? this.seen,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (content != null) {
      result.addAll({'content': content});
    }
    if (sender != null) {
      result.addAll({'sender': sender});
    }
    if (receiver != null) {
      result.addAll({'receiver': receiver});
    }

    result.addAll({'timestamp': DateTime.now().toUtc()});

    result.addAll({'seen': seen ?? false});

    return result;
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      content: map['content'] ?? '',
      sender: map['sender'] ?? '',
      receiver: map['receiver'] ?? '',
      timestamp: map['timestamp'] ?? Timestamp.now(),
      isMe: map['sender'] == FirebaseAuth.instance.currentUser?.uid,
      seen: map['seen'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MessageModel(content: $content, sender: $sender, receiver: $receiver, timestamp: $timestamp, isSender: $isMe)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageModel &&
        other.content == content &&
        other.sender == sender &&
        other.receiver == receiver &&
        other.timestamp == timestamp &&
        other.seen == seen &&
        other.isMe == isMe;
  }

  @override
  int get hashCode {
    return content.hashCode ^ sender.hashCode ^ receiver.hashCode ^ timestamp.hashCode ^ isMe.hashCode ^ seen.hashCode;
  }
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class RoomModel {
  final String? roomId;
  final List<String>? users;
  final bool? lastSeen;
  final String? lastSender;
  final Timestamp? timestamp;
  RoomModel({
    this.roomId,
    this.users,
    this.lastSeen,
    this.lastSender,
    this.timestamp,
  });

  RoomModel copyWith({
    String? roomId,
    List<String>? users,
    bool? lastSeen,
    String? lastSender,
    Timestamp? timestamp,
  }) {
    return RoomModel(
      roomId: roomId ?? this.roomId,
      users: users ?? this.users,
      lastSeen: lastSeen ?? this.lastSeen,
      lastSender: lastSender ?? this.lastSender,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (roomId != null) {
      result.addAll({'roomId': roomId});
    }
    if (users != null) {
      result.addAll({'users': users});
    }
    if (lastSeen != null) {
      result.addAll({'lastSeen': lastSeen});
    }
    if (lastSender != null) {
      result.addAll({'lastSender': lastSender});
    }

    result.addAll({'timestamp': DateTime.now().toUtc()});

    return result;
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    return RoomModel(
      roomId: map['roomId'],
      users: List<String>.from(map['users']),
      lastSeen: map['lastSeen'],
      lastSender: map['lastSender'],
      timestamp: map['timestamp'] ?? Timestamp.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomModel.fromJson(String source) => RoomModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RoomModel(roomId: $roomId, users: $users, lastSeen: $lastSeen, lastSender: $lastSender, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RoomModel &&
        other.roomId == roomId &&
        listEquals(other.users, users) &&
        other.lastSeen == lastSeen &&
        other.lastSender == lastSender &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return roomId.hashCode ^ users.hashCode ^ lastSeen.hashCode ^ lastSender.hashCode ^ timestamp.hashCode;
  }
}

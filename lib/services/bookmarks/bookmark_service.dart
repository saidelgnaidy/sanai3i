import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/logic/connection_ckecker.dart';
import 'package:sanai3i/models/user/user_model.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/storage_key.dart';

class BookmarksService {


  static Future toogleOnServer(String uid) async {
    bool connected = await ConnectivityCheck.call();
    if (connected) {
      try {
        FBCR.fbi.runTransaction(
          (transaction) async {
            final doc = await transaction.get(FBCR.me(FirebaseAuth.instance.currentUser!.uid));
            KUser user = KUser.fromDoc(doc);
            final List newBookc = user.bookmark ?? [];
            newBookc.contains(uid) ? newBookc.remove(uid) : newBookc.add(uid);
            transaction.update(FBCR.me(FirebaseAuth.instance.currentUser!.uid), {'bookmark': newBookc});
          },
        );
        debugPrint('**************************** Toggle bookmark on server success ');
      } catch (e) {
        rethrow;
      }
    } else {
      throw const KExceptionOffline();
    }
  }

  static List<KUser> toogleOnCache({required KUser newUser, required List<KUser> bookedUsers}) {
    List bookedUsersToCache = [];
    if (bookedUsers.where((element) => element.uid == newUser.uid).isNotEmpty) {
      bookedUsers = bookedUsers
        ..removeWhere((element) {
          return element.uid == newUser.uid;
        });
    } else {
      bookedUsers.insert(0, newUser);
    }

    for (var user in bookedUsers) {
      bookedUsersToCache.add(user.toCache());
    }

    GetStorage().write(StorageKeys.bookmark, bookedUsersToCache);
    return bookedUsers;
  }

  static List<KUser> getFromCache() {
    List<KUser> bookedUsers = [];
    var cached = GetStorage().read(StorageKeys.bookmark);
    if (cached != null) {
      List? cached_books = List.from(GetStorage().read(StorageKeys.bookmark) ?? []);
      for (var element in cached_books) {
        KUser user = KUser.fromMap(element);
        bookedUsers.add(user);
      }
    }
    return bookedUsers;
  }

  static Future<List<KUser>> getFromServer() async {
    List<KUser> bookedUsers = [];

    try {
      final List<KUser> newBooks = [];

      await FBCR.fbi.runTransaction(
        (transaction) async {
          final me = await transaction.get(FBCR.me(FirebaseAuth.instance.currentUser!.uid));
          final KUser user = KUser.fromDoc(me);
          debugPrint('**************************** Bookmarks on server: ${user.bookmark!.length} ');

          for (var i = 0; i < ((user.bookmark ?? []).length / 10).ceil(); i++) {
            int start = i * 10;
            int end = (start + 10) > user.bookmark!.length ? user.bookmark!.length : (start + 10);
            final query = await FBCR.users.where("uid", whereIn: user.bookmark?.getRange(start, end).toList()).get();
            for (var doc in query.docs) {
              KUser user = KUser.fromDoc(doc);
              newBooks.add(user);
            }
          }
        },
      );
      bookedUsers = newBooks.reversed.toList();
    } catch (e) {
      debugPrint('**************************** Error Geting Bookmarks from Server : $e ');

      rethrow;
    }

    _storeInCache(bookedUsers);

    return bookedUsers;
  }

  static _storeInCache(List<KUser> bookedUsers) {
    List bookedUsersToCache = [];
    for (var element in bookedUsers) {
      bookedUsersToCache.add(element.toCache());
    }
    debugPrint('**************************** Cacheinging Bookmarks ...');
    GetStorage().write(StorageKeys.bookmark, bookedUsersToCache);
  }
}

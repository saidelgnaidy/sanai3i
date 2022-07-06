import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sanai3i/logic/collections_referance.dart';
import 'package:sanai3i/logic/connection_ckecker.dart';
import 'package:sanai3i/models/user/user_model.dart';
import 'package:sanai3i/services/user_info/user_info_serv.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/storage_key.dart';

class BookmarksService {
  static List<KUser> bookedUsers = [];
  static List bookedUsersToCache = [];

  static Future toogleOnServer(String uid) async {
    bool connected = await ConnectivityCheck.call();
    if (connected) {
      try {
        FBCR.fbi.runTransaction(
          (transaction) async {
            final doc = await transaction.get(FBCR.me);
            KUser user = KUser.fromDoc(doc);
            final List newBookc = user.bookmark ?? [];
            newBookc.contains(uid) ? newBookc.remove(uid) : newBookc.add(uid);
            transaction.update(FBCR.me, {'bookmark': newBookc});
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

  static List<KUser> addToCache(KUser newUser) {
    bookedUsers = [];
    bookedUsersToCache = [];
    List cached_books = List.from(GetStorage().read(StorageKeys.bookmark) ?? []);

    for (var element in cached_books) {
      KUser user = KUser.fromMap(element);
      bookedUsers.add(user);
      bookedUsersToCache.add(user.toCache());
    }
    if (bookedUsers.where((element) => element.uid == newUser.uid).isNotEmpty) {
      bookedUsers = bookedUsers..removeWhere((element) => element.uid == newUser.uid);
      bookedUsersToCache = bookedUsersToCache..removeWhere((element) => element['uid'] == newUser.uid);
    } else {
      bookedUsers.add(newUser);
      bookedUsersToCache.add(newUser.toCache());
    }
    GetStorage().write(StorageKeys.bookmark, bookedUsersToCache);
    return bookedUsers;
  }

  static Future<List<KUser>> getBookmarks() async {
    bookedUsers = [];
    var cached = GetStorage().read(StorageKeys.bookmark);
    if (cached != null) {
      debugPrint('**************************** Geting Bookmarks from Cache : ');

      List? cached_books = List.from(GetStorage().read(StorageKeys.bookmark) ?? []);
      for (var element in cached_books) {
        KUser user = KUser.fromMap(element);
        bookedUsers.add(user);
      }
      bookedUsers = bookedUsers.reversed.toList();
      return bookedUsers;
    } else {
      debugPrint('**************************** Geting Bookmarks from Server : ');

      try {
        KUser user = await UserInfoService.getUser();
        if (user.bookmark!.isNotEmpty) {
          debugPrint('**************************** Bookmark : ${user.bookmark!.toSet()} ');

          await FBCR.fbi.runTransaction(
            (transaction) async {
              for (var uid in user.bookmark!) {
                final doc = await transaction.get(FBCR.users.doc(uid));
                KUser user = KUser.fromDoc(doc);
                debugPrint('**************************** ${user.name} : ');
                bookedUsers.add(user);
              }
            },
          );
          bookedUsers = bookedUsers.reversed.toList();
        }
      } catch (e) {
        debugPrint('**************************** Error Geting Bookmarks from Server : $e ');

        rethrow;
      }

      _storeInCache();

      return bookedUsers;
    }
  }

  static _storeInCache() {
    for (var element in bookedUsers) {
      bookedUsersToCache.add(element.toCache());
    }
    debugPrint('**************************** Cacheinging Bookmarks ...');
    GetStorage().write(StorageKeys.bookmark, bookedUsersToCache);
  }
}

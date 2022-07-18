import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanai3i/logic/bookmarks/bookmark_state.dart';
import 'package:sanai3i/models/user/user_model.dart';
import 'package:sanai3i/services/bookmarks/bookmark_service.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/view/widgets/user_tile.dart';

class BookmarksBloc extends Cubit<BookmarksState> {
  BookmarksBloc() : super(const BookmarksState.loading());

  static BookmarksBloc of(BuildContext context) {
    return BlocProvider.of<BookmarksBloc>(context);
  }

  List<KUser> bookmarks = [];
  ScrollController scrollController = ScrollController();
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  toggleBookmark(KUser user) async {
    try {
      _animateRemoving(user);
      emit(const BookmarksState.loading());
      bookmarks = BookmarksService.toogleOnCache(bookedUsers: bookmarks, newUser: user);
      bookmarks.isEmpty ? emitEmpty() : emit(BookmarksState.success(bookmarks: bookmarks));
      await BookmarksService.toogleOnServer(user.uid!);
    } on KExceptionOffline {
      KHelper.showSnackBar(Tr.get.no_connection, isTop: true);
      bookmarks = BookmarksService.toogleOnCache(bookedUsers: bookmarks, newUser: user);
      emit(BookmarksState.success(bookmarks: bookmarks));
      debugPrint('**************************** (Bloc) Bookmarks Error : No Connection');
    } catch (e) {
      debugPrint('**************************** (Bloc) Bookmarks Error : $e');
      emit(BookmarksState.error(error: Tr.get.something_went_wrong));
    }
  }

  _animateRemoving(KUser user) {
    if (bookmarks.contains(user) && (listKey.currentState?.mounted ?? false)) {
      listKey.currentState!.removeItem(
        bookmarks.indexOf(user),
        (context, animation) => KUserTileWidget(
          user: user,
          tileHeight: 100,
          inBookmarks: true,
          animation: animation,
        ),
      );
    }
  }

  emitEmpty() {
    emit(const BookmarksState.empty());
  }

  getFromCache() async {
    try {
      emit(const BookmarksState.loading());
      bookmarks = BookmarksService.getFromCache();
      if (bookmarks.isEmpty) {
        await getFromServer();
      }
      bookmarks.isEmpty ? emitEmpty() : emit(BookmarksState.success(bookmarks: bookmarks));
      debugPrint('**************************** (Bloc) Loaded Bookmarks FromCache : ${bookmarks.length} ');
    } on KExceptionOffline {
      debugPrint('**************************** (Bloc) Bookmarks  Error FromCache : ${Tr.get.no_connection} ');
      emit(BookmarksState.error(error: Tr.get.no_connection));
    } catch (e) {
      debugPrint('**************************** (Bloc) Bookmarks  Error FromCache: $e ');
      emit(BookmarksState.error(error: Tr.get.something_went_wrong));
    }
  }

  getFromServer() async {
    try {
      bookmarks = await BookmarksService.getFromServer();
      bookmarks.isEmpty ? emitEmpty() : emit(BookmarksState.success(bookmarks: bookmarks));
      debugPrint('**************************** (Bloc) Loaded Bookmarks FromServer: ${bookmarks.length} ');
    } on KExceptionOffline {
      debugPrint('**************************** (Bloc) Bookmarks  Error FromServer: ${Tr.get.no_connection} ');
      emit(BookmarksState.error(error: Tr.get.no_connection));
    } catch (e) {
      debugPrint('**************************** (Bloc) Bookmarks  Error FromServer: $e ');
      emit(BookmarksState.error(error: Tr.get.something_went_wrong));
    }
  }

  bool isBooked(String uid) {
    return bookmarks.where((element) => element.uid == uid).isNotEmpty;
  }
}

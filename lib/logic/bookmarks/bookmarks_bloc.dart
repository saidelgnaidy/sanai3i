import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanai3i/logic/bookmarks/bookmark_state.dart';
import 'package:sanai3i/models/user/user_model.dart';
import 'package:sanai3i/services/bookmarks/bookmark_service.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/view/widgets/user_tile.dart';

class BookmarksBloc extends Cubit<BookmarksState> {
  BookmarksBloc() : super(const BookmarksState.loading());

  static BookmarksBloc of(BuildContext context) {
    return BlocProvider.of<BookmarksBloc>(context);
  }

  List<KUser> bookmarks = [];
  ScrollController scrollController = ScrollController();
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  addToBookmark(KUser user) async {
    if (bookmarks.contains(user) && (listKey.currentState?.mounted ?? false)) {
      listKey.currentState!.removeItem(bookmarks.indexOf(user), (context, animation) => KUserTileWidget(user: user, animation: animation));
    }
    try {
      emit(const BookmarksState.loading());
      bookmarks = BookmarksService.addToCache(user);
      getBookmark();
      emit(BookmarksState.success(bookmarks: bookmarks));
      debugPrint('**************************** bookmarks : ${bookmarks.length} ');
      await BookmarksService.toogleOnServer(user.uid!);
    } on KExceptionOffline {
      debugPrint('**************************** BookmarksBloc Error : No Connection');
      emit(BookmarksState.error(error: Tr.get.no_connection));
    } catch (e) {
      debugPrint('**************************** BookmarksBloc Error : $e');
      emit(BookmarksState.error(error: Tr.get.something_went_wrong));
    }
  }

  getBookmark() async {
    try {
      emit(const BookmarksState.loading());
      bookmarks = await BookmarksService.getBookmarks();
      debugPrint('**************************** Loaded Bookmarks : ${bookmarks.length} ');

      emit(BookmarksState.success(bookmarks: bookmarks));
    } on KExceptionOffline {
      debugPrint('**************************** Bookmarks Bloc Error : ${Tr.get.no_connection} ');
      emit(BookmarksState.error(error: Tr.get.no_connection));
    } catch (e) {
      debugPrint('**************************** Bookmarks Bloc Error : $e ');
      emit(BookmarksState.error(error: Tr.get.something_went_wrong));
    }
  }

  bool isBooked(String uid) {
    return bookmarks.where((element) => element.uid == uid).isNotEmpty;
  }
}

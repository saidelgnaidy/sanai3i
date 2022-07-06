import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanai3i/logic/bookmarks/bookmark_state.dart';
import 'package:sanai3i/logic/bookmarks/bookmarks_bloc.dart';
import 'package:sanai3i/view/widgets/error_widget.dart';
import 'package:sanai3i/view/widgets/loading_widget.dart';
import 'package:sanai3i/view/widgets/user_tile.dart';

class BookmarksView extends StatelessWidget {
  const BookmarksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarksBloc, BookmarksState>(
      builder: (context, bookmarks) {
        return bookmarks.map(
          loading: (load) => const KLoadingWidget(),
          error: (error) => KErrorWidget(error: error.error),
          success: (state) {
            return RefreshIndicator(
              onRefresh: () {
                return BookmarksBloc.of(context).getBookmark();
              },
              child: AnimatedList(
                key: BookmarksBloc.of(context).listKey,
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 100, top: 8),
                controller: BookmarksBloc.of(context).scrollController,
                initialItemCount: state.bookmarks.length,
                itemBuilder: (context, index, animation) {
                  return KUserTileWidget(user: BookmarksBloc.of(context).bookmarks[index], tileHeight: 100, inBookmarks: true, animation: animation);
                },
              ),
            );
          },
        );
      },
    );
  }
}

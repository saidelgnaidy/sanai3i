import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sanai3i/logic/bookmarks/bookmark_state.dart';
import 'package:sanai3i/logic/bookmarks/bookmarks_bloc.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/view/widgets/error_widget.dart';
import 'package:sanai3i/view/widgets/loading_widget.dart';
import 'package:sanai3i/view/widgets/user_tile.dart';

class BookmarksView extends StatelessWidget {
  const BookmarksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookmarksBloc, BookmarksState>(
      listener: (context, state) {
        state.mapOrNull(
          success: (value) {
            if (value.bookmarks.isEmpty) {
              BookmarksBloc.of(context).emitEmpty();
            }
          },
        );
      },
      builder: (context, bookmarks) {
        return bookmarks.map(
          empty: (value) => KErrorWidget(error: Tr.get.empty_bookmark, onTryAgain: BookmarksBloc.of(context).getFromServer),
          loading: (load) => const KLoadingWidget(),
          error: (error) => KErrorWidget(error: error.error, onTryAgain: BookmarksBloc.of(context).getFromServer),
          success: (state) {
            return RefreshIndicator(
              onRefresh: () {
                return BookmarksBloc.of(context).getFromServer();
              },
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              child: AnimatedList(
                key: BookmarksBloc.of(context).listKey,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: Get.height * .8, top: 8),
                controller: BookmarksBloc.of(context).scrollController,
                initialItemCount: state.bookmarks.length,
                itemBuilder: (context, index, animation) {
                  return KUserTileWidget(
                    user: BookmarksBloc.of(context).bookmarks[index],
                    tileHeight: 100,
                    inBookmarks: true,
                    animation: animation,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

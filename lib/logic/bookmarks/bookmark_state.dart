import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sanai3i/models/user/user_model.dart';
part 'bookmark_state.freezed.dart';

@freezed
abstract class BookmarksState with _$BookmarksState {
  const factory BookmarksState.loading() = BookmarksStateLoading;
  const factory BookmarksState.success({required List<KUser> bookmarks}) = BookmarksStateSuccess;
  const factory BookmarksState.error({required String error}) = BookmarksStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 
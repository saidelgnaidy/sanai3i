import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_states.freezed.dart';

@freezed
abstract class UserInfoState with _$UserInfoState {
  const factory UserInfoState.loading() = UserInfoStateLoading;
  const factory UserInfoState.success() = UserInfoStateSuccess;
  const factory UserInfoState.error({required String error }) = UserInfoStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 
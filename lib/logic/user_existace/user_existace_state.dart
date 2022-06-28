import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_existace_state.freezed.dart';

@freezed
abstract class UserExistenceState with _$UserExistenceState {
  const factory UserExistenceState.loading() = UserExistenceLoading;
  const factory UserExistenceState.completed() = UserExistenceCompleted;
  const factory UserExistenceState.missing() = UserExistenceMissing;
  const factory UserExistenceState.offline() = UserExistenceOffline;
  const factory UserExistenceState.error() = UserExistenceError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 
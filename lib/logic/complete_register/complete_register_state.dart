import 'package:freezed_annotation/freezed_annotation.dart';
part 'complete_register_state.freezed.dart';

@freezed
abstract class CompleteRegisterState with _$CompleteRegisterState {
  const factory CompleteRegisterState.loading() = CompleteRegisterStateLoading;
  const factory CompleteRegisterState.completed() = CompleteRegisterStateCompleted;
  const factory CompleteRegisterState.missing() = CompleteRegisterStateMissing;
  const factory CompleteRegisterState.offline() = CompleteRegisterStateOffline;
  const factory CompleteRegisterState.error() = CompleteRegisterStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 
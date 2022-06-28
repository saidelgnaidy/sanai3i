

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sanai3i/models/auth/register_model.dart';
part 'complete_reg_state.freezed.dart';
@freezed
abstract class CompleteRegisterState with _$CompleteRegisterState{
  const factory CompleteRegisterState.initial() = CompleteRegisterStateInitial;
  const factory CompleteRegisterState.loading() = CompleteRegisterStateLoading;
  const factory CompleteRegisterState.success() = CompleteRegisterStateSuccess;
  const factory CompleteRegisterState.updated({required RegisterModel model}) = CompleteRegisterStateUpdated;
  const factory CompleteRegisterState.error({required String error}) = CompleteRegisterStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 
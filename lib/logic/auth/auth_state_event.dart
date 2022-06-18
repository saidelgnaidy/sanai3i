


import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state_event.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthStateInitial ;
  const factory AuthState.loading() = _AuthStateLoading ;
  const factory AuthState.loaded() = _AuthStateLoaded ;
  const factory AuthState.codeSent() = _AuthStateCodeSent ;
  const factory AuthState.error(String error) = _AuthStatePhoneError ;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 
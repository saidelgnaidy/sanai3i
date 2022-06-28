import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'picker_states.freezed.dart';

@freezed
abstract class LocationPickerState with _$LocationPickerState{
  const factory LocationPickerState.loading() = LocationPickerStateLoading;
  const factory LocationPickerState.mark({required Marker marker }) = LocationPickerStateMark;
  const factory LocationPickerState.error({required String error }) = LocationPickerStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 
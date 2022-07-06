import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sanai3i/models/user/user_model.dart';
part 'service_provider_states.freezed.dart';

@freezed
abstract class ServiceProvidersState with _$ServiceProvidersState {
  const factory ServiceProvidersState.loading() = ServiceProvidersStateLoading;
  const factory ServiceProvidersState.success({required List<Marker> allMarkers, required double rad, required double sliderPos}) = ServiceProvidersStateSuccess;
  const factory ServiceProvidersState.error({required String error}) = ServiceProvidersStateError;
  const factory ServiceProvidersState.markertabed({required KUser user}) = ServiceProvidersStateMarkertabed;
  const factory ServiceProvidersState.locationError({required String error}) = ServiceProvidersStateLocationError;
  const factory ServiceProvidersState.offlineError() = ServiceProvidersStateOfflineError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 
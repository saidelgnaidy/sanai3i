import 'package:freezed_annotation/freezed_annotation.dart';
part 'exceptions.freezed.dart';

@freezed
abstract class KException with _$KException implements Exception {
  const factory KException.offline() = KExceptionOffline;
  const factory KException.server() = KExceptionServer;
  const factory KException.emptyCache() = KExceptionEmptyCache;
  const factory KException.locationDenaid() = KExceptionLocationDenaid;
  const factory KException.locationDiabled() = KExceptionLocationDiabled;
  const factory KException.locationDenaidPermenetl() = KExceptionLocationDenaidPermenetl;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 




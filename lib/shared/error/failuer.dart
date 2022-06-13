
// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'failuer.freezed.dart';


@freezed
abstract class Failuer with _$Failuer{
  const factory Failuer.offline() = OfflineFailuer;
  const factory Failuer.server() = ServerFailuer;
  const factory Failuer.emptyCache() = EmptyCacheFailuer;
  const factory Failuer.wrongPhone() = WrongPphoneFailuer;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 
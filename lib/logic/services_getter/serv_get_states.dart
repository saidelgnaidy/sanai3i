
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sanai3i/models/service_model/service_model.dart';
part 'serv_get_states.freezed.dart';

@freezed
class ServicesGetterState with _$ServicesGetterState {
  const factory ServicesGetterState.loading() = _ServicesGetterStateLoading ;
  const factory ServicesGetterState.success( {required List<ServiceModel> services}) = _ServicesGetterStateSuccess ;
  const factory ServicesGetterState.error({required String error}) = _ServicesGetterStateError ;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 
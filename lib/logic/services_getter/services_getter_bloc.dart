import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanai3i/logic/services_getter/serv_get_states.dart';
import 'package:sanai3i/models/service_model/service_model.dart';
import 'package:sanai3i/services/services_getter/service_get_sev.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';

class ServicesGetterBloc extends Cubit<ServicesGetterState> {
  ServicesGetterBloc() : super(const ServicesGetterState.loading());

  static ServicesGetterBloc of(BuildContext context) {
    return BlocProvider.of<ServicesGetterBloc>(context);
  }

  List<ServiceModel> _services = [];

  getServices() async {
    try {
      _services = await ServicesGetterService.call();
      emit(ServicesGetterState.success(services: _services));
    } on KExceptionOffline {
      emit(ServicesGetterState.error(error: Tr.get.no_connection));
    } catch (e) {
      emit(ServicesGetterState.error(error: e.toString()));
      debugPrint('Get Services Error : $e');
    }
  }

  List<ServiceModel> get jobs => _services.where((element) => element.type == ServiceType.job).toList();
  List<ServiceModel> get shops => _services.where((element) => element.type == ServiceType.shop).toList();
  List<ServiceModel> get transport => _services.where((element) => element.type == ServiceType.transport).toList();
}

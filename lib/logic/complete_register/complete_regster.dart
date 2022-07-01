import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sanai3i/logic/complete_register/complete_reg_state.dart';
import 'package:sanai3i/models/auth/register_model.dart';
import 'package:sanai3i/models/service_model/service_model.dart';
import 'package:sanai3i/services/complete_register/complete_register_serv.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/view/maps/pick_location_view.dart';
import 'package:sanai3i/view/widgets/button_to_dialog.dart';

class CompleteRegisterBloc extends Cubit<CompleteRegisterState> {
  CompleteRegisterBloc() : super(const CompleteRegisterState.initial());

  static CompleteRegisterBloc of(BuildContext context) {
    return BlocProvider.of<CompleteRegisterBloc>(context);
  }

  TextEditingController nameCtrll = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AccType? accType;
  ServiceModel? serviceModel;
  RegisterModel model =
      RegisterModel(accType: null, name: null, phone: FirebaseAuth.instance.currentUser!.phoneNumber, serviceId: null, available: true, location: null);

  openMapDialog() {
    Get.dialog(
      KPopupDialg(
        tag: Tr.get.select_location,
        child: const LocationPicker(),
      ),
    );
  }

  AccType? setAccType(AccType? accType) {
    this.accType = accType!;
    model = model.copyWith(accType: accType.toString());
    Get.back();
    emit(CompleteRegisterState.updated(model: model));
    return this.accType;
  }

  setService(ServiceModel? serviceModel) {
    this.serviceModel = serviceModel!;
    model = model.copyWith(serviceId: serviceModel.id);
    Get.back();
    emit(CompleteRegisterState.updated(model: model));
  }

  complete_register({Marker? marker}) async {
    if (formKey.currentState!.validate()) {
      if (model.accType == null) {
        emit(CompleteRegisterState.error(error: Tr.get.pls_select_acc_type));
        return;
      }

      if (model.accType == AccType.serviceProvider.toString()) {
        if (marker == null) {
          openMapDialog();
          return;
        }

        if (serviceModel == null) {
          emit(CompleteRegisterState.error(error: Tr.get.pls_select_service));
          return;
        }
      }
      emit(const CompleteRegisterState.loading());

      try {
        await CompleteRegisterService.call(model.copyWith(
          name: nameCtrll.text,
          serviceId: serviceModel!.id,
          service: serviceModel,
          location: GeoFirePoint(
            marker!.position.latitude,
            marker.position.longitude,
          ).data,
        ));
        emit(const CompleteRegisterState.success());
      } on KExceptionOffline {
        emit(CompleteRegisterState.error(error: Tr.get.no_connection));
      } catch (e) {
        debugPrint('**Complete register Error : $e ***');
        emit(CompleteRegisterState.error(error: Tr.get.try_later));
      }
    }
  }
}

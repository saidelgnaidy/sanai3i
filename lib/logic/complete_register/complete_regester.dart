import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanai3i/logic/complete_register/complete_register_state.dart';
import 'package:sanai3i/services/complete_register/com_register_serv.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/theme/helper.dart';

class CompleteRegisterBloc extends Cubit<CompleteRegisterState> {
  CompleteRegisterBloc() : super(const CompleteRegisterState.loading());

  static CompleteRegisterBloc of(BuildContext context) {
    return BlocProvider.of<CompleteRegisterBloc>(context);
  }

  Future registerCompleted() async {
    try {
      bool userExist = await CompleteRegisterService.call();
      if (userExist) {
        emit(const CompleteRegisterState.completed());
      } else {
        KHelper.showSnackBar(Tr.get.complete_reg, isTop: true);
        emit(const CompleteRegisterState.missing());
      }
    } on OfflineException {
      emit(const CompleteRegisterState.offline());
    } catch (e) {
      debugPrint(' *** Error Checking if user exist : ${e.toString()}');
      emit(const CompleteRegisterState.error());
    }
  }
}

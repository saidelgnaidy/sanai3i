import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanai3i/logic/user_existace/user_existace_state.dart';
import 'package:sanai3i/services/user_exist/user_exist_ser.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/shared/theme/helper.dart';

class UserExistenceBloc extends Cubit<UserExistenceState> {
  UserExistenceBloc() : super(const UserExistenceState.loading());

  static UserExistenceBloc of(BuildContext context) {
    return BlocProvider.of<UserExistenceBloc>(context);
  }

  Future call() async {
    emit(const UserExistenceState.loading());
    try {
      bool userExist = await UserExistaceService.call();
      if (userExist) {
        emit(const UserExistenceState.completed());
      } else {
        KHelper.showSnackBar(Tr.get.complete_reg, isTop: true);
        emit(const UserExistenceState.missing());
      }
    } on KExceptionOffline {
      emit(const UserExistenceState.offline());
    } catch (e) {
      debugPrint(' *** Error Checking if user exist : ${e.toString()}');
      emit(const UserExistenceState.error());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanai3i/logic/user_info/user_states.dart';
import 'package:sanai3i/models/auth/register_model.dart';
import 'package:sanai3i/models/user/user_model.dart';
import 'package:sanai3i/services/user_info/user_info_serv.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';

class UserInfoBloc extends Cubit<UserInfoState> {
  UserInfoBloc() : super(const UserInfoState.loading());

  static UserInfoBloc of(BuildContext context) {
    return BlocProvider.of<UserInfoBloc>(context);
  }

  KUser? user = KUser(accType: AccType.client, name: 'Name', phone: '+20 01234567899', serviceId: "");

  getUser() async {
    try {
      user = await UserInfoService.call();
      emit(const UserInfoState.success());
    } on KExceptionOffline {
      debugPrint('*** User info Error : No Connection');

      emit(UserInfoState.error(error: Tr.get.no_connection));
    } on KExceptionUserNotFound {
      debugPrint('*** User info Error : User Not Found');

      emit(UserInfoState.error(error: Tr.get.something_went_wrong));
    } catch (e) {
      debugPrint('*** User info Error : $e');
      emit(UserInfoState.error(error: Tr.get.something_went_wrong));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sanai3i/logic/complete_register/complete_reg_state.dart';
import 'package:sanai3i/logic/complete_register/complete_regster.dart';
import 'package:sanai3i/logic/maps_ctrl/pick_location_bloc.dart';
import 'package:sanai3i/logic/maps_ctrl/picker_states.dart';
import 'package:sanai3i/logic/user_existace/user_existace.dart';
import 'package:sanai3i/models/auth/register_model.dart';
import 'package:sanai3i/view/widgets/shared_components.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/profile/components.dart';
import 'package:sanai3i/view/widgets/appbar.dart';
import 'package:sanai3i/view/widgets/button_to_dialog.dart';
import 'package:sanai3i/view/widgets/loading_overlay.dart';
import 'package:sanai3i/view/widgets/selecte_service_view.dart';
import 'package:sanai3i/view/widgets/text_field.dart';

class CompleteInfoView extends StatelessWidget {
  const CompleteInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(KHelper.hPading),
        child: BlocConsumer<CompleteRegisterBloc, CompleteRegisterState>(
          listener: (context, state) {
            state.mapOrNull(success: (value) => UserExistenceBloc.of(context).call());
          },
          builder: (context, state) {
            return KLoadingOverlay(
              isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
              child: Form(
                key: CompleteRegisterBloc.of(context).formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    KTextFormField(
                      hintText: Tr.get.name,
                      controller: CompleteRegisterBloc.of(context).nameCtrll,
                      validator: (name) {
                        if (name != null && name.length >= 4) {
                          return null;
                        } else {
                          return Tr.get.short_name;
                        }
                      },
                    ),
                    const SizedBox(height: 5),
                    KCheckMark(
                      checked: CompleteRegisterBloc.of(context).accType != null,
                      child: KSelectAccType(
                        title: CompleteRegisterBloc.of(context).accType != null
                            ? CompleteRegisterBloc.of(context).accType == AccType.client
                                ? Tr.get.client
                                : Tr.get.service_provider
                            : Tr.get.acc_type,
                      ),
                    ),
                    const SizedBox(height: 5),
                    if (CompleteRegisterBloc.of(context).accType == AccType.serviceProvider)
                      BlocBuilder<LocationPickerBloc, LocationPickerState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              KCheckMark(
                                checked: LocationPickerBloc.of(context).myMarker != null,
                                child: KButton(
                                  title: Tr.get.select_location,
                                  onPressed: CompleteRegisterBloc.of(context).openMapDialog,
                                ),
                              ),
                              const SizedBox(height: 5),
                              KCheckMark(
                                checked: CompleteRegisterBloc.of(context).serviceModel != null,
                                child: KButtonToDialog(
                                  tag: Tr.get.service,
                                  title: CompleteRegisterBloc.of(context).serviceModel != null
                                      ? Tr.isAr
                                          ? CompleteRegisterBloc.of(context).serviceModel!.nameAr
                                          : CompleteRegisterBloc.of(context).serviceModel!.nameEn
                                      : Tr.get.service,
                                  dialog: KSelectService(onSelect: CompleteRegisterBloc.of(context).setService),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: state.maybeWhen(
                        orElse: () => const SizedBox(),
                        error: (error) => Text(error, style: KTextStyle.of(context).error),
                      ),
                    ),
                    KButton(
                      title: Tr.get.save,
                      width: Get.width / 2,
                      onPressed: () {
                        CompleteRegisterBloc.of(context).complete_register(marker: LocationPickerBloc.of(context).myMarker);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

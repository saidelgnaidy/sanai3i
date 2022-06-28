import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sanai3i/logic/complete_register/complete_reg_state.dart';
import 'package:sanai3i/logic/complete_register/complete_regster.dart';
import 'package:sanai3i/logic/maps_ctrl/pick_location_bloc.dart';
import 'package:sanai3i/logic/maps_ctrl/picker_states.dart';
import 'package:sanai3i/logic/services_getter/serv_get_states.dart';
import 'package:sanai3i/logic/services_getter/services_getter_bloc.dart';
import 'package:sanai3i/logic/user_existace/user_existace.dart';
import 'package:sanai3i/models/auth/register_model.dart';
import 'package:sanai3i/models/service_model/service_model.dart';
import 'package:sanai3i/shared/const.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/profile/components.dart';
import 'package:sanai3i/view/widgets/appbar.dart';
import 'package:sanai3i/view/widgets/button_to_dialog.dart';
import 'package:sanai3i/view/widgets/error_widget.dart';
import 'package:sanai3i/view/widgets/loading_overlay.dart';
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
            return LoadingOverlay(
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
                                  dialog: const KSelectService(),
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

class KSelectService extends StatelessWidget {
  const KSelectService({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesGetterBloc, ServicesGetterState>(
      builder: (context, state) {
        return SizedBox(
          width: Get.width,
          height: Get.height * .9,
          child: state.map(
            error: (value) => KErrorWidget(error: value.error),
            loading: (value) => const LoadingOverlay(isLoading: true),
            success: (value) => SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Column(
                children: [
                  SizedBox(width: Get.width, child: Divider(color: KColors.of(context).divider, height: 2)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(Tr.get.workers, style: KTextStyle.of(context).title),
                  ),
                  Wrap(
                    children: [
                      ...ServicesGetterBloc.of(context).jobs.map((service) {
                        return KServiceBtn(service: service);
                      })
                    ],
                  ),
                  SizedBox(width: Get.width, child: Divider(color: KColors.of(context).divider, height: 2)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(Tr.get.shops, style: KTextStyle.of(context).title),
                  ),
                  Wrap(
                    children: [
                      ...ServicesGetterBloc.of(context).shops.map((service) {
                        return KServiceBtn(service: service);
                      })
                    ],
                  ),
                  SizedBox(width: Get.width, child: Divider(color: KColors.of(context).divider, height: 2)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(Tr.get.transport, style: KTextStyle.of(context).title),
                  ),
                  Wrap(
                    children: [
                      ...ServicesGetterBloc.of(context).transport.map((service) {
                        return KServiceBtn(service: service);
                      })
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class KServiceBtn extends StatelessWidget {
  final ServiceModel service;
  const KServiceBtn({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: RawMaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2).copyWith(top: 8),
        onPressed: () {
          CompleteRegisterBloc.of(context).setService(service);
        },
        shape: const StadiumBorder(),
        fillColor: KColors.of(context).background,
        child: Text(Tr.isAr ? service.nameAr : service.nameEn, style: KTextStyle.of(context).textBtn),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sanai3i/logic/services_getter/serv_get_states.dart';
import 'package:sanai3i/logic/services_getter/services_getter_bloc.dart';
import 'package:sanai3i/models/service_model/service_model.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/widgets/error_widget.dart';
import 'package:sanai3i/view/widgets/loading_overlay.dart';

class KSelectService extends StatelessWidget {
  final Function(ServiceModel?) onSelect;

  const KSelectService({Key? key, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesGetterBloc, ServicesGetterState>(
      builder: (context, state) {
        return SizedBox(
          width: Get.width,
          height: Get.height * .85,
          child: state.map(
            error: (value) => KErrorWidget(error: value.error),
            loading: (value) => const KLoadingOverlay(isLoading: true),
            success: (value) => SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  
                  WrapServices(onSelect: onSelect, list: ServicesGetterBloc.of(context).jobs, title: Tr.get.workers),
                  WrapServices(onSelect: onSelect, list: ServicesGetterBloc.of(context).shops, title: Tr.get.shops),
                  WrapServices(onSelect: onSelect, list: ServicesGetterBloc.of(context).transport, title: Tr.get.transport),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class WrapServices extends StatelessWidget {
  final List<ServiceModel> list;
  final String title;
  const WrapServices({Key? key, required this.onSelect, required this.list, required this.title}) : super(key: key);

  final Function(ServiceModel? p1) onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: KColors.of(context).divider, height: 1, thickness: .5),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(title, style: KTextStyle.of(context).title),
        ),
        SizedBox(
          width: Get.width,
          child: Wrap(
            spacing: 3,
            alignment: WrapAlignment.start,
            children: [
              ...list.map((service) {
                return KServiceBtn(service: service, onSelect: onSelect);
              })
            ],
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}

class KServiceBtn extends StatelessWidget {
  final ServiceModel service;
  final Function(ServiceModel? serviceModel) onSelect;
  const KServiceBtn({Key? key, required this.service, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 5),
      onPressed: () {
        onSelect(service);
      },
      shape: const StadiumBorder(),
      fillColor: KColors.of(context).background,
      child: Text(Tr.isAr ? service.nameAr : service.nameEn, style: KTextStyle.of(context).textBtn),
    );
  }
}

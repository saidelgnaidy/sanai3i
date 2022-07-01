import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sanai3i/logic/services_getter/serv_get_states.dart';
import 'package:sanai3i/logic/services_getter/services_getter_bloc.dart';
import 'package:sanai3i/models/service_model/service_model.dart';
import 'package:sanai3i/shared/src/localization/trans.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/widgets/images_sliders.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<ServicesGetterBloc, ServicesGetterState>(
        builder: (context, state) {
          return Column(
            children: [
              ImageSlider(),
              KServiceGridView(title: Tr.get.workers, list: ServicesGetterBloc.of(context).jobs),
              KServiceGridView(title: Tr.get.shops, list: ServicesGetterBloc.of(context).shops),
              KServiceGridView(title: Tr.get.transport, list: ServicesGetterBloc.of(context).transport),
              const SizedBox(height: 100)
            ],
          );
        },
      ),
    );
  }
}

class KServiceGridView extends StatelessWidget {
  final String title;
  final List<ServiceModel> list;
  const KServiceGridView({Key? key, required this.title, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: KHelper.hPading, vertical: 5),
          child: SizedBox(
            width: Get.width,
            child: Text(
              title,
              style: KTextStyle.of(context).title2,
            ),
          ),
        ),
        SizedBox(
          height: 130,
          child: MasonryGridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 6,
            scrollDirection: Axis.horizontal,
            crossAxisSpacing: 6,
            padding: const EdgeInsets.symmetric(horizontal: KHelper.hPading, vertical: 5),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  debugPrint(list[index].toJson());
                },
                child: Text(
                  Tr.isAr ? list[index].nameAr : list[index].nameEn,
                  style: KTextStyle.of(context).body2,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

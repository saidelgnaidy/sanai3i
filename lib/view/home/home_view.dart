import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:sanai3i/logic/services_getter/serv_get_states.dart';
import 'package:sanai3i/logic/services_getter/services_getter_bloc.dart';
import 'package:sanai3i/models/service_model/service_model.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/shared/theme/helper.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/maps/result_map.dart';
import 'package:sanai3i/view/widgets/images_sliders.dart';
import 'package:sanai3i/view/widgets/shared_components.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<ServicesGetterBloc, ServicesGetterState>(
        builder: (context, state) {
          final bool isLoading = state.maybeWhen(orElse: () => false, loading: () => true);
          return Column(
            children: [
              ImageSlider(),
              KServiceGridView(
                title: Tr.get.workers,
                list: ServicesGetterBloc.of(context).jobs,
                isLoading: isLoading,
              ),
              KServiceGridView(
                title: Tr.get.shops,
                list: ServicesGetterBloc.of(context).shops,
                isLoading: isLoading,
              ),
              KServiceGridView(
                title: Tr.get.transport,
                list: ServicesGetterBloc.of(context).transport,
                isLoading: isLoading,
              ),
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
  final bool? isLoading;
  const KServiceGridView({Key? key, required this.title, required this.list, this.isLoading = true}) : super(key: key);

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
        if (isLoading!)
          const SizedBox(
            height: 130,
            child: KShimmerList(length: 20, width: 100),
          )
        else
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
                    Get.to(() =>  ResultsInMaps(serviceId: list[index].id!));
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

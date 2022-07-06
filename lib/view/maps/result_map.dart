import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sanai3i/logic/service_provider/service_provicer_bloc.dart';
import 'package:sanai3i/logic/service_provider/service_provider_states.dart';
import 'package:sanai3i/logic/service_provider/tile_list_bloc.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/shared/theme/colors.dart';
import 'package:sanai3i/shared/theme/helper.dart';

import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/widgets/appbar.dart';
import 'package:sanai3i/view/widgets/error_widget.dart';
import 'package:sanai3i/view/widgets/loading_widget.dart';
import 'package:sanai3i/view/widgets/no_conniction_view.dart';
import 'package:sanai3i/view/widgets/user_tile.dart';

class ResultsInMaps extends StatelessWidget {
  final String serviceId;
  const ResultsInMaps({Key? key, required this.serviceId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServiceProvidersBloc>(create: (context) => ServiceProvidersBloc()..getpros(serviceId: serviceId)),
        BlocProvider<KUsersTilesBloc>(create: (context) => KUsersTilesBloc()),
      ],
      child: Scaffold(
        appBar: const KAppBar(),
        body: BlocConsumer<ServiceProvidersBloc, ServiceProvidersState>(
          listener: (context, state) {
            state.maybeWhen(orElse: () => null, markertabed: (user) => KUsersTilesBloc.of(context).add(user));
          },
          buildWhen: (p, c) => c.maybeWhen(orElse: () => true, markertabed: (val) => false),
          builder: (context, state) {
            return state.map(
              markertabed: (value) => const SizedBox(),
              loading: (state) => const KLoadingWidget(),
              error: (state) => KErrorWidget(error: state.error),
              locationError: (state) => KErrorWidget(
                error: state.error,
                onTryAgain: () => ServiceProvidersBloc.of(context).getpros(serviceId: serviceId),
                widget: Lottie.asset('assets/animations/location.json', height: Get.height * .3),
              ),
              offlineError: (state) => KOfflineView(onTryAgain: () => ServiceProvidersBloc.of(context).getpros(serviceId: serviceId)),
              success: (state) => Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  GoogleMap(
                    initialCameraPosition: const CameraPosition(target: LatLng(30.5694305, 31.3649991), zoom: 11),
                    onMapCreated: ServiceProvidersBloc.of(context).onMapCreated,
                    myLocationEnabled: true,
                    markers: Set.from(state.allMarkers),
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                  ),
                  const Positioned(
                    bottom: 60,
                    child: UsersTileListView(),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      color: KColors.of(context).background,
                      padding: const EdgeInsets.symmetric(horizontal: KHelper.hPading),
                      width: Get.width,
                      height: 55,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(Tr.get.expand_search_rad, style: KTextStyle.of(context).body2),
                          SliderTheme(
                            data: const SliderThemeData(
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6, elevation: 5),
                              trackHeight: 1,
                              overlayShape: RoundSliderThumbShape(enabledThumbRadius: 10, elevation: 5),
                            ),
                            child: Slider.adaptive(
                              activeColor: KColors.of(context).reBackground,
                              inactiveColor: Colors.transparent,
                              max: 70,
                              min: 10,
                              divisions: 6,
                              value: state.rad,
                              label: "${state.rad} km",
                              onChangeEnd: ServiceProvidersBloc.of(context).updateQuery,
                              onChanged: ServiceProvidersBloc.of(context).updateQuery,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class UsersTileListView extends StatelessWidget {
  const UsersTileListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KUsersTilesBloc, KUsersTilesState>(
      builder: (context, users) {
        return SizedBox(
          height: 75,
          width: Get.width,
          child: PageView.builder(
            controller: KUsersTilesBloc.of(context).ctrl,
            itemCount: users.users.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: KUserTileWidget(user: users.users[index]),
              );
            },
          ),
        );
      },
    );
  }
}

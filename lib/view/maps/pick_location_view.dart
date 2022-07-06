import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sanai3i/logic/maps_ctrl/pick_location_bloc.dart';
import 'package:sanai3i/logic/maps_ctrl/picker_states.dart';
import 'package:sanai3i/view/widgets/shared_components.dart';
import 'package:sanai3i/shared/localization/trans.dart';
import 'package:sanai3i/shared/theme/text_theme.dart';
import 'package:sanai3i/view/widgets/error_widget.dart';
import 'package:sanai3i/view/widgets/loading_overlay.dart';

class LocationPicker extends StatelessWidget {
  const LocationPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationPickerBloc, LocationPickerState>(
      builder: (context, state) {
        return state.map(
          mark: (mark) => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      Tr.get.select_location,
                      style: KTextStyle.of(context).title,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height - 200,
                  width: Get.width,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    onTap: (LatLng latLng) {
                      LocationPickerBloc.of(context).markNewLocation(latLng);
                    },
                    zoomControlsEnabled: true,
                    initialCameraPosition: LocationPickerBloc.of(context).myLocation!,
                    myLocationEnabled: true,
                    markers: {mark.marker},
                    onMapCreated: (GoogleMapController controller) {
                      if (!LocationPickerBloc.of(context).mapCompleter.isCompleted) {
                        LocationPickerBloc.of(context).mapCompleter.complete(controller);
                      }
                    },
                  ),
                ),
                KButton(
                  title: Tr.get.save,
                  isRounded: false,
                  hieght: 50,
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ),
          loading: (_) => const KLoadingOverlay(isLoading: true, reverseTheme: true),
          error: (error) => KErrorWidget(
            error: error.error,
            onTryAgain: () => LocationPickerBloc.of(context).init,
            widget: Lottie.asset('assets/animations/location.json', height: Get.height * .3),
          ),
        );
      },
    );
  }
}

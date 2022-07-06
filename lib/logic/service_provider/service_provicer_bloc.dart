import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sanai3i/logic/service_provider/service_provider_states.dart';
import 'package:sanai3i/models/user/user_model.dart';
import 'package:sanai3i/services/loacation/location_serv.dart';
import 'package:sanai3i/services/servicer_provider/service_provider_serv.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/localization/trans.dart';

class ServiceProvidersBloc extends Cubit<ServiceProvidersState> {
  ServiceProvidersBloc() : super(const ServiceProvidersState.loading());

  static ServiceProvidersBloc of(BuildContext context) {
    return BlocProvider.of<ServiceProvidersBloc>(context);
  }

  Position? myPosition;
  GoogleMapController? mapController;
  List<Marker> allMarkers = [];
  BehaviorSubject<double> radius = BehaviorSubject.seeded(10);
  final Map<double, double> kmToZoomMap = {10.0: 11.0, 20.0: 10.5, 30.0: 10.0, 40.0: 9.5, 50.0: 9.0, 60.0: 8.5, 70.0: 8.0};
  final Map<double, double> zoomToKmMap = {11.0: 10.0, 10.5: 20.0, 10.0: 30.0, 9.5: 40.0, 9.0: 50.0, 8.5: 60.0, 8.0: 70.0};
  double sliderPos = -200.0, lastRadius = 10;

  onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  updateQuery(double value) async {
    final double zoom = kmToZoomMap[value]?.toDouble() ?? 11.0;
    final double curentZoom = await mapController!.getZoomLevel();
    if (curentZoom > zoom) {
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(myPosition!.latitude, myPosition!.longitude),
            zoom: zoom,
          ),
        ),
      );
    }
    emit(ServiceProvidersState.success(allMarkers: allMarkers, rad: radius.value, sliderPos: sliderPos));
    if (lastRadius != value) {
      radius.add(value);
      lastRadius = value;
    }
  }

  void _updateMarkers(List<DocumentSnapshot<Map<String, dynamic>?>> docList) async {
    allMarkers = [];
    for (var doc in docList) {
      final KUser user = KUser.fromMap(doc.data() as Map<String, dynamic>).copyWith(uid: doc.id);
      GeoPoint geoPoint = user.location!.geoPoint;
      var marker = Marker(
        position: LatLng(geoPoint.latitude, geoPoint.longitude),
        markerId: MarkerId(user.uid!),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: user.name),
        onTap: () {
          emit(ServiceProvidersState.markertabed(user: user));
        },
      );
      allMarkers.add(marker);
    }
    emit(ServiceProvidersState.success(allMarkers: allMarkers, rad: radius.value, sliderPos: sliderPos));
    debugPrint('******************************************** Markers Updated : ${allMarkers.length} Markers');
  }

  void toggleSlider() {
    sliderPos = sliderPos == -200 ? 5.0 : -200;
    emit(ServiceProvidersState.success(allMarkers: allMarkers, rad: radius.value, sliderPos: sliderPos));
  }

  getpros({required String serviceId}) async {
    emit(const ServiceProvidersState.loading());
    try {
      myPosition = await KLocationService.call();
      GeoFirePoint center = GeoFirePoint(myPosition!.latitude, myPosition!.longitude);
      GeoFireCollectionRef geoRef = await ServiceProvidersServ.startQuery(serviceId: serviceId);

      radius.switchMap((rad) {
        return geoRef.within(center: center, radius: rad, field: 'location', strictMode: true);
      }).listen(_updateMarkers);
    } on KExceptionLocationDiabled {
      emit(ServiceProvidersState.locationError(error: Tr.get.location_disabled));
    } on KExceptionLocationDenaid {
      emit(ServiceProvidersState.locationError(error: Tr.get.location_denaid));
    } on KExceptionLocationDenaidPermenetl {
      emit(ServiceProvidersState.locationError(error: Tr.get.location_denaid_permanently));
    } on KExceptionOffline {
      emit(const ServiceProvidersState.offlineError());
    } catch (e) {
      debugPrint('Service provider Error : $e');
      emit(ServiceProvidersState.error(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    radius.close();
    return super.close();
  }
}

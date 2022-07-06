import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sanai3i/logic/maps_ctrl/picker_states.dart';
import 'package:sanai3i/services/loacation/location_serv.dart';
import 'package:sanai3i/shared/error/exceptions.dart';
import 'package:sanai3i/shared/localization/trans.dart';

class LocationPickerBloc extends Cubit<LocationPickerState> {
  LocationPickerBloc() : super(const LocationPickerState.loading());

  static LocationPickerBloc of(BuildContext context) {
    return BlocProvider.of<LocationPickerBloc>(context);
  }

  final Completer<GoogleMapController> mapCompleter = Completer();

  Marker? myMarker;
  CameraPosition? myLocation;

  Future get init async {
    emit(const LocationPickerState.loading());

    if (myLocation == null) {
      try {
        Position position = await KLocationService.call();
        myLocation = CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 10);
        markNewLocation(LatLng(position.latitude, position.longitude));
      } on KExceptionLocationDenaid {
        emit(LocationPickerState.error(error: Tr.get.location_denaid));
      } on KExceptionLocationDenaidPermenetl {
        emit(LocationPickerState.error(error: Tr.get.location_denaid_permanently));
      } on KExceptionLocationDiabled {
        emit(LocationPickerState.error(error: Tr.get.location_disabled));
      } on KExceptionOffline {
        emit(LocationPickerState.error(error: Tr.get.no_connection));
      } catch (e) {
        emit(LocationPickerState.error(error: Tr.get.something_went_wrong));
      }
    }
  }

  markNewLocation(LatLng latLong) {
    myMarker = Marker(
      markerId: const MarkerId('selectedLocation'),
      position: LatLng(latLong.latitude, latLong.longitude),
    );
    emit(LocationPickerState.mark(marker: myMarker!));
    debugPrint("*** lat: ${latLong.latitude} , long: ${latLong.longitude}  ***");
  }
  
}

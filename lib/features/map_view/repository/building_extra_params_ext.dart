import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/map_active_marker_cntrl.dart';
import '../controllers/map_widget_controller.dart';
import 'map_buildings_repo.dart';

typedef RefReadOrWatch<T> = T Function(ProviderListenable<T> provider);

extension BuildingExtraParamsExt on Building {
  LatLng get location => LatLng(latitude, longitude);

  MarkerId get markerId => MarkerId(id);

  bool isActive(RefReadOrWatch<Building?> refReadOrWatch) =>
      refReadOrWatch(mapActiveMarkerControllerProvider) == this;

  BitmapDescriptor mapMarkerIcon(RefReadOrWatch<Building?> refReadOrWatch) =>
      isActive(refReadOrWatch)
          ? MapWidgetController.activeMapMarker
          : MapWidgetController.mapMarker;

  String? get addresFormatted =>
      addres?.replaceFirst(",", "\n").replaceAll("\n ", "\n");
}

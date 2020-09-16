import 'package:flutter/material.dart';
import 'package:map_launcher/src/map_launcher.dart';
import 'package:map_launcher/src/svg_provider.dart';
import 'package:map_launcher/src/utils.dart';

enum MapType {
  apple,
  google,
  amap,
  baidu,
  waze,
  yandexMaps,
  yandexNavi,
  citymapper,
  mapswithme,
  osmand,
  doubleGis,
}

enum DirectionsMode {
  driving,
  walking,
  transit,
  bicycling,
}

enum MapStyle {
  standard,
  satellite,
}

class Coords {
  final double latitude;
  final double longitude;

  Coords(this.latitude, this.longitude);
}

class AvailableMap {
  String mapName;
  MapType mapType;
  ImageProvider icon;

  AvailableMap({this.mapName, this.mapType, this.icon});

  static AvailableMap fromJson(json) {
    return AvailableMap(
      mapName: json['mapName'],
      mapType: Utils.enumFromString(MapType.values, json['mapType']),
      icon: SvgImage(
        'assets/icons/${json['mapType']}.svg',
        package: 'map_launcher',
      ),
    );
  }

  Future<void> showMarker({
    @required Coords coords,
    @required String title,
    String description,
    int zoom,
    MapStyle mapStyle,
  }) {
    return MapLauncher.showMarker(
      mapType: mapType,
      coords: coords,
      title: title,
      description: description,
      zoom: zoom,
      mapStyle: mapStyle,
    );
  }

  Future<void> showDirections({
    @required Coords destination,
    String destinationTitle,
    Coords origin,
    String originTitle,
    List<Coords> waypoints,
    DirectionsMode directionsMode,
  }) {
    return MapLauncher.showDirections(
      mapType: mapType,
      destination: destination,
      destinationTitle: destinationTitle,
      origin: origin,
      originTitle: originTitle,
      waypoints: waypoints,
      directionsMode: directionsMode,
    );
  }

  @override
  String toString() {
    return 'AvailableMap { mapName: $mapName, mapType: ${Utils.enumToString(mapType)} }';
  }
}

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'features/iparking_chart/utils/range_hour_points.dart';

abstract class MyAppConfig {
  static const title = "ToPwr";
}

abstract class AppBarConfig {
  static const logoAssetName = "assets/logo_app_bar.svg";
}

abstract class SplashScreenConfig {
  static const logoAssetName = "assets/splash_screen/splash_logo.png";
  static const additionalWaitDuration = Duration(seconds: 1);
  static const animationDuration = Duration(milliseconds: 800);
  static const androidSplashSizeInDp = 288.0;
  static const androidNativeSplashColor = Color(0xFFEE6644);
}

abstract class CountdownConfig {
  static const defaultDigit = 0;
}

abstract class DepartmentsConfig {
  static const defaultColorFirst = '#BFBEBE';
  static const defaultColorSecond = '#999898';

  static const listSeparatorSize = 16.0;

  static const departmentsTabGridDelegate =
      SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 600,
    mainAxisExtent: 92,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
  );
}

abstract class DateChipConfig {
  static const dateTimeFormat = 'dd.MM.yyyy';
}

abstract class HomeScreenConfig {
  static const paddingSmall = 6.0;
  static const paddingMedium = 16.0;
}

abstract class BigPreviewCardConfig {
  static const cardHeight = 360.0;
  static const cardWidth = 240.0;
}

abstract class SearchWidgetConfig {
  static const searchIconName = "assets/search_box/vectorsearch.svg";
  static const height = 36.0;
}

abstract class WideTileCardConfig {
  static const basePadding = 16.0;
  static const titlesSpacing = 8.0;
  static const minWidthForExtraPadding = 375;
  static const extraPaddingFactor = 0.33;

  static const imageSize = 92.0;
  static const radius = Radius.circular(8);

  static const defaultActiveShadows = [
    BoxShadow(
      color: Color.fromRGBO(250, 100, 101, 0.16),
      blurRadius: 11.0,
      spreadRadius: 6.0,
    )
  ];
}

abstract class DetailsScreenConfig {
  static const double spacerHeight = 16;
  static const String defaultIconUrl = 'assets/icons/ic_web.png';
}

abstract class DetailsScreenHeaderConfig {
  static const double logoSize = 130;
}

typedef MapSheetSize = ({
  double recomendedSheetHeight,
  double recomendedActiveSheetHeight,
  double minSheetHeight,
});

abstract class MapViewBottomSheetConfig {
  static const bottomSheetRadius = Radius.circular(24);

  static const MapSheetSize buildingsMapSheetSize = (
    recomendedSheetHeight: 357,
    recomendedActiveSheetHeight: 357,
    minSheetHeight: 150,
  );

  static const MapSheetSize parkingsMapSheetSize = (
    recomendedSheetHeight: 357,
    recomendedActiveSheetHeight: 480,
    minSheetHeight: 150,
  );

  static const lineHandleSectionHeight = 36.0;
  static const horizontalPadding = 24.0;

  static const horizontalPanelModeMinWidth = 700;
}

abstract class MapWidgetConfig {
  static const defaultMarkerZoom = 17.0;
  static const defaultCameraPosition = CameraPosition(
    target: LatLng(51.10738, 17.05964),
    zoom: 16,
  );
  static const mapType = MapType.normal;

  static const mapMarkerAssetName = "assets/map_markers/map_marker.png";
  static const activeMapMarkerAssetName =
      "assets/map_markers/active_map_marker.png";
  static const mapMarkerOriginWidth = 28;
  static const activeMapMarkerOriginWidth = 40;
}

abstract class ScientificCirclesTabConfig {
  static const listSeparatorSize = 16.0;
  static const microPadding = 4.0;
  static const smallPadding = 16.0;
  static const mediumPadding = 24.0;

  static const buttonBorderRadius = 100.0;

  static const researchGroupTabGridDelegate =
      SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 600,
    mainAxisExtent: 92,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
  );

  static const tagsGridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 100,
    mainAxisExtent: 92,
    crossAxisSpacing: 8,
    mainAxisSpacing: 16,
  );
}

abstract class ScientificCircleCardConfig {
  static const trailingPadding = 2.0;
}

abstract class IParkingConfig {
  static const padding = EdgeInsets.only(
    left: 13,
    top: 10,
    bottom: 16,
    right: 10,
  );
  static const extraIndentPadd = EdgeInsets.only(left: 2.0);
}

abstract class ParkingChartConfig {
  static final showLabels = generateRangeHourPoints(6, 22, 2).toList();
  static final showDots = generateRangeHourPoints(5, 22).toList();
}

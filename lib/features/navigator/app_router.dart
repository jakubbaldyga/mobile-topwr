import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../../../features/buildings_view/model/building_model.dart";
import "../about_us_view/about_us_view.dart";
import "../buildings_view/buildings_view.dart";
import "../departments/department_detail_view/department_detail_view.dart";
import "../departments/departments_view/departments_view.dart";
import "../digital_guide/presentation/digital_guide_view.dart";
import "../digital_guide/tabs/adapted_toilets/data/models/adapted_toilet.dart";
import "../digital_guide/tabs/adapted_toilets/presentation/adapted_toilet_detail_view.dart";
import "../digital_guide/tabs/lifts/data/models/digital_guide_lift.dart";
import "../digital_guide/tabs/lifts/presentation/digital_guide_lift_detail_view.dart";
import "../digital_guide/tabs/micronavigation/data/models/micronavigation_response.dart";
import "../digital_guide/tabs/micronavigation/presentation/micronavigation_detail_view.dart";
import "../digital_guide/tabs/rooms/data/models/digital_guide_room.dart";
import "../digital_guide/tabs/rooms/presentation/digital_guide_room_detail_view.dart";
import "../digital_guide_view/tabs/transportation/data/models/digital_guide_transportation.dart";
import "../digital_guide_view/tabs/transportation/presentation/transportation_detail_view.dart";
import "../guide_detail_view/guide_detail_view.dart";
import "../guide_view/guide_view.dart";
import "../home_view/home_view.dart";
import "../navigation_tab_view/navigation_tab_view.dart";
import "../parkings/parkings_view/parkings_view.dart";
import "../science_club/science_club_detail_view/science_club_detail_view.dart";
import "../science_club/science_clubs_view/science_clubs_view.dart";
import "../sks/sks_menu/presentation/sks_menu_screen.dart";
import "root_view.dart";

part "app_router.g.dart";
part "app_router.gr.dart";

class _NoTransitionRoute extends CustomRoute {
  _NoTransitionRoute({
    required super.path,
    required super.page,
  }) : super(
          reverseDurationInMilliseconds: 0,
          durationInMilliseconds: 0,
        );
}

@AutoRouterConfig(replaceInRouteName: "View,Route")
class AppRouter extends RootStackRouter {
  final Ref ref;

  AppRouter({required this.ref});

  // These have bottom nav bar visible
  // also they need to handle in app deeplinks differently
  List<AutoRoute> get routesWithinTabBar => [
        _NoTransitionRoute(
          path: "",
          page: HomeRoute.page,
        ),
        _NoTransitionRoute(
          path: "buildings/:initialActiveItemId",
          page: BuildingsRoute.page,
        ),
        RedirectRoute(path: "buildings", redirectTo: "buildings/null"),
        _NoTransitionRoute(
          path: "parkings/:initialActiveItemId",
          page: ParkingsRoute.page,
        ),
        RedirectRoute(path: "parkings", redirectTo: "parkings/null"),
        _NoTransitionRoute(
          path: "guide",
          page: GuideRoute.page,
        ),
        _NoTransitionRoute(
          path: "navigation",
          page: NavigationTabRoute.page,
        ),
        AutoRoute(
          path: "guide/:id",
          page: GuideDetailRoute.page,
        ),
      ];

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/",
          page: RootRoute.page,
          children: routesWithinTabBar,
        ),
        AutoRoute(
          path: "/sks-menu",
          page: SksMenuRoute.page,
        ),
        AutoRoute(
          path: "/departments",
          page: DepartmentsRoute.page,
        ),
        AutoRoute(
          path: "/departments/:id",
          page: DepartmentDetailRoute.page,
        ),
        AutoRoute(
          path: "/sci-clubs",
          page: ScienceClubsRoute.page,
        ),
        AutoRoute(
          path: "/sci-clubs/:id",
          page: ScienceClubDetailRoute.page,
        ),
        AutoRoute(
          path: "/aboutUs",
          page: AboutUsRoute.page,
        ),
        AutoRoute(
          path: "/digital-guide/:id",
          page: DigitalGuideRoute.page,
        ),
        AutoRoute(
          path: "/digital-guide/:id/room-details",
          page: DigitalGuideRoomDetailRoute.page,
        ),
        AutoRoute(
          path: "/digital-guide/:id/lift-details",
          page: DigitalGuideLiftDetailRoute.page,
        ),
        AutoRoute(page: TransportationDetailRoute.page),
        AutoRoute(
          path: "/digital-guide/:id/micronavigation-details",
          page: MicronavigationDetailRoute.page,
        ),
        AutoRoute(
          path: "/digital-guide/:id/adapted-toilet-details",
          page: AdaptedToiletDetailRoute.page,
        ),
      ];
}

@riverpod
Raw<AppRouter> appRouter(Ref ref) {
  return AppRouter(ref: ref);
}

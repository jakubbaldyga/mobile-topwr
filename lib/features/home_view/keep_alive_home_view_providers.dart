import "package:flutter/widgets.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../academic_calendar/repository/academic_calendar_repo.dart";
import "../buildings_view/repository/buildings_repository.dart";
import "../departments_view/repository/departments_repository.dart";
import "../guide_view/repository/guide_repository.dart";
import "../parkings_view/repository/parkings_repository.dart";
import "../science_clubs_view/repository/science_clubs_repository.dart";
import "home_view.dart";

part "keep_alive_home_view_providers.g.dart";

/// A [Widget] that prevents the [HomeView] scrollable section to flicker when scrolling by keeping all states stable.
class KeepAliveHomeViewProviders extends ConsumerWidget {
  const KeepAliveHomeViewProviders({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(keepAliveHomeViewProvidersProvider);
    return child;
  }
}

@riverpod
void keepAliveHomeViewProviders(KeepAliveHomeViewProvidersRef ref) {
  ref.watch(academicCalendarRepoProvider);
  ref.watch(parkingsRepositoryProvider);
  ref.watch(scienceClubsRepositoryProvider);
  ref.watch(buildingsRepositoryProvider);
  ref.watch(departmentsRepositoryProvider);
  ref.watch(guideRepositoryProvider);
  return;
}

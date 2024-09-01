import "package:fast_immutable_collections/fast_immutable_collections.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

import "../../utils/contains_lower_case.dart";
import "repository/departments_repository.dart";

part "departments_view_controllers.g.dart";

@riverpod
class SearchDepartmentsController extends _$SearchDepartmentsController {
  @override
  String build() => "";

  void onTextChanged(String newValue) {
    state = newValue;
  }
}

@riverpod
Future<IList<Department?>> departmentsList(DepartmentsListRef ref) async {
  final originalList = await ref.watch(departmentsRepositoryProvider.future);
  final query = ref.watch(searchDepartmentsControllerProvider);
  return originalList
      .where(
        (element) =>
            element.name.containsLowerCase(query) ||
            element.code.containsLowerCase(query),
      )
      .toIList();
}

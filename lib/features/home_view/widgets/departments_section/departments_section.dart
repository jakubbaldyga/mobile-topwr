import "package:fast_immutable_collections/fast_immutable_collections.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../../../utils/context_extensions.dart";
import "../../../../widgets/my_error_widget.dart";
import "../../../../widgets/subsection_header.dart";
import "../../../departments_view/repository/departments_repository.dart";
import "../../../navigator/utils/navigation_commands.dart";
import "../loading_widgets/scrollable_section_loading.dart";
import "../paddings.dart";
import "deparment_box.dart";

class DepartmentsSection extends ConsumerWidget {
  const DepartmentsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(departmentsRepositoryProvider);
    return Column(
      children: [
        SubsectionHeader(
          title: context.localize.departments,
          actionTitle: context.localize.list,
          onClick: ref.navigateDepartments,
        ),
        SmallHorizontalPadding(
          child: switch (state) {
            AsyncError(:final error) => MyErrorWidget(error),
            AsyncValue(:final IList<Department> value) => SizedBox(
                height: 120,
                child: _DepartmentsDataList(value),
              ),
            _ => const MediumLeftPadding(
                child: ScrollableSectionLoading(),
              ),
          },
        ),
      ],
    );
  }
}

class _DepartmentsDataList extends ConsumerWidget {
  const _DepartmentsDataList(this.departments);

  final IList<Department> departments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: departments.length,
      itemBuilder: (context, index) => MediumLeftPadding(
        child: DepartmentBox(
          departments[index],
          onClick: () async =>
              ref.navigateDepartmentDetail(departments[index].id),
        ),
      ),
    );
  }
}

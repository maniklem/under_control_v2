import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/presentation/widgets/overlay_groups_selection.dart';
import '../../../../core/presentation/widgets/overlay_users_selection.dart';
import '../../../../core/utils/responsive_size.dart';
import 'selected_groups_list.dart';
import 'selected_users_list.dart';

class AddTaskAssignCard extends StatelessWidget with ResponsiveSize {
  const AddTaskAssignCard({
    Key? key,
    required this.toggleUserSelection,
    required this.toggleGroupSelection,
    required this.toggleAddUsersVisibility,
    required this.toggleAddGroupsVisibility,
    required this.assignedUsers,
    required this.assignedGroups,
    required this.isAddUsersVisible,
    required this.isAddGroupsVisible,
  }) : super(key: key);

  final Function(String) toggleUserSelection;
  final Function(String) toggleGroupSelection;
  final Function() toggleAddUsersVisibility;
  final Function() toggleAddGroupsVisibility;
  final List<String> assignedUsers;
  final List<String> assignedGroups;
  final bool isAddUsersVisible;
  final bool isAddGroupsVisible;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    // title
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 8,
                        right: 8,
                      ),
                      child: Text(
                        AppLocalizations.of(context)!
                            .task_assign_groups_or_users,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.headline5!.fontSize,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // assigned users
                            SelectedUsersList(
                              onSelected: toggleUserSelection,
                              selectedUsers: assignedUsers,
                            ),
                            // assigned groups
                            SelectedGroupsList(
                              onSelected: toggleGroupSelection,
                              selectedGroups: assignedGroups,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: toggleAddUsersVisibility,
                        icon: const Icon(Icons.person_add),
                        label: Text(
                          AppLocalizations.of(context)!.task_assign_users,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade700,
                        ),
                        onPressed: toggleAddGroupsVisibility,
                        icon: const Icon(Icons.group_add),
                        label: Text(
                          AppLocalizations.of(context)!.task_assign_groups,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (isAddGroupsVisible)
          OverlayGroupsSelection(
            assignedGroups: assignedGroups,
            toggleGroupSelection: toggleGroupSelection,
            onDismiss: toggleAddGroupsVisibility,
          ),
        if (isAddUsersVisible)
          OverlayUsersSelection(
            assignedUsers: assignedUsers,
            toggleUserSelection: toggleUserSelection,
            onDismiss: toggleAddUsersVisibility,
          ),
      ],
    );
  }
}

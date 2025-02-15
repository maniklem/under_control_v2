import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../checklists/presentation/pages/checklist_management_page.dart';
import '../../core/utils/choice.dart';
import '../presentation/pages/add_task_page.dart';
import '../presentation/pages/add_work_request_page.dart';
import '../presentation/pages/work_request_archive_page.dart';

List<Choice> tasksOverlayMenuItems(BuildContext context) {
  final List<Choice> choices = [
    Choice(
      title: AppLocalizations.of(context)!.work_request_add,
      icon: Icons.add,
      onTap: () {
        Navigator.pushNamed(
          context,
          AddWorkRequestPage.routeName,
        );
      },
    ),
    Choice(
      title: AppLocalizations.of(context)!.work_request_archive,
      icon: Icons.history,
      onTap: () {
        Navigator.pushNamed(
          context,
          WorkRequestArchivePage.routeName,
        );
      },
    ),
    Choice(
      title: AppLocalizations.of(context)!.task_add,
      icon: Icons.add_task,
      onTap: () {
        Navigator.pushNamed(
          context,
          AddTaskPage.routeName,
        );
      },
    ),
    // Choice(
    //   title: AppLocalizations.of(context)!.work_request_archive,
    //   icon: Icons.history,
    //   onTap: () {
    //     Navigator.pushNamed(
    //       context,
    //       WorkRequestArchivePage.routeName,
    //     );
    //   },
    // ),
    Choice(
      title: AppLocalizations.of(context)!.checklist_drawer_title,
      icon: Icons.checklist_rounded,
      onTap: () {
        Navigator.pushNamed(
          context,
          ChecklistManagementPage.routeName,
        );
      },
    ),
  ];
  return choices;
}

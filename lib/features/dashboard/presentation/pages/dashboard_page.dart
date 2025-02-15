import 'package:flutter/material.dart';

import 'package:under_control_v2/features/dashboard/presentation/widgets/work_requests_latest.dart';

import '../widgets/assets_latest_actions.dart';
import '../widgets/assets_without_inspection.dart';
import '../widgets/inventory_latest_actions.dart';
import '../widgets/inventory_low_level_items.dart';
import '../widgets/tasks_latest.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          WorkRequestsLatest(),
          TasksLatest(),
          AssetsWithoutInspection(),
          AssetsLatestActions(),
          InventoryLowLevelItems(),
          InventoryLatestActions(),
        ],
      ),
    );
  }
}

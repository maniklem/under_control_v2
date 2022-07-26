import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../locations/presentation/blocs/bloc/location_bloc.dart';
import '../../../domain/entities/group.dart';
import 'group_details_location_tile.dart';

class GroupLocations extends StatefulWidget {
  const GroupLocations({
    Key? key,
    required this.group,
  }) : super(key: key);

  final Group group;

  @override
  State<GroupLocations> createState() => _GroupLocationsState();
}

class _GroupLocationsState extends State<GroupLocations> {
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title
        InkWell(
          onTap: toggleExpanded,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 4,
              right: 4,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.location_on,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    '${AppLocalizations.of(context)!.group_management_add_card_selected_locations}: ${widget.group.locations.length}',
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 16,
                    ),
                  ),
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
        ),
        // locations list
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            height: isExpanded ? null : 0,
            child: BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {
                if (state is LocationLoadedState) {
                  final topLevelItems = state.allLocations.allLocations
                      .where((location) => location.parentId.isEmpty)
                      .toList();
                  return ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: topLevelItems.length,
                    itemBuilder: (context, index) {
                      return GroupDetailsLocationTile(
                        selectedLocations: widget.group.locations,
                        allLocations: state.allLocations.allLocations,
                        location: topLevelItems[index],
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

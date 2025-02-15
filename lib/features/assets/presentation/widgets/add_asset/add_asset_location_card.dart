import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../selectable_location_list.dart';

class AddAssetLocationCard extends StatelessWidget {
  const AddAssetLocationCard({
    Key? key,
    required this.selectedLocation,
    required this.setLocation,
  }) : super(key: key);

  final String selectedLocation;
  final Function(String) setLocation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                      left: 8,
                      right: 8,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.asset_select_location,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline5!.fontSize,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1.5,
                  ),
                  SelectableLocationsList(
                    selectedLocation: selectedLocation,
                    setLocation: setLocation,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

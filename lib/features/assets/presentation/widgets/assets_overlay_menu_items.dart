import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/utils/choice.dart';
import '../../../core/utils/get_user_premission.dart';
import '../../../core/utils/premission.dart';
import '../../../groups/domain/entities/feature.dart';
import '../pages/add_asset_page.dart';
import '../pages/asset_category_management_page.dart';

List<Choice> assetsOverlayMenuItems(BuildContext context) {
  final List<Choice> choices = [
    if (getUserPremission(
      context: context,
      featureType: FeatureType.assets,
      premissionType: PremissionType.create,
    ))
      Choice(
        title: AppLocalizations.of(context)!.asset_add_new,
        icon: Icons.add,
        onTap: () {
          Navigator.pushNamed(
            context,
            AddAssetPage.routeName,
          );
        },
      ),
    Choice(
      title: AppLocalizations.of(context)!.item_category_title,
      icon: Icons.category,
      onTap: () {
        Navigator.pushNamed(
          context,
          AssetCategoryManagementPage.routeName,
        );
      },
    ),
  ];
  return choices;
}

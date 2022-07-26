import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/presentation/widgets/user_info_card.dart';
import '../../../user_profile/domain/entities/user_profile.dart';
import '../../domain/entities/group.dart';
import '../widgets/group_details/group_locations.dart';
import '../widgets/group_details/group_members.dart';
import '../widgets/group_details/show_group_delete_dialog.dart';
import '../widgets/group_management/group_management_feature_card.dart';

class GroupDetailsPage extends StatefulWidget {
  const GroupDetailsPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/groups/group-details';

  @override
  State<GroupDetailsPage> createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> {
  UserProfile? userProfile;
  bool isUserInfoCardVisible = false;

  void showUserInfoCard(UserProfile userProfile) {
    setState(() {
      this.userProfile = userProfile;
      isUserInfoCardVisible = true;
    });
  }

  void hideUserInfoCard() {
    setState(() {
      isUserInfoCardVisible = false;
      userProfile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // gets group data
    final group = ModalRoute.of(context)!.settings.arguments as Group;

    return WillPopScope(
      onWillPop: () async {
        if (isUserInfoCardVisible) {
          hideUserInfoCard();
          return false;
        }
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(group.name),
            centerTitle: true,
            actions: [
              // edit button
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              // delete button
              IconButton(
                onPressed: () async {
                  hideUserInfoCard();
                  final result = await showGroupDeleteDialog(
                      context: context, group: group);
                  if (result != null && result) {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.delete),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
          body: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.top,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // description
                        if (group.description.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                  ),
                                  child: Icon(
                                    Icons.text_snippet,
                                    size: 20,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  group.description,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.grey.shade200,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (group.description.isNotEmpty)
                          const Divider(thickness: 1.5),
                        // features
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black,
                                ),
                                child: Icon(
                                  Icons.error,
                                  size: 20,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                AppLocalizations.of(context)!
                                    .group_management_add_card_permissions,
                                style: TextStyle(
                                  color: Colors.grey.shade200,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        for (var feature in group.features)
                          GroupManagementFeatureCard(feature: feature),
                        const Divider(thickness: 1.5),
                        // locations
                        GroupLocations(group: group),
                        const Divider(
                          thickness: 1.5,
                          // height: 32,
                        ),
                        // group members
                        GroupMembers(
                          group: group,
                          onTap: showUserInfoCard,
                        ),
                      ],
                    ),
                  ),
                ),
                if (isUserInfoCardVisible)
                  UserInfoCard(
                    onDismiss: hideUserInfoCard,
                    user: userProfile!,
                  ),
              ],
            ),
          )),
    );
  }
}

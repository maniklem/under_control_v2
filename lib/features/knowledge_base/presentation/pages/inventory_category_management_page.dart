// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import '../../../core/presentation/widgets/loading_widget.dart';
// import '../../../core/utils/get_user_premission.dart';
// import '../../../core/utils/premission.dart';
// import '../../../core/utils/show_snack_bar.dart';
// import '../../../groups/domain/entities/feature.dart';
// import '../../../user_profile/domain/entities/user_profile.dart';
// import '../../../user_profile/presentation/blocs/user_profile/user_profile_bloc.dart';

// class InventoryCategoryManagementPage extends StatefulWidget {
//   const InventoryCategoryManagementPage({Key? key}) : super(key: key);

//   static const routeName = '/inventory-categories';

//   @override
//   State<InventoryCategoryManagementPage> createState() =>
//       _InventoryCategoryManagementPageState();
// }

// class _InventoryCategoryManagementPageState
//     extends State<InventoryCategoryManagementPage> {
//   bool _isAdministrator = false;
//   late UserProfile _currentUser;

//   @override
//   void didChangeDependencies() {
//     _currentUser =
//         (context.read<UserProfileBloc>().state as Approved).userProfile;
//     _isAdministrator = _currentUser.administrator;
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocalizations.of(context)!.item_category_title),
//         centerTitle: true,
//       ),
//       body:
//           BlocListener<InstructionCategoryManagementBloc, InstructionCategoryManagementState>(
//         listener: (context, state) {
//           if (state is ItemCategoryManagementSuccessState ||
//               state is ItemCategoryManagementErrorState) {
//             String message = '';
//             bool error = false;
//             switch (state.message) {
//               case ItemCategoryMessage.itemCategoryAdded:
//                 message = AppLocalizations.of(context)!.item_category_msg_added;
//                 break;
//               case ItemCategoryMessage.itemCategoryNotAdded:
//                 message =
//                     AppLocalizations.of(context)!.item_category_msg_not_added;
//                 error = true;
//                 break;
//               case ItemCategoryMessage.itemCategoryDeleted:
//                 message =
//                     AppLocalizations.of(context)!.item_category_msg_deleted;
//                 break;
//               case ItemCategoryMessage.itemCategoryNotDeleted:
//                 message =
//                     AppLocalizations.of(context)!.item_category_msg_not_deleted;
//                 error = true;
//                 break;
//               case ItemCategoryMessage.itemCategoryUpdated:
//                 message =
//                     AppLocalizations.of(context)!.item_category_msg_updated;
//                 break;
//               case ItemCategoryMessage.itemCategoryNotUpdated:
//                 message =
//                     AppLocalizations.of(context)!.item_category_msg_not_updated;
//                 error = true;
//                 break;
//               case ItemCategoryMessage.itemCategoryNotEmpty:
//                 message =
//                     AppLocalizations.of(context)!.item_category_msg_not_empty;
//                 error = true;
//                 break;
//               default:
//                 message = '';
//             }
//             if (message.isNotEmpty) {
//               showSnackBar(
//                 context: context,
//                 message: message,
//                 isErrorMessage: error,
//               );
//             }
//           }
//         },
//         child: BlocBuilder<ItemCategoryBloc, ItemCategoryState>(
//           builder: (context, state) {
//             if (state is ItemCategoryLoadedState) {
//               return ListView.builder(
//                 itemCount:
//                     state.allItemsCategories.allItemsCategories.length + 1,
//                 itemBuilder: (context, index) {
//                   if (index ==
//                       state.allItemsCategories.allItemsCategories.length) {
//                     return const SizedBox(
//                       height: 80,
//                     );
//                   } else {
//                     return Padding(
//                       padding: EdgeInsets.only(top: index == 0 ? 4 : 0),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8),
//                         child: CategoryTile(
//                           isAdministrator: _isAdministrator,
//                           itemCategory: state
//                               .allItemsCategories.allItemsCategories[index],
//                         ),
//                       ),
//                     );
//                   }
//                 },
//               );
//             } else {
//               return const LoadingWidget();
//             }
//           },
//         ),
//       ),
//       floatingActionButton: getUserPremission(
//         context: context,
//         featureType: FeatureType.inventory,
//         premissionType: PremissionType.create,
//       )
//           ? context.watch<ItemCategoryBloc>().state is ItemCategoryLoadedState
//               ? FloatingActionButton.extended(
//                   heroTag: null,
//                   onPressed: () {
//                     showAddCategoryModalBottomSheet(context: context);
//                   },
//                   icon: Icon(
//                     Icons.add,
//                     color: Colors.grey.shade200,
//                   ),
//                   label: Text(
//                     AppLocalizations.of(context)!.item_category_add_new,
//                     style: TextStyle(
//                       color: Colors.grey.shade200,
//                     ),
//                   ),
//                 )
//               // bloc state is not loaded
//               : null
//           // not an administrator
//           : null,
//     );
//   }
// }

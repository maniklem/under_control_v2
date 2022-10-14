// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart'
    as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i24;

import 'features/assets/data/repositories/asset_category_repository_impl.dart'
    as _i47;
import 'features/assets/domain/repositories/asset_category_repository.dart'
    as _i46;
import 'features/assets/domain/usecases/asset_category/add_asset_category.dart'
    as _i117;
import 'features/assets/domain/usecases/asset_category/delete_asset_category.dart'
    as _i63;
import 'features/assets/domain/usecases/asset_category/get_assets_categories_stream.dart'
    as _i75;
import 'features/assets/domain/usecases/asset_category/update_asset_category.dart'
    as _i110;
import 'features/assets/presentation/blocs/asset_category/asset_category_bloc.dart'
    as _i131;
import 'features/assets/presentation/blocs/asset_category_management/asset_category_management_bloc.dart'
    as _i145;
import 'features/authentication/data/repositories/authentication_repository_impl.dart'
    as _i52;
import 'features/authentication/domain/repositories/authentication_repository.dart'
    as _i51;
import 'features/authentication/domain/repositories/injectable_modules.dart'
    as _i152;
import 'features/authentication/domain/usecases/auto_signin.dart' as _i53;
import 'features/authentication/domain/usecases/check_email_verification.dart'
    as _i54;
import 'features/authentication/domain/usecases/send_password_reset_email.dart'
    as _i98;
import 'features/authentication/domain/usecases/send_verification_email.dart'
    as _i99;
import 'features/authentication/domain/usecases/signin.dart' as _i100;
import 'features/authentication/domain/usecases/signout.dart' as _i101;
import 'features/authentication/domain/usecases/signup.dart' as _i102;
import 'features/authentication/presentation/blocs/authentication/authentication_bloc.dart'
    as _i123;
import 'features/checklists/data/repositories/checklists_repository_impl.dart'
    as _i56;
import 'features/checklists/domain/repositories/checklists_repository.dart'
    as _i55;
import 'features/checklists/domain/usecases/add_checklist.dart' as _i118;
import 'features/checklists/domain/usecases/delete_checklist.dart' as _i64;
import 'features/checklists/domain/usecases/get_checklists_stream.dart' as _i76;
import 'features/checklists/domain/usecases/update_checklist.dart' as _i111;
import 'features/checklists/presentation/blocs/checklist/checklist_bloc.dart'
    as _i146;
import 'features/checklists/presentation/blocs/checklist_management/checklist_management_bloc.dart'
    as _i147;
import 'features/company_profile/data/repositories/company_management_repository_impl.dart'
    as _i58;
import 'features/company_profile/data/repositories/company_repository_impl.dart'
    as _i60;
import 'features/company_profile/domain/repositories/company_management_repository.dart'
    as _i57;
import 'features/company_profile/domain/repositories/company_repository.dart'
    as _i59;
import 'features/company_profile/domain/usecases/add_company.dart' as _i119;
import 'features/company_profile/domain/usecases/add_company_logo.dart'
    as _i120;
import 'features/company_profile/domain/usecases/fetch_all_companies.dart'
    as _i71;
import 'features/company_profile/domain/usecases/fetch_all_company_users.dart'
    as _i72;
import 'features/company_profile/domain/usecases/fetch_new_users.dart' as _i73;
import 'features/company_profile/domain/usecases/fetch_suspended_users.dart'
    as _i74;
import 'features/company_profile/domain/usecases/get_company_by_id.dart'
    as _i77;
import 'features/company_profile/domain/usecases/update_company.dart' as _i112;
import 'features/company_profile/presentation/blocs/company_management/company_management_bloc.dart'
    as _i132;
import 'features/company_profile/presentation/blocs/company_profile/company_profile_bloc.dart'
    as _i133;
import 'features/company_profile/presentation/blocs/new_users/new_users_bloc.dart'
    as _i143;
import 'features/company_profile/presentation/blocs/suspended_users/suspended_users_bloc.dart'
    as _i144;
import 'features/core/injectable_modules/injectable_modules.dart' as _i153;
import 'features/core/network/network_info.dart' as _i23;
import 'features/core/utils/input_validator.dart' as _i8;
import 'features/filter/presentation/blocs/filter/filter_bloc.dart' as _i148;
import 'features/groups/data/datasources/group_local_data_source.dart' as _i88;
import 'features/groups/data/datasources/group_remote_data_source.dart' as _i7;
import 'features/groups/data/repositories/group_repository_impl.dart' as _i90;
import 'features/groups/domain/repositories/group_repository.dart' as _i89;
import 'features/groups/domain/usecases/add_group.dart' as _i121;
import 'features/groups/domain/usecases/cache_groups.dart' as _i124;
import 'features/groups/domain/usecases/delete_group.dart' as _i126;
import 'features/groups/domain/usecases/get_groups_stream.dart' as _i129;
import 'features/groups/domain/usecases/try_to_get_cached_groups.dart' as _i104;
import 'features/groups/domain/usecases/update_group.dart' as _i113;
import 'features/groups/presentation/blocs/group/group_bloc.dart' as _i134;
import 'features/inventory/data/repositories/dashboard_item_action_repository_impl.dart'
    as _i62;
import 'features/inventory/data/repositories/item_action_repository_impl.dart'
    as _i14;
import 'features/inventory/data/repositories/item_category_repository_impl.dart'
    as _i16;
import 'features/inventory/data/repositories/item_fles_repository_impl.dart'
    as _i18;
import 'features/inventory/data/repositories/item_repository_impl.dart' as _i20;
import 'features/inventory/domain/repositories/dashboard_item_action_repository.dart'
    as _i61;
import 'features/inventory/domain/repositories/item_action_repository.dart'
    as _i13;
import 'features/inventory/domain/repositories/item_category_repository.dart'
    as _i15;
import 'features/inventory/domain/repositories/item_files_repository.dart'
    as _i17;
import 'features/inventory/domain/repositories/item_repository.dart' as _i19;
import 'features/inventory/domain/usecases/add_item.dart' as _i37;
import 'features/inventory/domain/usecases/add_item_photo.dart' as _i40;
import 'features/inventory/domain/usecases/delete_item.dart' as _i67;
import 'features/inventory/domain/usecases/delete_item_photo.dart' as _i70;
import 'features/inventory/domain/usecases/get_items_stream.dart' as _i84;
import 'features/inventory/domain/usecases/item_action/add_item_action.dart'
    as _i38;
import 'features/inventory/domain/usecases/item_action/delete_item_action.dart'
    as _i68;
import 'features/inventory/domain/usecases/item_action/get_dashboard_item_actions_stream.dart'
    as _i78;
import 'features/inventory/domain/usecases/item_action/get_dashboard_last_five_item_actions_stream.dart'
    as _i79;
import 'features/inventory/domain/usecases/item_action/get_item_actions_stream.dart'
    as _i82;
import 'features/inventory/domain/usecases/item_action/get_last_five_item_actions_stream.dart'
    as _i85;
import 'features/inventory/domain/usecases/item_action/move_item_action.dart'
    as _i22;
import 'features/inventory/domain/usecases/item_action/update_item_action.dart'
    as _i28;
import 'features/inventory/domain/usecases/item_category/add_item_category.dart'
    as _i39;
import 'features/inventory/domain/usecases/item_category/delete_item_category.dart'
    as _i69;
import 'features/inventory/domain/usecases/item_category/get_items_categories_stream.dart'
    as _i83;
import 'features/inventory/domain/usecases/item_category/update_item_category.dart'
    as _i29;
import 'features/inventory/domain/usecases/update_item.dart' as _i27;
import 'features/inventory/domain/usecases/update_item_photo.dart' as _i30;
import 'features/inventory/presentation/blocs/dashboard_item_action/dashboard_item_action_bloc.dart'
    as _i151;
import 'features/inventory/presentation/blocs/item_action/item_action_bloc.dart'
    as _i91;
import 'features/inventory/presentation/blocs/item_action_management/item_action_management_bloc.dart'
    as _i138;
import 'features/inventory/presentation/blocs/item_category/item_category_bloc.dart'
    as _i139;
import 'features/inventory/presentation/blocs/item_category_management/item_category_management_bloc.dart'
    as _i140;
import 'features/inventory/presentation/blocs/items/items_bloc.dart' as _i150;
import 'features/inventory/presentation/blocs/items_management/items_management_bloc.dart'
    as _i141;
import 'features/knowledge_base/data/repositories/instruction_category_repository_impl.dart'
    as _i10;
import 'features/knowledge_base/data/repositories/instruction_repository_impl.dart'
    as _i12;
import 'features/knowledge_base/domain/repositories/instruction_category_repository.dart'
    as _i9;
import 'features/knowledge_base/domain/repositories/instruction_repository.dart'
    as _i11;
import 'features/knowledge_base/domain/usecases/add_instruction.dart' as _i35;
import 'features/knowledge_base/domain/usecases/delete_instruction.dart'
    as _i65;
import 'features/knowledge_base/domain/usecases/get_instructions_stream.dart'
    as _i81;
import 'features/knowledge_base/domain/usecases/item_category/add_instruction_category.dart'
    as _i36;
import 'features/knowledge_base/domain/usecases/item_category/delete_instruction_category.dart'
    as _i66;
import 'features/knowledge_base/domain/usecases/item_category/get_instructions_categories_stream.dart'
    as _i80;
import 'features/knowledge_base/domain/usecases/item_category/update_instruction_category.dart'
    as _i26;
import 'features/knowledge_base/domain/usecases/update_instruction.dart'
    as _i25;
import 'features/knowledge_base/presentation/blocs/instruction/instruction_bloc.dart'
    as _i149;
import 'features/knowledge_base/presentation/blocs/instruction_category/instruction_category_bloc.dart'
    as _i135;
import 'features/knowledge_base/presentation/blocs/instruction_category_management/instruction_category_management_bloc.dart'
    as _i136;
import 'features/knowledge_base/presentation/blocs/instruction_management/instruction_management_bloc.dart'
    as _i137;
import 'features/locations/data/datasources/location_local_data_source.dart'
    as _i92;
import 'features/locations/data/datasources/location_remote_data_source.dart'
    as _i21;
import 'features/locations/data/repositories/location_repository_impl.dart'
    as _i94;
import 'features/locations/domain/repositories/location_repository.dart'
    as _i93;
import 'features/locations/domain/usecases/add_location.dart' as _i122;
import 'features/locations/domain/usecases/cache_location.dart' as _i125;
import 'features/locations/domain/usecases/delete_location.dart' as _i127;
import 'features/locations/domain/usecases/fetch_all_locations.dart' as _i128;
import 'features/locations/domain/usecases/try_to_get_cached_location.dart'
    as _i105;
import 'features/locations/domain/usecases/update_location.dart' as _i114;
import 'features/locations/presentation/blocs/bloc/location_bloc.dart' as _i142;
import 'features/user_profile/data/repositories/user_files_repository_impl.dart'
    as _i32;
import 'features/user_profile/data/repositories/user_profile_repository_impl.dart'
    as _i34;
import 'features/user_profile/domain/repositories/user_files_repository.dart'
    as _i31;
import 'features/user_profile/domain/repositories/user_profile_repository.dart'
    as _i33;
import 'features/user_profile/domain/usecases/add_user.dart' as _i41;
import 'features/user_profile/domain/usecases/add_user_avatar.dart' as _i42;
import 'features/user_profile/domain/usecases/approve_passive_user.dart'
    as _i43;
import 'features/user_profile/domain/usecases/approve_user.dart' as _i44;
import 'features/user_profile/domain/usecases/approve_user_and_make_admin.dart'
    as _i45;
import 'features/user_profile/domain/usecases/assign_group_admin.dart' as _i48;
import 'features/user_profile/domain/usecases/assign_user_to_company.dart'
    as _i49;
import 'features/user_profile/domain/usecases/assign_user_to_group.dart'
    as _i50;
import 'features/user_profile/domain/usecases/get_user_by_id.dart' as _i86;
import 'features/user_profile/domain/usecases/get_user_stream_by_id.dart'
    as _i87;
import 'features/user_profile/domain/usecases/make_user_administrator.dart'
    as _i95;
import 'features/user_profile/domain/usecases/reject_user.dart' as _i96;
import 'features/user_profile/domain/usecases/reset_company.dart' as _i97;
import 'features/user_profile/domain/usecases/suspend_user.dart' as _i103;
import 'features/user_profile/domain/usecases/unassign_group_admin.dart'
    as _i106;
import 'features/user_profile/domain/usecases/unassign_user_from_group.dart'
    as _i107;
import 'features/user_profile/domain/usecases/unmake_user_administrator.dart'
    as _i108;
import 'features/user_profile/domain/usecases/unsuspend_user.dart' as _i109;
import 'features/user_profile/domain/usecases/update_user_data.dart' as _i115;
import 'features/user_profile/presentation/blocs/user_management/user_management_bloc.dart'
    as _i116;
import 'features/user_profile/presentation/blocs/user_profile/user_profile_bloc.dart'
    as _i130; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final dataConnectionCheckerModule = _$DataConnectionCheckerModule();
  final firebaseAuthenticationService = _$FirebaseAuthenticationService();
  final firebaseFirestoreService = _$FirebaseFirestoreService();
  final firebaseStorageService = _$FirebaseStorageService();
  final sharedPreferencesService = _$SharedPreferencesService();
  gh.lazySingleton<_i3.DataConnectionChecker>(
      () => dataConnectionCheckerModule.httpClient);
  gh.lazySingleton<_i4.FirebaseAuth>(
      () => firebaseAuthenticationService.firebaseAuth);
  gh.lazySingleton<_i5.FirebaseFirestore>(
      () => firebaseFirestoreService.firebaseFirestore);
  gh.lazySingleton<_i6.FirebaseStorage>(
      () => firebaseStorageService.firebaseStorage);
  gh.lazySingleton<_i7.GroupRemoteDataSource>(() =>
      _i7.GroupRemoteDataSourceImpl(
          firebaseFirestore: get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i8.InputValidator>(() => _i8.InputValidator());
  gh.lazySingleton<_i9.InstructionCategoryRepository>(() =>
      _i10.InstructionCategoryRepositoryImpl(
          firebaseFirestore: get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i11.InstructionRepository>(
      () => _i12.InstructionRepositoryImpl(
            firebaseFirestore: get<_i5.FirebaseFirestore>(),
            firebaseStorage: get<_i6.FirebaseStorage>(),
          ));
  gh.lazySingleton<_i13.ItemActionRepository>(() =>
      _i14.ItemActionRepositoryImpl(
          firebaseFirestore: get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i15.ItemCategoryRepository>(() =>
      _i16.ItemCategoryRepositoryImpl(
          firebaseFirestore: get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i17.ItemFilesRepository>(() => _i18.ItemFilesRepositoryImpl(
      firebaseStorage: get<_i6.FirebaseStorage>()));
  gh.lazySingleton<_i19.ItemRepository>(() =>
      _i20.ItemRepositoryImpl(firebaseFirestore: get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i21.LocationRemoteDataSource>(() =>
      _i21.LocationRemoteDataSourceImpl(
          firebaseFirestore: get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i22.MoveItemAction>(
      () => _i22.MoveItemAction(repository: get<_i13.ItemActionRepository>()));
  gh.lazySingleton<_i23.NetworkInfo>(() => _i23.NetworkInfoImpl(
      dataConnectionChecker: get<_i3.DataConnectionChecker>()));
  await gh.factoryAsync<_i24.SharedPreferences>(
    () => sharedPreferencesService.shaerdPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i25.UpdateInstruction>(() =>
      _i25.UpdateInstruction(repository: get<_i11.InstructionRepository>()));
  gh.lazySingleton<_i26.UpdateInstructionCategory>(() =>
      _i26.UpdateInstructionCategory(
          repository: get<_i9.InstructionCategoryRepository>()));
  gh.lazySingleton<_i27.UpdateItem>(
      () => _i27.UpdateItem(repository: get<_i19.ItemRepository>()));
  gh.lazySingleton<_i28.UpdateItemAction>(() =>
      _i28.UpdateItemAction(repository: get<_i13.ItemActionRepository>()));
  gh.lazySingleton<_i29.UpdateItemCategory>(() =>
      _i29.UpdateItemCategory(repository: get<_i15.ItemCategoryRepository>()));
  gh.lazySingleton<_i30.UpdateItemPhoto>(
      () => _i30.UpdateItemPhoto(repository: get<_i17.ItemFilesRepository>()));
  gh.lazySingleton<_i31.UserFilesRepository>(() => _i32.UserFilesRepositoryImpl(
      firebaseStorage: get<_i6.FirebaseStorage>()));
  gh.lazySingleton<_i33.UserProfileRepository>(() =>
      _i34.UserProfileRepositoryImpl(
          firebaseFirestore: get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i35.AddInstruction>(
      () => _i35.AddInstruction(repository: get<_i11.InstructionRepository>()));
  gh.lazySingleton<_i36.AddInstructionCategory>(() =>
      _i36.AddInstructionCategory(
          repository: get<_i9.InstructionCategoryRepository>()));
  gh.lazySingleton<_i37.AddItem>(
      () => _i37.AddItem(repository: get<_i19.ItemRepository>()));
  gh.lazySingleton<_i38.AddItemAction>(
      () => _i38.AddItemAction(repository: get<_i13.ItemActionRepository>()));
  gh.lazySingleton<_i39.AddItemCategory>(() =>
      _i39.AddItemCategory(repository: get<_i15.ItemCategoryRepository>()));
  gh.lazySingleton<_i40.AddItemPhoto>(
      () => _i40.AddItemPhoto(repository: get<_i17.ItemFilesRepository>()));
  gh.lazySingleton<_i41.AddUser>(
      () => _i41.AddUser(repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i42.AddUserAvatar>(
      () => _i42.AddUserAvatar(repository: get<_i31.UserFilesRepository>()));
  gh.lazySingleton<_i43.ApprovePassiveUser>(() =>
      _i43.ApprovePassiveUser(repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i44.ApproveUser>(
      () => _i44.ApproveUser(repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i45.ApproveUserAndMakeAdmin>(() =>
      _i45.ApproveUserAndMakeAdmin(
          repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i46.AssetCategoryRepository>(() =>
      _i47.AssetCategoryRepositoryImpl(
          firebaseFirestore: get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i48.AssignGroupAdmin>(() =>
      _i48.AssignGroupAdmin(repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i49.AssignUserToCompany>(() =>
      _i49.AssignUserToCompany(repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i50.AssignUserToGroup>(() =>
      _i50.AssignUserToGroup(repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i51.AuthenticationRepository>(
      () => _i52.AuthenticationRepositoryImpl(
            firebaseAuth: get<_i4.FirebaseAuth>(),
            networkInfo: get<_i23.NetworkInfo>(),
          ));
  gh.lazySingleton<_i53.AutoSignin>(() => _i53.AutoSignin(
      authenticationRepository: get<_i51.AuthenticationRepository>()));
  gh.lazySingleton<_i54.CheckEmailVerification>(() =>
      _i54.CheckEmailVerification(
          authenticationRepository: get<_i51.AuthenticationRepository>()));
  gh.lazySingleton<_i55.CheckListsRepository>(() =>
      _i56.ChecklistsRepositoryImpl(
          firebaseFirestore: get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i57.CompanyManagementRepository>(
      () => _i58.CompanyManagementRepositoryImpl(
            firebaseFirestore: get<_i5.FirebaseFirestore>(),
            firebaseStorage: get<_i6.FirebaseStorage>(),
          ));
  gh.lazySingleton<_i59.CompanyRepository>(() => _i60.CompanyRepositoryImpl(
      firebaseFirestore: get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i61.DashboardItemActionRepository>(() =>
      _i62.DashboardItemActionRepositoryImpl(
          firebaseFirestore: get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i63.DeleteAssetCategory>(() => _i63.DeleteAssetCategory(
      repository: get<_i46.AssetCategoryRepository>()));
  gh.lazySingleton<_i64.DeleteChecklist>(
      () => _i64.DeleteChecklist(repository: get<_i55.CheckListsRepository>()));
  gh.lazySingleton<_i65.DeleteInstruction>(() =>
      _i65.DeleteInstruction(repository: get<_i11.InstructionRepository>()));
  gh.lazySingleton<_i66.DeleteInstructionCategory>(() =>
      _i66.DeleteInstructionCategory(
          repository: get<_i9.InstructionCategoryRepository>()));
  gh.lazySingleton<_i67.DeleteItem>(
      () => _i67.DeleteItem(repository: get<_i19.ItemRepository>()));
  gh.lazySingleton<_i68.DeleteItemAction>(() =>
      _i68.DeleteItemAction(repository: get<_i13.ItemActionRepository>()));
  gh.lazySingleton<_i69.DeleteItemCategory>(() =>
      _i69.DeleteItemCategory(repository: get<_i15.ItemCategoryRepository>()));
  gh.lazySingleton<_i70.DeleteItemPhoto>(
      () => _i70.DeleteItemPhoto(repository: get<_i17.ItemFilesRepository>()));
  gh.lazySingleton<_i71.FetchAllCompanies>(() => _i71.FetchAllCompanies(
      companyManagementRepository: get<_i57.CompanyManagementRepository>()));
  gh.lazySingleton<_i72.FetchAllCompanyUsers>(() => _i72.FetchAllCompanyUsers(
      companyRepository: get<_i59.CompanyRepository>()));
  gh.lazySingleton<_i73.FetchNewUsers>(() =>
      _i73.FetchNewUsers(companyRepository: get<_i59.CompanyRepository>()));
  gh.lazySingleton<_i74.FetchSuspendedUsers>(() => _i74.FetchSuspendedUsers(
      companyRepository: get<_i59.CompanyRepository>()));
  gh.lazySingleton<_i75.GetAssetsCategoriesStream>(() =>
      _i75.GetAssetsCategoriesStream(
          repository: get<_i46.AssetCategoryRepository>()));
  gh.lazySingleton<_i76.GetChecklistStream>(() =>
      _i76.GetChecklistStream(repository: get<_i55.CheckListsRepository>()));
  gh.lazySingleton<_i77.GetCompanyById>(() =>
      _i77.GetCompanyById(companyRepository: get<_i59.CompanyRepository>()));
  gh.lazySingleton<_i78.GetDashboardItemsActionsStream>(() =>
      _i78.GetDashboardItemsActionsStream(
          repository: get<_i61.DashboardItemActionRepository>()));
  gh.lazySingleton<_i79.GetDashboardLastFiveItemsActionsStream>(() =>
      _i79.GetDashboardLastFiveItemsActionsStream(
          repository: get<_i61.DashboardItemActionRepository>()));
  gh.lazySingleton<_i80.GetInstructionsCategoriesStream>(() =>
      _i80.GetInstructionsCategoriesStream(
          repository: get<_i9.InstructionCategoryRepository>()));
  gh.lazySingleton<_i81.GetInstructionsStream>(() => _i81.GetInstructionsStream(
      repository: get<_i11.InstructionRepository>()));
  gh.lazySingleton<_i82.GetItemsActionsStream>(() =>
      _i82.GetItemsActionsStream(repository: get<_i13.ItemActionRepository>()));
  gh.lazySingleton<_i83.GetItemsCategoriesStream>(() =>
      _i83.GetItemsCategoriesStream(
          repository: get<_i15.ItemCategoryRepository>()));
  gh.lazySingleton<_i84.GetItemsStream>(
      () => _i84.GetItemsStream(repository: get<_i19.ItemRepository>()));
  gh.lazySingleton<_i85.GetLastFiveItemsActionsStream>(() =>
      _i85.GetLastFiveItemsActionsStream(
          repository: get<_i13.ItemActionRepository>()));
  gh.lazySingleton<_i86.GetUserById>(
      () => _i86.GetUserById(repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i87.GetUserStreamById>(() => _i87.GetUserStreamById(
      userRepository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i88.GroupLocalDataSource>(() =>
      _i88.GroupLocalDataSourceImpl(source: get<_i24.SharedPreferences>()));
  gh.lazySingleton<_i89.GroupRepository>(() => _i90.GroupRepositoryImpl(
        groupRemoteDataSource: get<_i7.GroupRemoteDataSource>(),
        groupLocalDataSource: get<_i88.GroupLocalDataSource>(),
      ));
  gh.factory<_i91.ItemActionBloc>(() => _i91.ItemActionBloc(
        getItemsActionsStream: get<_i82.GetItemsActionsStream>(),
        getLastFiveItemsActionsStream:
            get<_i85.GetLastFiveItemsActionsStream>(),
      ));
  gh.lazySingleton<_i92.LocationLocalDataSource>(() =>
      _i92.LocationLocalDataSourceImpl(source: get<_i24.SharedPreferences>()));
  gh.lazySingleton<_i93.LocationRepository>(() => _i94.LocationRepositoryImpl(
        locationLocalDataSource: get<_i92.LocationLocalDataSource>(),
        locationRemoteDataSource: get<_i21.LocationRemoteDataSource>(),
      ));
  gh.lazySingleton<_i95.MakeUserAdministrator>(() => _i95.MakeUserAdministrator(
      repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i96.RejectUser>(
      () => _i96.RejectUser(repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i97.ResetCompany>(
      () => _i97.ResetCompany(repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i98.SendPasswordResetEmail>(() =>
      _i98.SendPasswordResetEmail(
          authenticationRepository: get<_i51.AuthenticationRepository>()));
  gh.lazySingleton<_i99.SendVerificationEmail>(() => _i99.SendVerificationEmail(
      authenticationRepository: get<_i51.AuthenticationRepository>()));
  gh.lazySingleton<_i100.Signin>(() => _i100.Signin(
      authenticationRepository: get<_i51.AuthenticationRepository>()));
  gh.lazySingleton<_i101.Signout>(() => _i101.Signout(
      authenticationRepository: get<_i51.AuthenticationRepository>()));
  gh.lazySingleton<_i102.Signup>(() => _i102.Signup(
      authenticationRepository: get<_i51.AuthenticationRepository>()));
  gh.lazySingleton<_i103.SuspendUser>(
      () => _i103.SuspendUser(repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i104.TryToGetCachedGroups>(() =>
      _i104.TryToGetCachedGroups(groupRepository: get<_i89.GroupRepository>()));
  gh.lazySingleton<_i105.TryToGetCachedLocation>(() =>
      _i105.TryToGetCachedLocation(
          locationRepository: get<_i93.LocationRepository>()));
  gh.lazySingleton<_i106.UnassignGroupAdmin>(() =>
      _i106.UnassignGroupAdmin(repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i107.UnassignUserFromGroup>(() =>
      _i107.UnassignUserFromGroup(
          repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i108.UnmakeUserAdministrator>(() =>
      _i108.UnmakeUserAdministrator(
          repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i109.UnsuspendUser>(
      () => _i109.UnsuspendUser(repository: get<_i33.UserProfileRepository>()));
  gh.lazySingleton<_i110.UpdateAssetCategory>(() => _i110.UpdateAssetCategory(
      repository: get<_i46.AssetCategoryRepository>()));
  gh.lazySingleton<_i111.UpdateChecklist>(() =>
      _i111.UpdateChecklist(repository: get<_i55.CheckListsRepository>()));
  gh.lazySingleton<_i112.UpdateCompany>(() => _i112.UpdateCompany(
      companyRepository: get<_i57.CompanyManagementRepository>()));
  gh.lazySingleton<_i113.UpdateGroup>(
      () => _i113.UpdateGroup(groupRepository: get<_i89.GroupRepository>()));
  gh.lazySingleton<_i114.UpdateLocation>(() =>
      _i114.UpdateLocation(locationRepository: get<_i93.LocationRepository>()));
  gh.lazySingleton<_i115.UpdateUserData>(() =>
      _i115.UpdateUserData(repository: get<_i33.UserProfileRepository>()));
  gh.factory<_i116.UserManagementBloc>(() => _i116.UserManagementBloc(
        approveUser: get<_i44.ApproveUser>(),
        approvePassiveUser: get<_i43.ApprovePassiveUser>(),
        makeUserAdministrator: get<_i95.MakeUserAdministrator>(),
        unmakeUserAdministrator: get<_i108.UnmakeUserAdministrator>(),
        approveUserAndMakeAdmin: get<_i45.ApproveUserAndMakeAdmin>(),
        rejectUser: get<_i96.RejectUser>(),
        suspendUser: get<_i103.SuspendUser>(),
        unsuspendUser: get<_i109.UnsuspendUser>(),
        updateUserData: get<_i115.UpdateUserData>(),
        assignUserToGroup: get<_i50.AssignUserToGroup>(),
        unassignUserFromGroup: get<_i107.UnassignUserFromGroup>(),
        assignGroupAdmin: get<_i48.AssignGroupAdmin>(),
        unassignGroupAdmin: get<_i106.UnassignGroupAdmin>(),
        addUserAvatar: get<_i42.AddUserAvatar>(),
      ));
  gh.lazySingleton<_i117.AddAssetCategory>(() =>
      _i117.AddAssetCategory(repository: get<_i46.AssetCategoryRepository>()));
  gh.lazySingleton<_i118.AddChecklist>(
      () => _i118.AddChecklist(repository: get<_i55.CheckListsRepository>()));
  gh.lazySingleton<_i119.AddCompany>(() => _i119.AddCompany(
      companyManagementRepository: get<_i57.CompanyManagementRepository>()));
  gh.lazySingleton<_i120.AddCompanyLogo>(() => _i120.AddCompanyLogo(
      repository: get<_i57.CompanyManagementRepository>()));
  gh.lazySingleton<_i121.AddGroup>(
      () => _i121.AddGroup(groupRepository: get<_i89.GroupRepository>()));
  gh.lazySingleton<_i122.AddLocation>(() =>
      _i122.AddLocation(locationRepository: get<_i93.LocationRepository>()));
  gh.factory<_i123.AuthenticationBloc>(() => _i123.AuthenticationBloc(
        signin: get<_i100.Signin>(),
        signup: get<_i102.Signup>(),
        signout: get<_i101.Signout>(),
        autoSignin: get<_i53.AutoSignin>(),
        sendVerificationEmail: get<_i99.SendVerificationEmail>(),
        checkEmailVerification: get<_i54.CheckEmailVerification>(),
        sendPasswordResetEmail: get<_i98.SendPasswordResetEmail>(),
        inputValidator: get<_i8.InputValidator>(),
      ));
  gh.lazySingleton<_i124.CacheGroups>(
      () => _i124.CacheGroups(groupRepository: get<_i89.GroupRepository>()));
  gh.lazySingleton<_i125.CacheLocation>(() =>
      _i125.CacheLocation(locationRepository: get<_i93.LocationRepository>()));
  gh.lazySingleton<_i126.DeleteGroup>(
      () => _i126.DeleteGroup(groupRepository: get<_i89.GroupRepository>()));
  gh.lazySingleton<_i127.DeleteLocation>(() =>
      _i127.DeleteLocation(locationRepository: get<_i93.LocationRepository>()));
  gh.lazySingleton<_i128.FetchAllLocations>(() => _i128.FetchAllLocations(
      locationRepository: get<_i93.LocationRepository>()));
  gh.lazySingleton<_i129.GetGroupsStream>(() =>
      _i129.GetGroupsStream(groupRepository: get<_i89.GroupRepository>()));
  gh.factory<_i130.UserProfileBloc>(() => _i130.UserProfileBloc(
        authenticationBloc: get<_i123.AuthenticationBloc>(),
        addUser: get<_i41.AddUser>(),
        assignUserToCompany: get<_i49.AssignUserToCompany>(),
        resetCompany: get<_i97.ResetCompany>(),
        getUserById: get<_i86.GetUserById>(),
        getUserStreamById: get<_i87.GetUserStreamById>(),
        updateUserData: get<_i115.UpdateUserData>(),
        addUserAvatar: get<_i42.AddUserAvatar>(),
        inputValidator: get<_i8.InputValidator>(),
      ));
  gh.lazySingleton<_i131.AssetCategoryBloc>(() => _i131.AssetCategoryBloc(
        userProfileBloc: get<_i130.UserProfileBloc>(),
        getAssetsCategoriesStream: get<_i75.GetAssetsCategoriesStream>(),
      ));
  gh.factory<_i132.CompanyManagementBloc>(() => _i132.CompanyManagementBloc(
        userProfileBloc: get<_i130.UserProfileBloc>(),
        inputValidator: get<_i8.InputValidator>(),
        addCompany: get<_i119.AddCompany>(),
        fetchAllCompanies: get<_i71.FetchAllCompanies>(),
        addCompanyLogo: get<_i120.AddCompanyLogo>(),
        updateCompany: get<_i112.UpdateCompany>(),
      ));
  gh.factory<_i133.CompanyProfileBloc>(() => _i133.CompanyProfileBloc(
        userProfileBloc: get<_i130.UserProfileBloc>(),
        fetchAllCompanyUsers: get<_i72.FetchAllCompanyUsers>(),
        getCompanyById: get<_i77.GetCompanyById>(),
        inputValidator: get<_i8.InputValidator>(),
      ));
  gh.lazySingleton<_i134.GroupBloc>(() => _i134.GroupBloc(
        companyProfileBloc: get<_i133.CompanyProfileBloc>(),
        addGroup: get<_i121.AddGroup>(),
        updateGroup: get<_i113.UpdateGroup>(),
        deleteGroup: get<_i126.DeleteGroup>(),
        getGroupsStream: get<_i129.GetGroupsStream>(),
        cacheGroups: get<_i124.CacheGroups>(),
        tryToGetCachedGroups: get<_i104.TryToGetCachedGroups>(),
      ));
  gh.lazySingleton<_i135.InstructionCategoryBloc>(
      () => _i135.InstructionCategoryBloc(
            userProfileBloc: get<_i130.UserProfileBloc>(),
            getInstructionsCategoriesStream:
                get<_i80.GetInstructionsCategoriesStream>(),
          ));
  gh.factory<_i136.InstructionCategoryManagementBloc>(
      () => _i136.InstructionCategoryManagementBloc(
            companyProfileBloc: get<_i133.CompanyProfileBloc>(),
            addInstructionCategory: get<_i36.AddInstructionCategory>(),
            updateInstructionCategory: get<_i26.UpdateInstructionCategory>(),
            deleteInstructionCategory: get<_i66.DeleteInstructionCategory>(),
          ));
  gh.factory<_i137.InstructionManagementBloc>(
      () => _i137.InstructionManagementBloc(
            companyProfileBloc: get<_i133.CompanyProfileBloc>(),
            addInstruction: get<_i35.AddInstruction>(),
            deleteInstruction: get<_i65.DeleteInstruction>(),
            updateInstruction: get<_i25.UpdateInstruction>(),
          ));
  gh.factory<_i138.ItemActionManagementBloc>(
      () => _i138.ItemActionManagementBloc(
            companyProfileBloc: get<_i133.CompanyProfileBloc>(),
            addItemAction: get<_i38.AddItemAction>(),
            updateItemAction: get<_i28.UpdateItemAction>(),
            deleteItemAction: get<_i68.DeleteItemAction>(),
            moveItemAction: get<_i22.MoveItemAction>(),
          ));
  gh.lazySingleton<_i139.ItemCategoryBloc>(() => _i139.ItemCategoryBloc(
        userProfileBloc: get<_i130.UserProfileBloc>(),
        getItemsCategoriesStream: get<_i83.GetItemsCategoriesStream>(),
      ));
  gh.factory<_i140.ItemCategoryManagementBloc>(
      () => _i140.ItemCategoryManagementBloc(
            companyProfileBloc: get<_i133.CompanyProfileBloc>(),
            addItemCategory: get<_i39.AddItemCategory>(),
            updateItemCategory: get<_i29.UpdateItemCategory>(),
            deleteItemCategory: get<_i69.DeleteItemCategory>(),
          ));
  gh.factory<_i141.ItemsManagementBloc>(() => _i141.ItemsManagementBloc(
        addItemPhoto: get<_i40.AddItemPhoto>(),
        deleteItemPhoto: get<_i70.DeleteItemPhoto>(),
        updateItemPhoto: get<_i30.UpdateItemPhoto>(),
        companyProfileBloc: get<_i133.CompanyProfileBloc>(),
        addItem: get<_i37.AddItem>(),
        deleteItem: get<_i67.DeleteItem>(),
        updateItem: get<_i27.UpdateItem>(),
      ));
  gh.lazySingleton<_i142.LocationBloc>(() => _i142.LocationBloc(
        companyProfileBloc: get<_i133.CompanyProfileBloc>(),
        addLocation: get<_i122.AddLocation>(),
        cacheLocation: get<_i125.CacheLocation>(),
        deleteLocation: get<_i127.DeleteLocation>(),
        fetchAllLocations: get<_i128.FetchAllLocations>(),
        tryToGetCachedLocation: get<_i105.TryToGetCachedLocation>(),
        updateLocation: get<_i114.UpdateLocation>(),
      ));
  gh.factory<_i143.NewUsersBloc>(() => _i143.NewUsersBloc(
        get<_i133.CompanyProfileBloc>(),
        get<_i73.FetchNewUsers>(),
      ));
  gh.factory<_i144.SuspendedUsersBloc>(() => _i144.SuspendedUsersBloc(
        get<_i133.CompanyProfileBloc>(),
        get<_i74.FetchSuspendedUsers>(),
      ));
  gh.factory<_i145.AssetCategoryManagementBloc>(
      () => _i145.AssetCategoryManagementBloc(
            companyProfileBloc: get<_i133.CompanyProfileBloc>(),
            addAssetCategory: get<_i117.AddAssetCategory>(),
            updateAssetCategory: get<_i110.UpdateAssetCategory>(),
            deleteAssetCategory: get<_i63.DeleteAssetCategory>(),
          ));
  gh.lazySingleton<_i146.ChecklistBloc>(() => _i146.ChecklistBloc(
        companyProfileBloc: get<_i133.CompanyProfileBloc>(),
        getChecklistsStream: get<_i76.GetChecklistStream>(),
      ));
  gh.factory<_i147.ChecklistManagementBloc>(() => _i147.ChecklistManagementBloc(
        companyProfileBloc: get<_i133.CompanyProfileBloc>(),
        addChecklist: get<_i118.AddChecklist>(),
        updateChecklist: get<_i111.UpdateChecklist>(),
        deleteChecklist: get<_i64.DeleteChecklist>(),
      ));
  gh.factory<_i148.FilterBloc>(() => _i148.FilterBloc(
        locationBloc: get<_i142.LocationBloc>(),
        groupBloc: get<_i134.GroupBloc>(),
        userProfileBloc: get<_i130.UserProfileBloc>(),
      ));
  gh.factory<_i149.InstructionBloc>(() => _i149.InstructionBloc(
        filterBloc: get<_i148.FilterBloc>(),
        getInstructionsStream: get<_i81.GetInstructionsStream>(),
      ));
  gh.factory<_i150.ItemsBloc>(() => _i150.ItemsBloc(
        filterBloc: get<_i148.FilterBloc>(),
        getChecklistsStream: get<_i84.GetItemsStream>(),
      ));
  gh.factory<_i151.DashboardItemActionBloc>(() => _i151.DashboardItemActionBloc(
        filterBloc: get<_i148.FilterBloc>(),
        getDashboardItemsActionsStream:
            get<_i78.GetDashboardItemsActionsStream>(),
        getDashboardLastFiveItemsActionsStream:
            get<_i79.GetDashboardLastFiveItemsActionsStream>(),
      ));
  return get;
}

class _$DataConnectionCheckerModule extends _i152.DataConnectionCheckerModule {}

class _$FirebaseAuthenticationService
    extends _i152.FirebaseAuthenticationService {}

class _$FirebaseFirestoreService extends _i153.FirebaseFirestoreService {}

class _$FirebaseStorageService extends _i153.FirebaseStorageService {}

class _$SharedPreferencesService extends _i153.SharedPreferencesService {}

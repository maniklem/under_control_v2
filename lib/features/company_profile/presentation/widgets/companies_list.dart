import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:under_control_v2/features/company_profile/presentation/widgets/companies_list_tile.dart';
import 'package:under_control_v2/features/core/utils/responsive_size.dart';
import 'package:under_control_v2/features/core/utils/size_config.dart';

import '../blocs/company_management/company_management_bloc.dart';
import 'companies_list_view.dart';

class CompaniesList extends StatelessWidget with ResponsiveSize {
  const CompaniesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocBuilder<CompanyManagementBloc, CompanyManagementState>(
      builder: (context, state) {
        // data loaded
        switch (state.runtimeType) {
          case CompanyManagementCompaniesLoaded:
            return CompaniesListView(
              companies: (state as CompanyManagementCompaniesLoaded)
                  .companies
                  .allCompanies,
            );
          case CompanyManagementLoading:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(
                  height: 16,
                ),
                Text(AppLocalizations.of(context)!.assign_company_list_loading),
              ],
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

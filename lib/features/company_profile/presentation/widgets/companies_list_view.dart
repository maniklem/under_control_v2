import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../domain/entities/company.dart';
import '../blocs/company_management/company_management_bloc.dart';
import 'companies_list_tile.dart';

class CompaniesListView extends StatefulWidget {
  const CompaniesListView({
    Key? key,
    required this.companies,
  }) : super(key: key);

  final List<Company> companies;

  @override
  State<CompaniesListView> createState() => _CompaniesListViewState();
}

class _CompaniesListViewState extends State<CompaniesListView> {
  final _searchController = TextEditingController();

  String _searchString = '';
  List<Company> _filteredCompanies = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _filteredCompanies = widget.companies
        .where(
          (company) => company.name.toLowerCase().contains(_searchString),
        )
        .toList();
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async =>
            context.read<CompanyManagementBloc>().add(FetchAllCompaniesEvent()),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 8,
                right: 8,
                bottom: 10,
              ),
              child: TextFormField(
                controller: _searchController,
                key: const ValueKey('search'),
                keyboardType: TextInputType.name,
                cursorColor: Theme.of(context).textTheme.headline5!.color,
                decoration: InputDecoration(
                  suffixIcon: _searchController.text.isEmpty
                      ? const Icon(
                          Icons.search,
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              _searchController.text = '';
                              _searchString = '';
                            });
                          },
                          icon: const Icon(Icons.cancel),
                          color: Theme.of(context).textTheme.headline5!.color,
                        ),
                  floatingLabelStyle: TextStyle(
                    color: Theme.of(context).textTheme.headline1!.color,
                  ),
                  hintText: AppLocalizations.of(context)!.search,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                ),
                onChanged: (value) {
                  setState(() {
                    _searchString = value.toLowerCase();
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredCompanies.length,
                itemBuilder: (context, index) {
                  // list item
                  return CompaniesListTile(
                    company: _filteredCompanies[index],
                    key: Key(_filteredCompanies[index].id),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

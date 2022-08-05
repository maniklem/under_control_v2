import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/input_validator.dart';
import '../../../../user_profile/presentation/blocs/user_profile/user_profile_bloc.dart';
import '../../../data/models/company_users_list_model.dart';
import '../../../domain/entities/company.dart';
import '../../../domain/entities/company_users_list.dart';
import '../../../domain/usecases/fetch_all_company_users.dart';
import '../../../domain/usecases/get_company_by_id.dart';
import '../../../domain/usecases/update_company.dart';

part 'company_profile_event.dart';
part 'company_profile_state.dart';

@injectable
class CompanyProfileBloc
    extends Bloc<CompanyProfileEvent, CompanyProfileState> {
  late StreamSubscription userProfileStreamSubscription;
  StreamSubscription? companyUsersStreamSubscription;
  final UserProfileBloc userProfileBloc;
  final UpdateCompany updateCompany;
  final FetchAllCompanyUsers fetchAllCompanyUsers;
  final GetCompanyById getCompanyById;
  final InputValidator inputValidator;

  CompanyProfileBloc({
    required this.userProfileBloc,
    required this.updateCompany,
    required this.fetchAllCompanyUsers,
    required this.getCompanyById,
    required this.inputValidator,
  }) : super(CompanyProfileEmpty()) {
    userProfileStreamSubscription = userProfileBloc.stream.listen(
      (state) {
        if (state is Approved) {
          add(GetCompanyByIdEvent(id: state.userProfile.companyId));
        }
        if (state is NotApproved) {
          add(GetCompanyByIdEvent(id: state.userProfile.companyId));
        }
      },
    );

    on<GetCompanyByIdEvent>((event, emit) async {
      emit(CompanyProfileLoading());
      final failureOrCompany = await getCompanyById(event.id);
      await failureOrCompany.fold(
        (failure) async => emit(
          CompanyProfileError(message: failure.message, error: true),
        ),
        (company) async {
          final failureOrCompanyUsers = await fetchAllCompanyUsers(company.id);
          await failureOrCompanyUsers.fold(
            (failure) async => emit(
              CompanyProfileError(message: failure.message, error: true),
            ),
            (companyUsers) async {
              companyUsersStreamSubscription = companyUsers.allUsers.listen(
                (snapshot) {
                  add(
                    UpdateCompanyUsersEvent(
                      company: company,
                      snapshot: snapshot,
                    ),
                  );
                },
              );
              // emit(
              //   CompanyProfileLoaded(
              //     companyUsers: const CompanyUsersList(allUsers: []),
              //     company: company,
              //   ),
              // );
            },
          );
        },
      );
    });

    on<UpdateCompanyUsersEvent>((UpdateCompanyUsersEvent event, emit) async {
      CompanyUsersList usersList = CompanyUsersListModel.fromSnapshot(
          event.snapshot as QuerySnapshot<Map<String, dynamic>>);
      emit(
        CompanyProfileLoaded(
          companyUsers: usersList,
          company: event.company,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    userProfileStreamSubscription.cancel();
    companyUsersStreamSubscription?.cancel();
    return super.close();
  }
}

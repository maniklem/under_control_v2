part of 'new_users_bloc.dart';

abstract class NewUsersState extends Equatable {
  const NewUsersState({
    this.message = '',
    this.error = false,
    this.properties = const [],
  });
  final List properties;
  final String message;
  final bool error;

  @override
  List<Object> get props => [properties, message, error];
}

class NewUsersEmptyState extends NewUsersState {}

class NewUsersErrorState extends NewUsersState {
  const NewUsersErrorState({
    super.message,
    super.error = true,
  });
}

class NewUsersLoadingState extends NewUsersState {}

class NewUsersLoadedState extends NewUsersState {
  final CompanyUsersList newUsers;
  NewUsersLoadedState({
    required this.newUsers,
  }) : super(properties: [newUsers]);
}

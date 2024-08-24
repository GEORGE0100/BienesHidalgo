part of 'users_bloc.dart';

abstract class UsersState {
  const UsersState();

  List<Object> get props => [];
}

class UsersInitialState extends UsersState {}

class UsersLoadingState extends UsersState {
  final bool isLoading;

  UsersLoadingState({required this.isLoading});
}

class UsersSuccessState extends UsersState {
  final UserModel user;

  UsersSuccessState(this.user);

  @override
  List<Object> get props => [user];
}

class UsersFailureState extends UsersState {
  final String errorMsg;

  const UsersFailureState(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}

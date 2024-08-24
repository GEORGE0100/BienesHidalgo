part of 'users_bloc.dart';

abstract class UsersEvent {
  const UsersEvent();

  List<Object> get props => [];
}

class SignUpUser extends UsersEvent {
  final String email;
  final String password;

  const SignUpUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignInUser extends UsersEvent {
  final String email;
  final String password;
  const SignInUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignOut extends UsersEvent {}

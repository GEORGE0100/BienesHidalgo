import 'package:bieneshidalgo/users/authServices.dart';
import 'package:bieneshidalgo/users/users.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final AuthService authService = AuthService();

  UsersBloc() : super(UsersInitialState()) {
    on<UsersEvent>(((event, emit) {}));
    on<SignUpUser>((event, emit) async {
      emit(UsersLoadingState(isLoading: true));
      try {
        final UserModel? user =
            await authService.signUpUser(event.email, event.password);
        if (user != null) {
          emit(UsersSuccessState(user));
        } else {
          emit(const UsersFailureState('CREATE USER FAILED'));
        }
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
      emit(UsersLoadingState(isLoading: false));
    });

    on<SignInUser>((event, emit) async {
      emit(UsersLoadingState(isLoading: true));
      try {
        final UserModel? user =
            await authService.signInUser(event.email, event.password);
        if (user != null) {
          emit(UsersSuccessState(user));
        } else {
          emit(const UsersFailureState('LOG IN USER FAILED'));
        }
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
      emit(UsersLoadingState(isLoading: false));
    });

    on<SignOut>((event, emit) async {
      emit(UsersLoadingState(isLoading: true));
      try {
        authService.signOutUser();
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
      emit(UsersLoadingState(isLoading: false));
    });
  }
}

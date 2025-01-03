part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoggedIn extends AuthState {}

class AuthRegistered extends AuthState {
  final User user;

  const AuthRegistered({required this.user});
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});
}

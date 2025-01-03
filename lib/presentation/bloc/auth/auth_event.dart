part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final LoginRequest loginRequest;

  const LoginEvent({required this.loginRequest});
}

class RegisterEvent extends AuthEvent {
  final RegisterRequest registerRequest;

  const RegisterEvent({required this.registerRequest});
}

class LogoutEvent extends AuthEvent {}

part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthenticationInProgresState extends AuthState {}

class RegistrationInProgresState extends AuthState {}

class RegistrationSuccessState extends AuthState {}

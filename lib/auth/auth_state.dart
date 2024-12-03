import 'package:copy_with_extension/copy_with_extension.dart';

part 'auth_state.g.dart';

class AuthState {}

class AuthInitialState extends AuthState {}

@CopyWith()
class SignupState extends AuthState {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? errorMessage;

  SignupState(
      {this.name,
      this.email,
      this.password,
      this.confirmPassword,
      this.errorMessage});
}

@CopyWith()
class SigninState extends AuthState {
  String? email;
  String? password;
  String? errorMessage;

  SigninState({this.email, this.password, this.errorMessage});
}

class AuthloadingState extends AuthState {}

class AuthenticatedState extends AuthState {}

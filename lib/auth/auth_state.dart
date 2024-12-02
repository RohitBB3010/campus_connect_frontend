class AuthState {}

class AuthInitialState extends AuthState {}

class SignupState extends AuthState {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  SignupState({this.name, this.email, this.password, this.confirmPassword});
}

class SigninState extends AuthState {
  String? email;
  String? password;

  SigninState({this.email, this.password});
}

class AuthloadingState extends AuthState {}

class AuthenticatedState extends AuthState {}

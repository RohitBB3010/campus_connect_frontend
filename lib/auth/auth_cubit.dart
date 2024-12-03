import 'dart:convert';
import 'package:campus_connect_frontend/auth/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState()) {
    FirebaseAuth.instance.authStateChanges().listen((User? currentUser) {
      debugPrint("Current user is : $currentUser");
      if (currentUser == null) {
        emit(SigninState());
      }

      if (currentUser != null) {}
    });
  }

  Future<void> login(String email, String password) async {
    const String apiUrl = "http://10.0.2.2:8000/auth/checkUserExists";

    try {
      String additn = "$apiUrl?email=$email";
      final response = await http.get(Uri.parse(additn));

      if (response.statusCode == 422 || response.statusCode == 404) {
        Map<String, dynamic> map = jsonDecode(response.body);
        signinErrorMessageChanged(map['message']);
      }

      if (response.statusCode == 200) {
        FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        emit(AuthenticatedState());
      }
    } catch (err) {}
  }

  Future<void> signup(String name, String email, String password,
      String confirmPassword) async {
    try {
      debugPrint("Inside func");

      const signUpApi = "http://10.0.2.2:8000/auth/signUpMember";
      Map<String, dynamic> body = {
        "name": name,
        "email": email,
      };

      final response = await http.post(Uri.parse(signUpApi),
          body: jsonEncode(body),
          headers: {"Content-type": "application/json"});

      Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode == 409 || response.statusCode == 422) {
        emit((state as SignupState)
            .copyWith(errorMessage: responseBody['message']));
      } else {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        emit(AuthenticatedState());
      }
    } catch (err) {}
  }

  void returnSignup() {
    emit(SignupState());
  }

  void signinErrorMessageChanged(String errorMessage) {
    emit((state as SigninState).copyWith(errorMessage: errorMessage));
  }

  void signinEmailChanged(String email) {
    emit((state as SigninState).copyWith(email: email));
  }

  void signinPasswordChanged(String password) {
    emit((state as SigninState).copyWith(password: password));
  }

  void signupErrorMessageChanged(String errorMessage) {
    emit((state as SigninState).copyWith(errorMessage: errorMessage));
  }

  void signupEmailChanged(String email) {
    emit((state as SignupState).copyWith(email: email));
  }

  void signupPasswordChanged(String password) {
    emit((state as SignupState).copyWith(password: password));
  }

  void signupNameChanged(String name) {
    emit((state as SignupState).copyWith(name: name));
  }

  void signupConfirmPasswordChanged(String confirmPassword) {
    emit((state as SignupState).copyWith(confirmPassword: confirmPassword));
  }
}

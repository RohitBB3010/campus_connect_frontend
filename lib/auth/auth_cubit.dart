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
      debugPrint(additn);
      final response = await http.get(Uri.parse(additn));
      debugPrint(response.statusCode.toString());

      if (response.statusCode == 422 || response.statusCode == 404) {
        Map<String, dynamic> map = jsonDecode(response.body);
        signinErrorMessageChanged(map['message']);
      }
    } catch (err) {}
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
}

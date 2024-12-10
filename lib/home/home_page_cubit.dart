import 'dart:convert';

import 'package:campus_connect_frontend/home/home_page_state.dart';
import 'package:campus_connect_frontend/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<HomeState> {
  HomePageCubit() : super(HomeState());

  Future<void> fetchHomePage() async {
    String uri =
        'http://10.0.2.2:8000/home/fetch-home?email=rohitb.bhandwalkar1@gmail.com';

    try {
      final response = await http.get(Uri.parse(uri));

      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      User user = User.fromJson(responseBody['user']);

      debugPrint(user.emailId.toString());
    } catch (err) {
      emit(HomeErrorState());
    }
  }
}

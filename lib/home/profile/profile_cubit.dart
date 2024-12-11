import 'dart:convert';

import 'package:campus_connect_frontend/home/profile/profile_state.dart';
import 'package:campus_connect_frontend/models/user_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());

  Future<void> fetchHomePage() async {
    // String uri =
    //     'http://10.0.2.2:8000/home/fetch-home?email=rohitb.bhandwalkar1@gmail.com';

    String uri =
        'http://10.0.2.2:8000/home/fetch-home?email=zara.ahmed@example.com';
    try {
      emit(ProfileLoadingState());

      final response = await http.get(Uri.parse(uri));

      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      User user = User.fromJson(responseBody['user']);

      PlatformFile? image;

      if (user.imageUrl == null || user.imageUrl!.trim().isEmpty) {
        image = null;
      } else {
        //String url = "http://10.0.2.2:8000/${user.imageUrl}";
        image = await getPlatformFileFromUrl(user.imageUrl!);
      }

      emit(ProfileLoadedState(
          user: user,
          modName: user.name,
          modEmail: user.emailId,
          image: image));
    } catch (err) {
      emit(ProfileErrorState(error: err.toString()));
    }
  }

  Future<void> editProfile(PlatformFile image, String id) async {
    try {
      //const stringUrl = "http://10.0.2.2:8000/home/upload-image?id="
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  Future<PlatformFile?> getPlatformFileFromUrl(String imageUrl) async {
    try {
      String url = "http://10.0.2.2:8000/$imageUrl";

      debugPrint(url);

      final response = await http.get(Uri.parse(url));

      debugPrint(response.statusCode.toString());

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;

        // Create a PlatformFile object
        return PlatformFile(
          name: imageUrl.split('/').last, // Extract the file name from the URL
          size: bytes.length,
          bytes: bytes,
          path: null, // Path is null because the file is in memory
        );
      } else {
        debugPrint(
            'Failed to fetch image. Status code: ${response.statusCode}');
        return null;
      }
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  void nameChanged(String name) {
    emit((state as ProfileLoadedState).copyWith(modName: name));
  }

  void emailChanged(String email) {
    emit((state as ProfileLoadedState).copyWith(modEmail: email));
  }

  void imageChanged(PlatformFile? file) {
    debugPrint("Resourced removed");
    emit((state as ProfileLoadedState).copyWith(image: file));
  }
}

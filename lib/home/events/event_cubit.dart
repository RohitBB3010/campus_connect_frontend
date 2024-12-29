import 'dart:convert';

import 'package:campus_connect_frontend/home/events/event_state.dart';
import 'package:campus_connect_frontend/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventState());

  Future<void> fetchEventsData() async {
    //try {
    String fetchHomeUri =
        'http://10.0.2.2:8000/home/fetch-home-events?emailId=';

    String userEmail = FirebaseAuth.instance.currentUser!.email!;

    final response = await http.get(Uri.parse('$fetchHomeUri$userEmail'));

    final responseBody = jsonDecode(response.body);

    List<EventModel> events = [];
    for (final eventObj in responseBody['events']) {
      EventModel event = EventModel.fromJson(eventObj);
      events.add(event);
    }

    if (response.statusCode == 200) {
      emit(EventLoadedState(
          events: events,
          userName: responseBody['userName'],
          profileUrl: 'http://10.0.2.2:8000/${responseBody['profileUrl']}'));
    }
    // }
    // catch (err) {
    //   debugPrint(err.toString());
    //   emit(EventErrorState(error: err.toString()));
    // }
  }
}

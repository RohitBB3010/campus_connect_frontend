import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/home/profile/profile_cubit.dart';
import 'package:campus_connect_frontend/home/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: AutoSizeText("Events Page"));
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/home/home_page_cubit.dart';
import 'package:campus_connect_frontend/home/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(),
      child: BlocBuilder<HomePageCubit, HomeState>(
        builder: (context, state) {
          return IconButton(
              onPressed: () {
                context.read<HomePageCubit>().fetchHomePage();
              },
              icon: Icon(Icons.abc));
        },
      ),
    );
  }
}

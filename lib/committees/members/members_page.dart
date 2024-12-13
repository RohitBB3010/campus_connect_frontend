import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/committees/members/members_cubit.dart';
import 'package:campus_connect_frontend/committees/members/members_state.dart';
import 'package:campus_connect_frontend/components/loading_page.dart';
import 'package:campus_connect_frontend/home/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MembersPage extends StatelessWidget {
  MembersPage({super.key, required this.committeeId});
  String committeeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MembersCubit()..fetchMembers(committeeId),
      child: BlocBuilder<MembersCubit, MembersState>(
        builder: (context, state) {
          debugPrint(state.toString());
          if (state is MembersLoadingState) {
            return const LoadingPage();
          } else if (state is MembersLoadedState) {
            return AutoSizeText(state.members.length.toString());
          }

          return const AutoSizeText("Last resort");
        },
      ),
    );
  }
}

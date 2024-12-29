import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/components/event_card.dart';
import 'package:campus_connect_frontend/components/loading_page.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:campus_connect_frontend/home/events/event_cubit.dart';
import 'package:campus_connect_frontend/home/events/event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit()..fetchEventsData(),
      child: BlocBuilder<EventCubit, EventState>(builder: (context, state) {
        if (state is EventLoadingState) {
          return const LoadingPage();
        } else if (state is EventLoadedState) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.08,
              title: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01),
                child: Row(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.12,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Image(
                          image: NetworkImage(state.profileUrl!),
                          fit: BoxFit.contain,
                        )),
                    SpacingConsts().smallWidthBetweenFields(context),
                    AutoSizeText(state.userName,
                        style: const TextStyle(
                            fontFamily: 'MinorkSemiBold', fontSize: 25)),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.025,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: state.events.map((event) {
                    return EventCard(event: event, isHome: true);
                  }).toList(),
                ),
              ),
            ),
          );
        } else if (state is EventErrorState) {
          return Center(child: AutoSizeText(state.error));
        }
        return const AutoSizeText('Last resort case');
      }),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/committees/add_events/add_event_page.dart';
import 'package:campus_connect_frontend/committees/events/events_page_cubit.dart';
import 'package:campus_connect_frontend/committees/events/events_page_state.dart';
import 'package:campus_connect_frontend/components/custom_button.dart';
import 'package:campus_connect_frontend/components/loading_page.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:campus_connect_frontend/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EventsPageComm extends StatelessWidget {
  EventsPageComm({super.key, required this.committeeId});
  String committeeId;

  String formatDateTime(DateTime dateTime) {
    return DateFormat("d MMM, yyyy hh:mma")
        .format(dateTime)
        .replaceFirst('AM', 'am')
        .replaceFirst('PM', 'pm');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventsPageCubit()..fetchEvents(committeeId),
      child: BlocBuilder<EventsPageCubit, EventsPageState>(
        builder: (context, state) {
          debugPrint(state.toString());
          if (state is EventPageLoadingState) {
            return const LoadingPage();
          } else if (state is EventPageLoadedState) {
            return Column(
              children: [
                SpacingConsts().smallHeightBetweenFields(context),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText("Events",
                          style: TextStyle(
                              fontFamily: "MinorkSemiBold", fontSize: 35.0)),
                      CustomButton(
                          context, "Add Event", ColorConsts().secondary_pink,
                          () {
                        _buildAddEventDialog(context, committeeId);
                      }, 0.3, 0.04, 20)
                    ],
                  ),
                ),
                Column(
                    children: state.events.map((event) {
                  return buildEventCard(context, event);
                }).toList())
              ],
            );
          } else if (state is EventPageErrorState) {
            return AutoSizeText(state.error.toString());
          } else {
            return const AutoSizeText("Last resort");
          }
        },
      ),
    );
  }

  void _buildAddEventDialog(BuildContext context, String committeeId) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return AddEventsPage(committeeId: committeeId);
    }));
  }

  Widget buildEventCard(BuildContext context, EventModel event) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.02),
        decoration: BoxDecoration(
            color: ColorConsts().icons_bg,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: AutoSizeText(
                    event.eventName,
                    maxLines: 2,
                    style:
                        const TextStyle(fontFamily: 'Minork', fontSize: 23.0),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.005,
                      horizontal: MediaQuery.of(context).size.width * 0.005),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: ColorConsts().secondary_pink),
                  child: AutoSizeText(
                    event.tag,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: const TextStyle(
                        fontFamily: 'Minork',
                        fontSize: 17.0,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            SpacingConsts().smallHeightBetweenFields(context),
            AutoSizeText(
              event.description,
              style: const TextStyle(fontFamily: 'Nunito', fontSize: 18.0),
            ),
            SpacingConsts().smallHeightBetweenFields(context),
            Row(
              children: [
                const AutoSizeText("Event Timings : ",
                    style: TextStyle(fontFamily: 'Nunito', fontSize: 20.0)),
                Expanded(
                  child: AutoSizeText(
                      '${formatDateTime(event.startTime)} - ${formatDateTime(event.endTime)}',
                      maxLines: 2,
                      style: const TextStyle(
                          fontFamily: 'Nunito', fontSize: 17.0)),
                ),
              ],
            ),
            SpacingConsts().smallHeightBetweenFields(context),
            const AutoSizeText(
              "Event Leads :",
              style: TextStyle(fontFamily: 'Nunito', fontSize: 20.0),
            ),
            AutoSizeText(
              "1) ${event.head}(${event.headEmail})",
              maxLines: 1,
              style: const TextStyle(fontFamily: 'Nunito', fontSize: 20.0),
            ),
            AutoSizeText(
              "2) ${event.coHead}(${event.coHeadEmail})",
              maxLines: 1,
              style: const TextStyle(fontFamily: 'Nunito', fontSize: 20.0),
            ),
            SpacingConsts().smallHeightBetweenFields(context),
            AutoSizeText(
              "Eligibility : ${event.eligibility}",
              maxLines: 1,
              style: const TextStyle(fontFamily: 'Nunito', fontSize: 20.0),
            ),
            if (event.images != null)
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: MediaQuery.of(context).size.width * 0.02,
                children: event.images!.map((url) {
                  debugPrint(url);
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: NetworkImage('http://10.0.2.2:8000/$url'),
                            fit: BoxFit.cover)),
                  );
                }).toList(),
              )
          ],
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/committees/add_events/add_event_page.dart';
import 'package:campus_connect_frontend/components/custom_button.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:flutter/material.dart';

class EventsPageComm extends StatelessWidget {
  EventsPageComm({super.key, required this.committeeId});
  String committeeId;

  @override
  Widget build(BuildContext context) {
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
                  style:
                      TextStyle(fontFamily: "MinorkSemiBold", fontSize: 35.0)),
              CustomButton(context, "Add Event", ColorConsts().secondary_pink,
                  () {
                _buildAddEventDialog(context, committeeId);
              }, 0.3, 0.04, 20)
            ],
          ),
        )
      ],
    );
  }

  void _buildAddEventDialog(BuildContext context, String committeeId) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return AddEventsPage(committeeId: committeeId);
    }));
  }
}

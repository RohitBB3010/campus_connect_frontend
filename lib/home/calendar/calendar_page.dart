import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AutoSizeText("Calendar"),
    );
  }
}

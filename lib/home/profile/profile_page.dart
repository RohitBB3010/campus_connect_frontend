import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AutoSizeText("Profile"),
    );
  }
}

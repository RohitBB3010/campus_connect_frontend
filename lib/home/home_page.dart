import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/auth/auth_cubit.dart';
import 'package:campus_connect_frontend/auth/auth_state.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/home/announcements/announcements.dart';
import 'package:campus_connect_frontend/home/calendar/calendar_page.dart';
import 'package:campus_connect_frontend/home/committees/committees_page.dart';
import 'package:campus_connect_frontend/home/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConsts().primary,
        bottomNavigationBar: BottomAppBar(
            height: MediaQuery.of(context).size.height * 0.07,
            color: ColorConsts().secondary_orange,
            shape: const CircularNotchedRectangle(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _pageController.jumpToPage(0);
                      });
                    },
                    iconSize: 33.0,
                    icon: Icon(
                      OMIcons.group,
                      color: _pageController.page != 0.0
                          ? const Color(0xff2F3E46)
                          : ColorConsts().primary,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _pageController.jumpToPage(1);
                        });
                      },
                      iconSize: 30.0,
                      icon: Icon(
                        OMIcons.eventAvailable,
                        color: _pageController.page != 1.0
                            ? const Color(0xff2F3E46)
                            : Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _pageController.jumpToPage(2);
                        });
                      },
                      iconSize: 30.0,
                      icon: Icon(
                        OMIcons.calendarToday,
                        color: _pageController.page != 2.0
                            ? const Color(0xff2F3E46)
                            : Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _pageController.jumpToPage(3);
                        });
                      },
                      iconSize: 30.0,
                      icon: Icon(
                        OMIcons.person,
                        color: _pageController.page != 3.0
                            ? const Color(0xff2F3E46)
                            : Colors.black,
                      ))
                ],
              ),
            )),
        body: PageView(
          controller: _pageController,
          onPageChanged: (int) {
            debugPrint(_pageController.page.toString());
          },
          children: const [
            CommitteesPage(),
            AnnouncementsPage(),
            CalendarPage(),
            ProfilePage()
          ],
        ),
      ),
    );
  }
}

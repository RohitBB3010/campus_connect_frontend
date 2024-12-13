import 'package:campus_connect_frontend/committees/announcements/announcements_page_comm.dart';
import 'package:campus_connect_frontend/committees/events/events_page_comm.dart';
import 'package:campus_connect_frontend/committees/profile/profile_page_comm.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class CommPage extends StatefulWidget {
  const CommPage({super.key});

  @override
  State<CommPage> createState() => _CommPageState();
}

class _CommPageState extends State<CommPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConsts().primary,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: ColorConsts().secondary_orange,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), // Shadow color
                offset: const Offset(0, -4), // Offset the shadow upwards
                blurRadius: 10, // Smoothness of the shadow
              ),
            ],
          ),
          child: BottomAppBar(
            height: MediaQuery.of(context).size.height * 0.07,
            color: Colors.transparent, // Set to transparent to show the shadow
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
                    iconSize: 30.0,
                    icon: Icon(
                      OMIcons.eventAvailable,
                      color: (_pageController.hasClients
                              ? _pageController.page == 0.0
                              : _pageController.initialPage == 0)
                          ? ColorConsts().primary
                          : const Color(0xff2F3E46),
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
                      OMIcons.calendarToday,
                      color: (_pageController.hasClients
                              ? _pageController.page == 1.0
                              : _pageController.initialPage == 1)
                          ? ColorConsts().primary
                          : const Color(0xff2F3E46),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _pageController.jumpToPage(2);
                      });
                    },
                    iconSize: 30.0,
                    icon: Icon(
                      OMIcons.person,
                      color: (_pageController.hasClients
                              ? _pageController.page == 2.0
                              : _pageController.initialPage == 2)
                          ? ColorConsts().primary
                          : const Color(0xff2F3E46),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: PageView(
          controller: _pageController,
          children: const [
            AnnouncementsPageComm(),
            EventsPageComm(),
            ProfilePageComm()
          ],
        ),
      ),
    );
  }
}

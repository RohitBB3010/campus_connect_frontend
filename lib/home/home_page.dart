import 'package:campus_connect_frontend/auth/auth_cubit.dart';
import 'package:campus_connect_frontend/auth/auth_state.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/home/announcements/announcements.dart';
import 'package:campus_connect_frontend/home/calendar/calendar_page.dart';
import 'package:campus_connect_frontend/home/home_page_cubit.dart';
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
    return BlocProvider(
      create: (context) => HomePageCubit()..fetchHomePage(),
      child: SafeArea(
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
              color:
                  Colors.transparent, // Set to transparent to show the shadow
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
                        color: (_pageController.hasClients &&
                                _pageController.page == 0.0)
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
                        color: (_pageController.hasClients &&
                                _pageController.page == 1.0)
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
                        color: (_pageController.hasClients &&
                                _pageController.page == 2.0)
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
            onPageChanged: (int) {
              debugPrint(_pageController.page.toString());
            },
            children: [
              const AnnouncementsPage(),
              const CalendarPage(),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return const ProfilePage();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

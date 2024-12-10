import 'package:auto_size_text/auto_size_text.dart';

import 'package:campus_connect_frontend/components/loading_page.dart';
import 'package:campus_connect_frontend/home/home_page_cubit.dart';
import 'package:campus_connect_frontend/home/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomePageCubit()..fetchHomePage(),
        child: BlocBuilder<HomePageCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const LoadingPage();
            } else if (state is HomeLoadedState) {
              String imageUrl = "http://10.0.2.2:8000/${state.user.imageUrl}";
              debugPrint(imageUrl);
              return Scaffold(
                appBar: AppBar(
                  toolbarHeight: MediaQuery.of(context).size.height * 0.1,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "http://10.0.2.2:8000/${state.user.imageUrl}")),
                  ),
                  title: AutoSizeText(
                    state.user.name!,
                    style: TextStyle(fontFamily: 'MinorkSemiBold'),
                  ),
                ),
                body: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Image(
                      image: NetworkImage(
                          "http://10.0.2.2:8000/${state.user.imageUrl}")),
                ),
              );
            }
            return const AutoSizeText("Last case profile page");
          },
        ));
  }
}

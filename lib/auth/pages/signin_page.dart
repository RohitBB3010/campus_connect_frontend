import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/auth/auth_cubit.dart';
import 'package:campus_connect_frontend/auth/auth_state.dart';
import 'package:campus_connect_frontend/auth/pages/signup_page.dart';
import 'package:campus_connect_frontend/components/text_field.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:campus_connect_frontend/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        // if (state is SigninState) {
        //   final authCubit = context.read<AuthCubit>();
        //   return Scaffold(
        //       body: SizedBox(
        //     width: MediaQuery.of(context).size.width,
        //     child: SingleChildScrollView(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           SpacingConsts().customHeightBetweenFields(context, 0.3),
        //           if (state.errorMessage != null)
        //             AutoSizeText(state.errorMessage!),
        //           if (state.errorMessage != null)
        //             SpacingConsts().smallHeightBetweenFields(context),
        //           CustomTextField(
        //               fieldWidth: 0.6,
        //               hintText: "Enter email",
        //               onChanged: authCubit.signinEmailChanged),
        //           SpacingConsts().smallHeightBetweenFields(context),
        //           CustomTextField(
        //               fieldWidth: 0.6,
        //               hintText: "Enter password",
        //               onChanged: authCubit.signinPasswordChanged),
        //           SpacingConsts().smallHeightBetweenFields(context),
        //           ElevatedButton(
        //               onPressed: () {
        //                 authCubit.login(state.email!, state.password!);
        //               },
        //               child: AutoSizeText("Login")),
        //           SpacingConsts().smallHeightBetweenFields(context),
        //           TextButton(
        //               onPressed: () {
        //                 authCubit.returnSignup();
        //               },
        //               child: const AutoSizeText(
        //                 "Sign Up",
        //                 style: TextStyle(decoration: TextDecoration.underline),
        //               ))
        //         ],
        //       ),
        //     ),
        //   ));
        // }

        if (state is SigninState) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/auth_bg.png"),
                                  fit: BoxFit.cover)),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.36,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.7,
                            padding: const EdgeInsets.only(
                                bottom: 20), // Add padding for content spacing
                            decoration: BoxDecoration(
                              color: ColorConsts().primary,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              children: [
                                SpacingConsts()
                                    .mediumHeightBetweenFields(context),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: const AutoSizeText(
                                    "Connect. Coordinate. Collaborate",
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 25.0),
                                  ),
                                ),
                                // Add more content below if needed
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.5),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is AuthenticatedState) {
          return const HomePage();
        }

        return const AutoSizeText("Last resort sign in page");
      },
    );
  }
}

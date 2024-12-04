import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/auth/auth_cubit.dart';
import 'package:campus_connect_frontend/auth/auth_state.dart';
import 'package:campus_connect_frontend/components/text_field.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is SignupState) {
          final authCubit = context.read<AuthCubit>();
          return Scaffold(
              body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpacingConsts().customHeightBetweenFields(context, 0.3),
                  if (state.errorMessage != null)
                    AutoSizeText(state.errorMessage!),
                  if (state.errorMessage != null)
                    SpacingConsts().smallHeightBetweenFields(context),
                  SpacingConsts().smallHeightBetweenFields(context),
                  CustomTextField(
                      fieldWidth: 0.6,
                      fieldHeight: 0.8,
                      hintText: "Enter name",
                      onChanged: authCubit.signupNameChanged),
                  SpacingConsts().smallHeightBetweenFields(context),
                  CustomTextField(
                      fieldWidth: 0.6,
                      fieldHeight: 0.8,
                      hintText: "Enter email",
                      onChanged: authCubit.signupEmailChanged),
                  SpacingConsts().smallHeightBetweenFields(context),
                  CustomTextField(
                      fieldWidth: 0.6,
                      fieldHeight: 0.8,
                      hintText: "Enter password",
                      onChanged: authCubit.signupPasswordChanged),
                  SpacingConsts().smallHeightBetweenFields(context),
                  CustomTextField(
                      fieldWidth: 0.6,
                      fieldHeight: 0.8,
                      hintText: "Enter confirm password",
                      onChanged: authCubit.signupConfirmPasswordChanged),
                  SpacingConsts().smallHeightBetweenFields(context),
                  ElevatedButton(
                      onPressed: () {
                        authCubit.signup(state.name!, state.email!,
                            state.password!, state.confirmPassword!);
                      },
                      child: const AutoSizeText("Signup"))
                ],
              ),
            ),
          ));
        }

        if (state is AuthenticatedState) {
          return const AutoSizeText("Authenticated");
        }

        return const AutoSizeText("Last resort sign in page");
      },
    );
  }
}

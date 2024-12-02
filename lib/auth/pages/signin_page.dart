import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/auth/auth_cubit.dart';
import 'package:campus_connect_frontend/auth/auth_state.dart';
import 'package:campus_connect_frontend/components/text_field.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is SigninState) {
          final authCubit = context.read<AuthCubit>();
          return Scaffold(
              body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpacingConsts().customHeightBetweenFields(context, 0.3),
                if (state.errorMessage != null)
                  AutoSizeText(state.errorMessage!),
                if (state.errorMessage != null)
                  SpacingConsts().smallHeightBetweenFields(context),
                CustomTextField(
                    fieldWidth: 0.6,
                    hintText: "Enter email",
                    onChanged: authCubit.signinEmailChanged),
                SpacingConsts().smallHeightBetweenFields(context),
                CustomTextField(
                    fieldWidth: 0.6,
                    hintText: "Enter password",
                    onChanged: authCubit.signinPasswordChanged),
                SpacingConsts().smallHeightBetweenFields(context),
                ElevatedButton(
                    onPressed: () {
                      authCubit.login(state.email!, state.password!);
                    },
                    child: AutoSizeText("Login"))
              ],
            ),
          ));
        }

        return const AutoSizeText("Last resort sign in page");
      },
    );
  }
}

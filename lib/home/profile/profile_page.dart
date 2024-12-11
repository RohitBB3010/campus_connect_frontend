import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/components/custom_button.dart';

import 'package:campus_connect_frontend/components/loading_page.dart';
import 'package:campus_connect_frontend/components/text_field.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:campus_connect_frontend/home/profile/profile_cubit.dart';
import 'package:campus_connect_frontend/home/profile/profile_state.dart';
import 'package:campus_connect_frontend/models/user_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return BlocProvider(
        create: (context) => ProfileCubit()..fetchHomePage(),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoadingState) {
              return const LoadingPage();
            } else if (state is ProfileLoadedState) {
              nameController.text = state.modName!;
              emailController.text = state.modEmail!;

              String imageUrl = "http://10.0.2.2:8000/${state.user!.imageUrl}";
              debugPrint(imageUrl);
              return Scaffold(
                appBar: AppBar(
                    toolbarHeight: MediaQuery.of(context).size.height * 0.1,
                    titleSpacing: 0,
                    title: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.07,
                            child: const Image(
                                image: AssetImage("assets/cc_logo.jpeg")),
                          ),
                          SpacingConsts().smallWidthBetweenFields(context),
                          const AutoSizeText("Corel",
                              style: TextStyle(
                                  fontFamily: "MinorkSemiBold",
                                  fontSize: 40.0)),
                        ],
                      ),
                    )),
                body: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SpacingConsts().smallHeightBetweenFields(context),
                        const AutoSizeText(
                          "Your profile",
                          style: TextStyle(
                              fontFamily: "MinorkSemiBold", fontSize: 25.0),
                        ),
                        SpacingConsts().smallHeightBetweenFields(context),
                        editProfile(state.user!, context, nameController,
                            emailController, state.image)
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is ProfileErrorState) {
              return AutoSizeText(state.error);
            }
            return const AutoSizeText("Last case profile page");
          },
        ));
  }

  Widget editProfile(
      User user,
      BuildContext context,
      TextEditingController nameController,
      TextEditingController emailController,
      PlatformFile? image) {
    debugPrint(user.imageUrl);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            "Name",
            style: TextStyle(fontFamily: "Nunito", fontSize: 20.0),
          ),
          CustomTextField(
              fieldHeight: 0.05,
              controller: nameController,
              fieldWidth: 0.9,
              onChanged: context.read<ProfileCubit>().nameChanged),
          SpacingConsts().smallHeightBetweenFields(context),
          const AutoSizeText(
            "Email",
            style: TextStyle(fontFamily: "Nunito", fontSize: 20.0),
          ),
          CustomTextField(
              fieldHeight: 0.05,
              controller: emailController,
              fieldWidth: 0.9,
              isEnabled: false,
              onChanged: context.read<ProfileCubit>().emailChanged),
          SpacingConsts().smallHeightBetweenFields(context),
          const AutoSizeText(
            "Avatar",
            style: TextStyle(fontFamily: "Nunito", fontSize: 20.0),
          ),
          if (image != null)
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.6)),
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                      image: MemoryImage(image.bytes!), fit: BoxFit.contain)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        context.read<ProfileCubit>().imageChanged(null);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ],
              ),
            ),
          if (image == null)
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(10.0)),
                child: IconButton(
                    onPressed: () async {
                      try {
                        debugPrint("Code executed here");
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: [
                            'jpg',
                            'png',
                            'jpeg'
                          ], // Specify file types if needed
                          withData: true, // Retrieves file bytes
                        );

                        if (result != null) {
                          // ignore: use_build_context_synchronously
                          context
                              .read<ProfileCubit>()
                              .imageChanged(result.files.single);
                        }
                      } catch (err) {
                        debugPrint("Error is :");
                        debugPrint(err.toString());
                      }
                    },
                    icon: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_file),
                        AutoSizeText(
                          "Upload Image",
                          style:
                              TextStyle(fontFamily: 'Nunito', fontSize: 18.0),
                        )
                      ],
                    ))),
          SpacingConsts().mediumHeightBetweenFields(context),
          CustomButton(context, "Save", ColorConsts().secondary_orange, () {},
              0.8, 0.06, 20)
        ],
      ),
    );
  }
}

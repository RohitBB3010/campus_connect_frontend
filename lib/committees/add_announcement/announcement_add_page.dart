import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/committees/add_announcement/announcement_add_cubit.dart';
import 'package:campus_connect_frontend/committees/add_announcement/announcement_add_state.dart';
import 'package:campus_connect_frontend/components/text_field.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementAddPage extends StatelessWidget {
  const AnnouncementAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const AutoSizeText("Add Announcement",
                  style: TextStyle(fontFamily: "Minork", fontSize: 30.0)),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 35.0,
                    ))
              ],
            ),
            body: BlocProvider(
              create: (context) => AnnouncementAddCubit(),
              child: BlocBuilder<AnnouncementAddCubit, AnnouncementAddState>(
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SpacingConsts().mediumHeightBetweenFields(context),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AutoSizeText(
                              "Title",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: "Minork", fontSize: 25.0),
                            ),
                            CustomTextField(
                                fieldHeight: 0.07,
                                fieldWidth: 0.8,
                                onChanged: context
                                    .read<AnnouncementAddCubit>()
                                    .titleChanged),
                            SpacingConsts().smallHeightBetweenFields(context),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AutoSizeText(
                              "Announcement Content",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: "Minork", fontSize: 25.0),
                            ),
                            CustomTextField(
                              fieldHeight: 0.12,
                              fieldWidth: 0.8,
                              onChanged: context
                                  .read<AnnouncementAddCubit>()
                                  .contentChanged,
                              minLines: 4,
                              multiLine: true,
                            ),
                            SpacingConsts().smallHeightBetweenFields(context),
                            buildVisibilityTags(context, state.isSelected),
                            SpacingConsts().smallHeightBetweenFields(context),
                            tagDropDown(context, state.tag)
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )));
  }

  Widget buildVisibilityTags(BuildContext context, int isSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Select visibility",
          textAlign: TextAlign.start,
          style: TextStyle(fontFamily: "Minork", fontSize: 25.0),
        ),
        SpacingConsts().smallHeightBetweenFields(context),
        Center(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.065,
                decoration: BoxDecoration(
                    color: ColorConsts().icons_bg,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<AnnouncementAddCubit>()
                            .isSelectedChanged(0);
                      },
                      child: Card(
                        elevation: isSelected == 0 ? 3.0 : 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.24,
                          height: MediaQuery.of(context).size.height * 0.055,
                          decoration: BoxDecoration(
                              color: isSelected == 0
                                  ? Colors.white
                                  : ColorConsts().icons_bg,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: const Center(
                            child: AutoSizeText(
                              "All",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<AnnouncementAddCubit>()
                            .isSelectedChanged(1);
                      },
                      child: Card(
                        elevation: isSelected == 1 ? 3.0 : 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.24,
                          height: MediaQuery.of(context).size.height * 0.055,
                          decoration: BoxDecoration(
                              color: isSelected == 1
                                  ? Colors.white
                                  : ColorConsts().icons_bg,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: const Center(
                            child: AutoSizeText(
                              "Members",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<AnnouncementAddCubit>()
                            .isSelectedChanged(2);
                      },
                      child: Card(
                        elevation: isSelected == 2 ? 3.0 : 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.24,
                          height: MediaQuery.of(context).size.height * 0.055,
                          decoration: BoxDecoration(
                              color: isSelected == 2
                                  ? Colors.white
                                  : ColorConsts().icons_bg,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: const Center(
                            child: AutoSizeText(
                              "Members + Extended",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget tagDropDown(BuildContext context, String? selectedTag) {
    List<String> tags = [
      "Event",
      "Important",
      "Urgent",
      "Meeting",
      "Update",
      "Casual",
      "Achievement",
      "Feedback"
    ];

    selectedTag = selectedTag ?? tags[0];

    return Column(
      children: [
        const AutoSizeText(
          "Tag",
          style: TextStyle(fontFamily: "Minork", fontSize: 26.0),
        ),
        SpacingConsts().smallHeightBetweenFields(context),
        DropdownButtonFormField2(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              filled: true,
              fillColor: ColorConsts().icons_bg,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2.0,
                ),
              ),
            ),
            value: selectedTag,
            items: tags.map((tag) {
              return DropdownMenuItem(
                value: tag,
                child: AutoSizeText(
                  tag,
                  style: const TextStyle(fontFamily: 'Nunito'),
                ),
              );
            }).toList(),
            onChanged: (value) {
              context.read<AnnouncementAddCubit>().tagChanged(value!);
            })
      ],
    );
  }
}

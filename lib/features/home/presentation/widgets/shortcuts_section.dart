import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auvnet_internship_assessment/core/utils/extensions.dart';
import 'package:auvnet_internship_assessment/features/home/domain/entities/shortcuts_entity.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/bloc/home_bloc.dart';
import 'package:auvnet_internship_assessment/features/home/presentation/bloc/home_state.dart';
import 'loading_widget.dart';
import 'section_title.dart';
import 'shortcut_item.dart';

class ShortcutsSection extends StatelessWidget {
  const ShortcutsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, List<ShortcutsEntity>>(
      selector: (state) => state is HomeLoaded ? state.shortcuts : [],
      builder: (context, shortcuts) {
        if (shortcuts.isEmpty) {
          return const LoadingWidget();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: "Shortcuts:"),
            SizedBox(
              height: context.screenHeight * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: shortcuts.length,
                itemBuilder: (context, index) =>
                    ShortcutItem(shortcut: shortcuts[index]),
              ),
            ),
          ],
        );
      },
    );
  }
}

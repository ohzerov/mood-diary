import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_diary/features/mood/presentation/cubit/ValidationCubit.dart';
import 'package:mood_diary/features/mood/presentation/widgets/mood_selection_widget.dart';
import 'package:mood_diary/features/mood/presentation/widgets/notes_widget.dart';
import 'package:mood_diary/features/mood/presentation/widgets/self_rating_widget.dart';
import 'package:mood_diary/features/mood/presentation/widgets/stress_level_widget.dart';
import 'package:mood_diary/utils/themes/colors.dart';

class MoodFillTab extends StatelessWidget {
  const MoodFillTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const MoodSelectionWidget(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: StressLevelWidget(),
          ),
          const SizedBox(
            height: 36,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SelfRatingWidget(),
          ),
          const SizedBox(
            height: 36,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: NotesWidget(),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 44,
              child: BlocBuilder<ValidationCubit, ValidationState>(
                  builder: (context, state) {
                bool isActive = state.isValid;
                return ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: mandarinColor),
                  onPressed: isActive
                      ? () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text("Все супер!"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Назад"))
                                    ],
                                  ));
                        }
                      : null,
                  child: Text(
                    "Сохранить",
                    style:
                        GoogleFonts.nunito(color: whiteMainColor, fontSize: 20),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

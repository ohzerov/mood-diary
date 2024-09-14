import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_diary/features/mood/data/models/moodModel.dart';
import 'package:mood_diary/features/mood/presentation/cubit/ValidationCubit.dart';
import 'package:mood_diary/features/mood/presentation/widgets/custom_chip.dart';
import 'package:mood_diary/utils/themes/colors.dart';

class MoodSelectionWidget extends StatefulWidget {
  const MoodSelectionWidget({super.key});

  @override
  State<MoodSelectionWidget> createState() => _MoodSelectionWidgetState();
}

class _MoodSelectionWidgetState extends State<MoodSelectionWidget> {
  List<Mood> selectedFeelings = [];
  List<int> moodHistory = [];
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Что чувствуешь?",
            style: GoogleFonts.nunito(
                fontSize: 16, fontWeight: FontWeight.w800, color: textColor),
          ),
        ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moods.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    Mood selectedMood = moods[index];
                    if (selectedFeelings.contains(selectedMood)) {
                      selectedFeelings.remove(selectedMood);
                      moodHistory.remove(index);
                    } else {
                      selectedFeelings.add(selectedMood);
                      moodHistory.add(index);
                      selectedMood.selectedSubFeelings = [];
                    }
                    context
                        .read<ValidationCubit>()
                        .updateIntegerList(moodHistory);
                    isExpanded = moodHistory.isNotEmpty;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: shadowColor,
                            blurRadius: 11,
                            spreadRadius: 0,
                            offset: Offset(2, 4),
                          )
                        ],
                        color: whiteMainColor,
                        borderRadius: BorderRadius.circular(50),
                        border: selectedFeelings.contains(moods[index])
                            ? Border.all(color: mandarinColor, width: 2)
                            : null,
                      ),
                      height: 118,
                      width: 83,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            child: SizedBox(
                                width: 53,
                                height: 50,
                                child: Image.asset(moods[index].iconPath)),
                          ),
                          Text(
                            moods[index].name,
                            style: GoogleFonts.nunito(
                                fontSize: 11, color: textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 255, 253, 252),
          child: moodHistory.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 20, left: 20, right: 20),
                  child: Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: List.generate(
                      moods[moodHistory.last].feelings.length,
                      (index) {
                        Mood currentMood = moods[moodHistory.last];
                        return CustomChip(
                          label: currentMood.feelings[index],
                          isSelected:
                              currentMood.selectedSubFeelings.contains(index),
                          onSelected: () {
                            setState(() {
                              if (currentMood.selectedSubFeelings
                                  .contains(index)) {
                                currentMood.selectedSubFeelings.remove(index);
                              } else {
                                currentMood.selectedSubFeelings.add(index);
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
                )
              : const SizedBox(
                  height: 20,
                ),
        ),
      ],
    );
  }
}

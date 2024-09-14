import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_diary/features/mood/presentation/cubit/ValidationCubit.dart';
import 'package:mood_diary/utils/themes/colors.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Заметки",
          style: GoogleFonts.nunito(
              fontSize: 16, fontWeight: FontWeight.w800, color: textColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              color: shadowColor,
              blurRadius: 10,
              spreadRadius: 0,
              offset: Offset(2, 4),
            )
          ], color: whiteMainColor, borderRadius: BorderRadius.circular(13)),
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: TextField(
                  onChanged: (text) {
                    context.read<ValidationCubit>().updateTextField(text);
                  },
                  cursorColor: textColor,
                  cursorHeight: 14,
                  minLines: 4,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: GoogleFonts.nunito(fontSize: 14, color: textColor),
                  decoration: InputDecoration(
                    hintText: "Введите заметку",
                    hintStyle:
                        GoogleFonts.nunito(fontSize: 14, color: inactiveColor),
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

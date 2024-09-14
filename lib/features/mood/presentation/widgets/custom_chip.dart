import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_diary/utils/themes/colors.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;
  final Color backgroundColor = whiteMainColor;
  final Color selectedColor = mandarinColor;
  final Color textMainColor = textColor;
  final Color shadowMainColor = shadowColor;

  const CustomChip({super.key, 
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: FittedBox(
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? selectedColor : backgroundColor,
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [
              BoxShadow(
                color: shadowColor,
                blurRadius: 10,
                offset: Offset(2, 4),
              )
            ],
            border: Border.all(
              color: Colors.transparent,
            ),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.nunito(
                fontSize: 11,
                color: isSelected ? backgroundColor : textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_diary/features/mood/presentation/cubit/ValidationCubit.dart';

import 'package:mood_diary/utils/themes/colors.dart';

class SelfRatingWidget extends StatefulWidget {
  const SelfRatingWidget({super.key});

  @override
  State<SelfRatingWidget> createState() => _SelfRatingWidgetState();
}

class _SelfRatingWidgetState extends State<SelfRatingWidget> {
  double currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Самооценка',
          style: GoogleFonts.nunito(
              fontSize: 16, fontWeight: FontWeight.w800, color: textColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: shadowColor,
                blurRadius: 10,
                offset: Offset(2, 4),
              )
            ],
            color: whiteMainColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Align(
            child: SizedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(6, (index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: grey,
                                borderRadius: BorderRadius.circular(25)),
                            height: 8,
                            width: 2,
                          );
                        })),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: SizedBox(
                        height: 6,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: CustomThumbShape(
                                currentSliderValue: currentSliderValue),
                            trackShape: EdgeToEdgeTrackShape(),
                          ),
                          child: Slider(
                            activeColor: currentSliderValue != 0
                                ? mandarinColor
                                : inactiveColor,
                            thumbColor: currentSliderValue != 0
                                ? mandarinColor
                                : inactiveColor,
                            min: -6,
                            max: 6,
                            value: currentSliderValue,
                            onChanged: (dynamic newValue) {
                              setState(() {
                                currentSliderValue = newValue;
                                context
                                    .read<ValidationCubit>()
                                    .updateSlider2(currentSliderValue);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Неуверенность",
                            style: GoogleFonts.nunito(
                                fontSize: 11, color: textGrey),
                          ),
                          Text(
                            "Уверенность",
                            style: GoogleFonts.nunito(
                                fontSize: 11, color: textGrey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EdgeToEdgeTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    const double trackHeight = 6;
    final double trackWidth = parentBox.size.width;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    return Rect.fromLTWH(offset.dx, trackTop, trackWidth, trackHeight);
  }
}

class CustomThumbShape extends SliderComponentShape {
  double currentSliderValue;
  CustomThumbShape({
    required this.currentSliderValue,
  });
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(9, 9);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint fillPaint = Paint()
      ..color = currentSliderValue != 0 ? mandarinColor : inactiveColor
      ..style = PaintingStyle.fill;

    final Paint strokePaint = Paint()
      ..color = whiteMainColor
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 9, strokePaint);
    canvas.drawCircle(center, 5, fillPaint);
  }
}

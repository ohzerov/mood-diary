import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "Умная статистика....",
      style: GoogleFonts.nunito(fontSize: 30),
    ));
  }
}

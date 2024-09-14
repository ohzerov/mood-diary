import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/calendar.png'),
              Text(
                textAlign: TextAlign.center,
                'Здесь мог бы быть ваш календарь',
                style: GoogleFonts.nunito(
                    fontSize: 25, fontWeight: FontWeight.w800),
              ),
              Text(
                'Но я не успел(((((',
                style: GoogleFonts.nunito(
                    fontSize: 20, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}

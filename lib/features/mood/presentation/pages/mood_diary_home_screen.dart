import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/features/calendar/calendar.dart';

import 'package:mood_diary/features/mood/presentation/cubit/ValidationCubit.dart';
import 'package:mood_diary/features/mood/presentation/pages/tabs/mood_fill_tab.dart';
import 'package:mood_diary/features/mood/presentation/pages/tabs/stats_tab.dart';

import 'package:mood_diary/utils/themes/colors.dart';

class MoodDiaryHomeScreen extends StatefulWidget {
  const MoodDiaryHomeScreen({super.key});

  @override
  State<MoodDiaryHomeScreen> createState() => _MoodDiaryHomeScreenState();
}

class _MoodDiaryHomeScreenState extends State<MoodDiaryHomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dateNow = DateFormat('d MMMM H:mm', 'ru').format(DateTime.now());
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (_) => ValidationCubit(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.calendar_month_rounded,
                  color: inactiveColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Calendar()),
                  );
                },
              )
            ],
            title: Text(
              dateNow,
              style: GoogleFonts.nunito(
                fontSize: 18,
                color: inactiveColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          backgroundColor: backgroundColor,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), color: grey),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: mandarinColor),
                    labelColor: whiteMainColor,
                    unselectedLabelColor: textGrey,
                    tabs: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(
                            Icons.book,
                            size: 10,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Flexible(
                            child: Text(
                              'Дневник настроения',
                              style: GoogleFonts.nunito(
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 11),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.book, size: 12),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              'Статистика',
                              style: GoogleFonts.nunito(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [MoodFillTab(), StatsTab()]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

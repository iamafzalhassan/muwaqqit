import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muwaqqit/features/dashboard/presentation/cubits/dashboard_cubit.dart';
import 'package:muwaqqit/features/dashboard/presentation/cubits/dashboard_state.dart';
import 'package:muwaqqit/features/dashboard/presentation/widgets/header_bar.dart';
import 'package:muwaqqit/features/dashboard/presentation/widgets/main_panels_row.dart';
import 'package:muwaqqit/features/dashboard/presentation/widgets/prayer_time_bar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        if (!state.ready) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            HeaderBar(gregorianDate: state.gregorianDate, hijriDate: state.hijriDate, masjidName: state.masjidName),
            MainPanelsRow(countdown: state.nextPrayerCountdown, countdownLabel: state.nextLabel, now: state.now),
            PrayerTimeBar(prayers: state.prayerTimes),
          ],
        );
      },
    ),
  );
}

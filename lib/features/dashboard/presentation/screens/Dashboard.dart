import 'package:flutter/material.dart';
import 'package:muwaqqit/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:muwaqqit/features/dashboard/presentation/controllers/dashboard_controller.dart';
import 'package:muwaqqit/features/dashboard/presentation/widgets/header_bar.dart';
import 'package:muwaqqit/features/dashboard/presentation/widgets/main_panels_row.dart';
import 'package:muwaqqit/features/dashboard/presentation/widgets/prayer_time_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late final DashboardController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DashboardController(
      repository: const DashboardRepositoryImpl(),
    );
    _controller.addListener(_onTick);
  }

  void _onTick() => setState(() {});

  @override
  void dispose() {
    _controller.removeListener(_onTick);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = _controller.state;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          HeaderBar(
            gregorianDate: state.gregorianDate,
            masjidName: state.masjidName,
            hijriDate: state.hijriDate,
          ),

          MainPanelsRow(now: state.now, jumuahCountdown: state.jumuahCountdown),

          PrayerTimeBar(prayers: state.prayerTimes),
        ],
      ),
    );
  }
}
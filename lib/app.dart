import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muwaqqit/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:muwaqqit/features/dashboard/presentation/cubits/dashboard_cubit.dart';
import 'package:muwaqqit/features/dashboard/presentation/screens/Dashboard.dart';

import 'core/theme/app_theme.dart';

class Muwaqqit extends StatelessWidget {
  const Muwaqqit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardCubit(
        repository: const DashboardRepositoryImpl(),
      ),
      child: MaterialApp(
        title: 'Muwaqqit',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const Dashboard(),
      ),
    );
  }
}
import 'package:muwaqqit/features/dashboard/presentation/cubits/dashboard_state.dart';

abstract class DashboardRepository {
  DashboardState getInitialState();

  DashboardState tick(DashboardState current);
}
import 'package:muwaqqit/features/dashboard/domain/entities/dashboard_state.dart';

abstract class DashboardRepository {
  DashboardState getInitialState();

  DashboardState tick(DashboardState current);
}
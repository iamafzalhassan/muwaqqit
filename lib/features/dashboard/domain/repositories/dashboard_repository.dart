import 'package:muwaqqit/features/dashboard/presentation/cubits/dashboard_state.dart';

abstract class DashboardRepository {
  Future<DashboardState> load();

  DashboardState tick(DashboardState current);
}

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muwaqqit/features/dashboard/presentation/cubits/dashboard_state.dart';
import 'package:muwaqqit/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required this.repository}) : super(repository.getInitialState()) {
    startTimer();
  }

  final DashboardRepository repository;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      emit(repository.tick(state));
    });
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
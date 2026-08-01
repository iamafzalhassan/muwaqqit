import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muwaqqit/features/dashboard/presentation/cubits/dashboard_state.dart';
import 'package:muwaqqit/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required this.repository})
    : super(DashboardState.loading()) {
    _init();
  }

  final DashboardRepository repository;
  Timer? timer;

  Future<void> _init() async {
    final state = await repository.load();
    if (isClosed) return;
    emit(state);
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (isClosed) return;
      emit(repository.tick(state));
    });
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
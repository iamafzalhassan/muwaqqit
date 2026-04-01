import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muwaqqit/features/dashboard/presentation/cubits/dashboard_state.dart';
import 'package:muwaqqit/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required DashboardRepository repository}): _repository = repository, super(repository.getInitialState()) {
    _startTimer();
  }

  final DashboardRepository _repository;
  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      emit(_repository.tick(state));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
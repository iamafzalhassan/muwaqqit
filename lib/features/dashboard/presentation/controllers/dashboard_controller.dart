import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:muwaqqit/features/dashboard/domain/entities/dashboard_state.dart';
import 'package:muwaqqit/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardController extends ChangeNotifier {
  DashboardController({required DashboardRepository repository})
    : _repository = repository {
    _state = _repository.getInitialState();
    _startTimer();
  }

  final DashboardRepository _repository;
  late DashboardState _state;
  Timer? _timer;

  DashboardState get state => _state;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _state = _repository.tick(_state);
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
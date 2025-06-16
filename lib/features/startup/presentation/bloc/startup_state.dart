import 'package:auvnet_internship_assessment/features/startup/domain/entities/startup_status.dart';

abstract class StartupState {}

class StartupInitial extends StartupState {}

class StartupLoading extends StartupState {}

class StartupLoaded extends StartupState {
  final StartupStatus status;

  StartupLoaded(this.status);
}

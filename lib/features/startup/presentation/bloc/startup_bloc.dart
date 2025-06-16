import 'package:auvnet_internship_assessment/features/startup/domain/use_cases/get_startup_status.dart';
import 'package:auvnet_internship_assessment/features/startup/presentation/bloc/startup_event.dart';
import 'package:auvnet_internship_assessment/features/startup/presentation/bloc/startup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartupBloc extends Bloc<StartupEvent, StartupState> {
  final GetStartupStatus getStartupStatus;

  StartupBloc(this.getStartupStatus) : super(StartupInitial()) {
    on<CheckStartupEvent>((event, emit) async {
      emit(StartupLoading());
      final result = await getStartupStatus();
      emit(StartupLoaded(result));
    });
  }
}

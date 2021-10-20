import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/startup.dart';
part 'startup_event.dart';

part 'startup_state.dart';

class StartupBloc extends Bloc<StartupEvent, StartupState> {
  StartupBloc() : super(const StartupInitial());
  
}
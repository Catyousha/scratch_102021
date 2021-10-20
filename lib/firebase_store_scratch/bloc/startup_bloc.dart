import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratch_102021/firebase_store_scratch/services/startup_services.dart';
import '../models/startup.dart';
part 'startup_event.dart';

part 'startup_state.dart';

class StartupBloc extends Bloc<StartupEvent, StartupState> {
  StartupBloc() : super(const StartupInitial()) {
    on<StartupFetchingAllData>(_onFetching);
    on<StartupAddingData>(_onAdding);
  }

  void _onFetching(
    StartupFetchingAllData event,
    Emitter<StartupState> emit,
  ) async {
    emit(const StartupFetchLoading(null));
    QuerySnapshot<Object?>? response = await StartupServices.loadAllStartup();
    if (response != null) {
      List<Startup> data = response.docs.map((doc) {
        return Startup.fromDocument(doc);
      }).toList();
      emit(StartupFetchLoaded(data));
    } else {
      emit(const StartupFetchError("Something went wrong, please try again"));
    }
  }

  void _onAdding(
    StartupAddingData event,
    Emitter<StartupState> emit,
  ) async {
    List<Startup> prevData = state.data ?? [];
    emit(StartupFetchLoading(prevData));
    await StartupServices.addStartup(event.startup);
    emit(StartupFetchLoaded([...prevData, event.startup]));
  }
}

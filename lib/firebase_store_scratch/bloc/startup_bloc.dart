import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratch_102021/firebase_store_scratch/models/service_response.dart';
import '../services/startup_services.dart';
import '../models/startup.dart';
part 'startup_event.dart';

part 'startup_state.dart';

class StartupBloc extends Bloc<StartupEvent, StartupState> {
  StartupBloc() : super(const StartupInitial()) {
    on<StartupFetchingAllData>(_onFetching);
    on<StartupAddingData>(_onAdding);
    on<StartupEditingData>(_onEditing);
    on<StartupDeleteData>(_onDelete);
  }

  void _onFetching(
    StartupFetchingAllData event,
    Emitter<StartupState> emit,
  ) async {
    emit(const StartupFetchLoading(null));
    await StartupServices.loadAllStartup().then((response) {
      if (response != null) {
        List<Startup> data = response.docs.map((doc) {
          return Startup.fromDocument(doc);
        }).toList();
        emit(StartupFetchLoaded(data));
      } else {
        emit(const StartupFetchError("Something went wrong, please try again"));
      }
    });
  }

  void _onAdding(
    StartupAddingData event,
    Emitter<StartupState> emit,
  ) async {
    List<Startup> prevData = state.data ?? [];
    emit(StartupFetchLoading(prevData));

    await StartupServices.addStartup(
      event.startup,
    ).then((response) {
      if (response.type == ResponseType.success) {
        event.startup.id = response.docRef!.id;
        prevData.add(event.startup);
        prevData.sort((a, b) => a.name!.compareTo(b.name!));
        emit(StartupFetchLoaded(prevData));
      } else {
        emit(StartupFetchError(response.message));
      }
    });
  }

  void _onEditing(
    StartupEditingData event,
    Emitter<StartupState> emit,
  ) async {
    List<Startup> prevData = state.data!;
    emit(StartupFetchLoading(prevData));

    await StartupServices.editStartup(
      event.startup,
    ).then((response) {
      if (response.type == ResponseType.success) {
        int idx = prevData.indexWhere(
          (element) => element.id == event.startup.id,
        );
        prevData[idx] = event.startup;
        emit(StartupFetchLoaded(prevData));
      } else {
        emit(StartupFetchError(response.message));
      }
    });
  }

  void _onDelete(
    StartupDeleteData event,
    Emitter<StartupState> emit,
  ) async {
    List<Startup> prevData = state.data ?? [];
    emit(StartupFetchLoading(prevData));
    await StartupServices.deleteStartup(
      event.startup,
    ).then((response) {
      if (response.type == ResponseType.success) {
        int idx = prevData.indexWhere(
          (element) => element.id == event.startup.id,
        );
        prevData.removeAt(idx);
        emit(StartupFetchLoaded(prevData));
      } else {
        emit(StartupFetchError(response.message));
      }
    });
  }
}

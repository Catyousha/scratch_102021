part of 'startup_bloc.dart';

abstract class StartupEvent {
  StartupEvent();
}

class StartupFetchingAllData extends StartupEvent {
  StartupFetchingAllData();
}

class StartupAddingData {
  Startup startup;
  StartupAddingData(this.startup);
}

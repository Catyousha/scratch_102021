part of 'startup_bloc.dart';

abstract class StartupEvent {
  StartupEvent();
}

class StartupFetchingAllData extends StartupEvent {
  StartupFetchingAllData();
}

class StartupAddingData extends StartupEvent {
  Startup startup;
  StartupAddingData(this.startup);
}

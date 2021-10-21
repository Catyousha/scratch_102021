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

class StartupEditingData extends StartupEvent {
  Startup startup;
  StartupEditingData(this.startup);
}

class StartupDeleteData extends StartupEvent {
  Startup startup;
  StartupDeleteData(this.startup);
}

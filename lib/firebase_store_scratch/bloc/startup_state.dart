part of 'startup_bloc.dart';

class StartupState extends Equatable {
  final List<Startup>? data;
  final String? message;
  const StartupState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message];
}

class StartupInitial extends StartupState{
  const StartupInitial();
}

class StartupFetchLoading extends StartupState {
  const StartupFetchLoading();

  @override
  List<Object?> get props => [];
}

class StartupFetchLoaded extends StartupState {
  const StartupFetchLoaded(
    List<Startup> data,
  ) : super(
          data: data,
          message: "${data.length} data has been loaded.",
        );

  @override
  List<Object?> get props => [data];
}

class StartupFetchError extends StartupState {
  const StartupFetchError(String message) : super(message: message);
}

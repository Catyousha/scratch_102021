import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/startup_bloc.dart';
import '../models/startup.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup List'),
      ),
      body: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<StartupBloc>().add(StartupFetchingAllData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StartupState _stateWatch = context.watch<StartupBloc>().state;
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _stateWatch.data?.length ?? 0,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_stateWatch.data![index].name!),
              );
            },
          ),
          if (_stateWatch is StartupFetchLoading)
            const CircularProgressIndicator(),
          TextButton(
            onPressed: () {
              context.read<StartupBloc>().add(
                    StartupAddingData(
                      Startup(
                        name: Faker().company.name(),
                        founderName: Faker().person.name(),
                        dateFounded: Faker().date.dateTime(),
                      ),
                    ),
                  );
            },
            child: const Text("Add Random Startup"),
          )
        ],
      ),
    );
  }
}

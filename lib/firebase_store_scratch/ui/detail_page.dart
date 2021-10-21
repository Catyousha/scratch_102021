import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/startup_bloc.dart';
import '../widgets/primary_date_input.dart';
import '../models/startup.dart';
import '../widgets/primary_text_input.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Startup startup;
    try {
      startup = ModalRoute.of(context)!.settings.arguments as Startup;
    } catch (e) {
      return const Scaffold(
        body: Center(
          child: Text('Invalid routing'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: DetailView(
        startup: startup,
      ),
    );
  }
}

class DetailView extends StatefulWidget {
  final Startup startup;
  const DetailView({
    Key? key,
    required this.startup,
  }) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final _formKey = GlobalKey<FormState>();
  late Startup newStartup = widget.startup;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              PrimaryTextInput(
                initialValue: newStartup.name,
                label: "Nama Startup",
                valueSetter: (val) {
                  newStartup.name = val;
                },
              ),
              PrimaryTextInput(
                initialValue: newStartup.founderName,
                label: "Nama Pendiri",
                valueSetter: (val) {
                  newStartup.founderName = val;
                },
              ),
              PrimaryDateInput(
                initialDate: newStartup.dateFounded,
                label: "Tanggal Berdiri",
                dateText: newStartup.showDateFounded,
                valueSetter: (val) {
                  newStartup.dateFounded = val;
                  setState(() {});
                },
              ),
              const SizedBox(height: 18.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        padding: const EdgeInsets.all(18.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context
                              .read<StartupBloc>()
                              .add(StartupEditingData(newStartup));
                          Navigator.pushReplacementNamed(context, '/');
                        }
                      },
                      child: (context.watch<StartupBloc>().state
                              is! StartupFetchLoading)
                          ? const Text('Simpan')
                          : const CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

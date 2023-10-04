import 'package:city_care/screens/incident_list_screen.dart';
import 'package:city_care/view_models/incident_list_view_model.dart';
import 'package:city_care/view_models/report_incident_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "City Care",
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => IncidentListViewModel()..getAllIncidents()),
          ChangeNotifierProvider(create: (context) => ReportIncidentViewModel())
        ],
        child: const IncidentListScreen(),
      ),
    );
  }
}

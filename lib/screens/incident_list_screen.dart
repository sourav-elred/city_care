import 'package:city_care/screens/incident_report_screen.dart';
import 'package:city_care/view_models/report_incident_view_model.dart';
import 'package:city_care/widgets/incident_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncidentListScreen extends StatelessWidget {
  const IncidentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Incidents"),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: <Widget>[
          const IncidentList(),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                        create: (context) => ReportIncidentViewModel(),
                        child: const IncidentReportScreen(),
                      ),
                      fullscreenDialog: true,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

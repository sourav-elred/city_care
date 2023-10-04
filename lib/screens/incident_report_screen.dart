import 'package:city_care/view_models/report_incident_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncidentReportScreen extends StatelessWidget {
  const IncidentReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Report an incident")),
      body: Consumer<ReportIncidentViewModel>(
        builder: (context, vm, child) => SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (value) => vm.title = value,
                decoration: InputDecoration(
                  labelText: "Enter title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              TextField(
                onChanged: (value) => vm.description = value,
                textInputAction: TextInputAction.done,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration:
                    const InputDecoration(labelText: "Enter desciption"),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  vm.saveIncident();
                  Navigator.pop(context);
                },
                child:
                    const Text("Save", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:city_care/view_models/incident_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IncidentList extends StatelessWidget {
  const IncidentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IncidentListViewModel>(
      builder: (context, value, child) => ListView.builder(
        itemCount: value.incidents.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(value.incidents[index].title),
          subtitle: Text(value.incidents[index].description),
        ),
      ),
    );
  }
}

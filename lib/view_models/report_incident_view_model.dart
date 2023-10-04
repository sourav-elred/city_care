import 'package:city_care/models/incident.dart';
import 'package:city_care/services/api_service.dart';
import 'package:flutter/material.dart';

class ReportIncidentViewModel extends ChangeNotifier {
  String title = '';
  String description = '';

  final _apiService = ApiService();

  Future<void> saveIncident() async {
    final incident = Incident(title: title, description: description);
    await _apiService.saveIncidentInDB(incident);
  }
}

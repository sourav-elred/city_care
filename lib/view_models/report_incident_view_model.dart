import 'package:city_care/models/incident.dart';
import 'package:city_care/services/api_service.dart';
import 'package:flutter/material.dart';

class ReportIncidentViewModel extends ChangeNotifier {
  String title = '';
  String description = '';
  String imagePath = '';

  final _apiService = ApiService();

  void saveIncident() async {
    final incident = Incident(
      title: title,
      description: description,
      imageURL: imagePath,
    );
    _apiService.saveIncidentInDB(incident);
  }
}

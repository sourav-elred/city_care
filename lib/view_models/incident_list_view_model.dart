import 'package:city_care/models/incident.dart';
import 'package:city_care/services/api_service.dart';
import 'package:flutter/material.dart';

class IncidentListViewModel extends ChangeNotifier {
  List<Incident> incidents = [];
  final _apiService = ApiService();

  void getAllIncidents() async {
    incidents = await _apiService.getAllIncidentFromDB();
    notifyListeners();
  }
}

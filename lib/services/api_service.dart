import 'dart:convert';

import 'package:city_care/models/incident.dart';
import 'package:dio/dio.dart';

class ApiService {
  final _dio = Dio();

  Future<List<Incident>> getAllIncidentFromDB() async {
    const url = "https://vast-savannah-75068.herokuapp.com/incidents";

    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      return response.data.map((e) => Incident.fromJson(e)).toList();
    } else {
      throw Exception('No Response');
    }
  }

  void saveIncidentInDB(Incident incident) async {
    const url = "https://vast-savannah-75068.herokuapp.com/incidentsNoImage";

    await _dio.post(
      url,
      data: {"title": incident.title, "description": incident.description},
      options: Options(contentType: "application/x-www-form-urlencoded"),
    );
  }
}

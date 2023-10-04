import 'package:city_care/models/incident.dart';
import 'package:dio/dio.dart';

class ApiService {
  final _dio = Dio();

  void saveIncidentInDB(Incident incident) async {
    const url = "https://vast-savannah-75068.herokuapp.com/incidentsNoImage";

    await _dio.post(
      url,
      data: {"title": incident.title, "description": incident.description},
      options: Options(contentType: "application/x-www-form-urlencoded"),
    );
  }
}

import 'dart:io';

import 'package:city_care/models/incident.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

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
    const url = "https://vast-savannah-75068.herokuapp.com/incidents";

    File file = File(incident.imageURL);
    final filename = basename(file.path.replaceAll(" ", ""));

    FormData formData = FormData.fromMap({
      "title": incident.title,
      "description": incident.description,
      "image":
          await MultipartFile.fromFile(incident.imageURL, filename: filename)
    });

    await _dio.post(url, data: formData);
  }
}

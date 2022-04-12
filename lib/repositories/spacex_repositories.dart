import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacex_app/models/latest.dart';

const url = 'https://api.spacexdata.com/v4/launches/latest';

class SpacexRepository {
  final http.Client httpClient;
  SpacexRepository(this.httpClient);

  Future<Latest> fetchLatest() async {
    final response = await this.httpClient.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final latestJson = jsonDecode(response.body);
      return Latest.fromJson(latestJson);
    } else {
      throw Exception('Error!');
    }
  }
}

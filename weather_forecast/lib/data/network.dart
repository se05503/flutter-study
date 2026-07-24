import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = "64e9384697d9721ee4eb181e4db51b8d";

class Network {
  Network(this.url);
  final String url;

  Future<Map<String, dynamic>?> getJsonData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonStr = response.body;
      var jsonObj = jsonDecode(jsonStr);
      return jsonObj;
    }
    return null;
  }
}

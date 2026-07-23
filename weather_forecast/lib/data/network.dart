import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Network(this.url);
  final String url;

  Future<dynamic> getJsonData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonStr = response.body;
      var jsonObj = jsonDecode(jsonStr);
      return jsonObj;
    }
  }
}

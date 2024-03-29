import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  final Uri url;

  NetworkHelper(this.url);

  Future getData() async{
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
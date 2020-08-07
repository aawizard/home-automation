import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkingHelper{
  NetworkingHelper( {this.url});
  final  url;
  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      return decodeData;
    }
    else {
      print(response.statusCode);
    }
  }
  }
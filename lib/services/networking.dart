import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.shortUrl, {this.movieSearch});
  String? movieSearch;
  String shortUrl;
  Future getData() async {
    var queryParameters = movieSearch != null
        ? {
            'api_key': '66f87dac8def142f2006a1a5063f98dc',
            'query': '$movieSearch'
          }
        : {
            'api_key': '66f87dac8def142f2006a1a5063f98dc',
          };

    var uri = Uri.https('api.themoviedb.org', shortUrl, queryParameters);

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider_test/model/movie.dart';

class MovieRepository {
  Future<List<Movie>> loadMovies() async {
    var queryParameters = {
      'api_key': '37ad401129054b670231d32a89682dc3'
    }; // https://www.themoviedb.org/ 제공하는 api key

    var uri =
        Uri.https('api.themoviedb.org', '/3/movie/popular', queryParameters);

    var response = await http.get(uri);

    if (response.body != null) {
      Map<String, dynamic> body = json.decode(response.body);

      if (body['results'] != null) {
        List<dynamic> list = body['results'];
        List<Movie> result =
            list.map<Movie>((item) => Movie.fromJson(item)).toList();
        return result;
      }
    }

    List<Movie> list = [];

    return list;
  }
}

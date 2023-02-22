import 'package:movie_app/model/tv_model.dart';

import '../constants/constants.dart';
import '../model/movie_model.dart';
import 'dart:convert';
import 'package:http/http.dart';

enum MovieType { popular, topRated, upcoming }

enum TvType { popular, topRated, onTheAir }

class ApiService {
  Future<List<MovieModel>> getMovieData(MovieType type) async {
    String url = "";
    if (type == MovieType.popular) {
      url = kmoviedbURL + kpopular;
    } else if (type == MovieType.topRated) {
      url = kmoviedbURL + ktop_rated;
    } else if (type == MovieType.upcoming) {
      url = kmoviedbURL + kupcoming;
    }

    try {
      Response response = await get(Uri.parse(
          url + "?api_key=99ac2298b20a80432c1d0f8618e51601&language=en-US"));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['results'];
        List<MovieModel> movie =
            body.map((dynamic item) => MovieModel.fromJson(item)).toList();
        return movie;
      } else {
        throw ("No movie found");
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<List<TVModel>> getTVData(TvType type) async {
    String url = "";
    if (type == TvType.popular) {
      url = ktvdbURL + kpopular;
    } else if (type == TvType.topRated) {
      url = ktvdbURL + ktop_rated;
    } else if (type == TvType.onTheAir) {
      url = ktvdbURL + kon_the_air;
    }

    try {
      Response response = await get(Uri.parse(
          url + "?api_key=99ac2298b20a80432c1d0f8618e51601&language=en-US"));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['results'];
        List<TVModel> tv =
            body.map((dynamic item) => TVModel.fromJson(item)).toList();
        return tv;
      } else {
        throw ("No tv found");
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}

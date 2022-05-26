import 'dart:convert';

import 'package:sample/config/app_constants.dart';
import 'package:sample/models/movie.dart';
import 'package:sample/repository/local/shared_pref_helper.dart';
import 'package:sample/repository/remote/api_service.dart';
import 'package:sample/repository/remote/response/movie_response.dart';

class Repository {
  final _apiService = ApiService();
  final _sharedPref = SharedPrefHelper.instance;
  Future<List<Movie>> fetchMoviesPopular() async {
    final response = await _apiService.request(
      method: Method.get,
      url: AppConstants.moviePopularPath,
    );
    if (response.statusCode == 200) {
      final map = jsonDecode(response.body);
      return MovieResponse.fromJson(map).result;
    }
    return [];
  }

  bool get isFirstLogin => _sharedPref.isFirstLogin;
  set isFirstLogin(bool value) => _sharedPref.isFirstLogin = value;
}

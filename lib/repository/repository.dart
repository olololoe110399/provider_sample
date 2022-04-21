import 'dart:convert';

import 'package:sample/config/app_constants.dart';
import 'package:sample/models/movie.dart';
import 'package:sample/repository/remote/api_service.dart';
import 'package:sample/repository/remote/my_api_sevice.dart';
import 'package:sample/repository/remote/response/movie_response.dart';

class Repository {
  final _apiService = MyApiService();

  Future<List<Movie>> fetchMoviesByCategory(Category category) =>
      _apiService.fetchMoviesByCategory(category);
}

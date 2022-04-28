import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:sample/config/app_constants.dart';
import 'package:sample/models/movie.dart';
import 'package:sample/repository/remote/error/app_exception.dart';
import 'package:sample/repository/remote/error/app_exception_map.dart';
import 'package:sample/repository/remote/my_api_sevice.dart';
import 'package:sample/repository/remote/rest_client.dart';
import 'package:dio/dio.dart';

var logger = Logger();

class Repository {
  final _apiService = MyApiService();
  final _restClient = RestClient(Dio());
  final errorMap = AppExceptionMap();

  Future<List<Movie>> fetchMoviesByCategory(Category category) async {
    try {
      final response = await _restClient.fetchMoviesByCategory(
        category.path,
        apiKey: AppConstants.apiKeyValue,
      );

      return response.results ?? [];
    } catch (error) {
      logger.e(error);
      throw errorMap.map(error);
    }
  }

  Future<List<Movie>> fetchMoviesByCategoryBaseResponse(
      Category category) async {
    try {
      final response = await _restClient.fetchMoviesByCategoryBaseResponse(
        category.path,
        apiKey: AppConstants.apiKeyValue,
      );
      if (response.statusCode == 10) {
        throw errorMap.map(RemoteException(response.statusMessage ?? ''));
      }
      return response.data?.results ?? [];
    } catch (error) {
      logger.e(error);
      throw errorMap.map(error);
    }
  }
}

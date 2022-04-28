import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sample/config/app_constants.dart';
import 'package:sample/repository/remote/response/base_response.dart';
import 'package:sample/repository/remote/response/movie_response.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/movie/{type}")
  Future<MovieResponse> fetchMoviesByCategory(
    @Path('type') String type, {
    @Query(AppConstants.apiKey) String apiKey = AppConstants.apiKeyValue,
  });

  @GET("/movie/{type}")
  Future<BaseResponse<MovieResponse>> fetchMoviesByCategoryBaseResponse(
    @Path('type') String type, {
    @Query(AppConstants.apiKey) String apiKey = AppConstants.apiKeyValue,
  });
}

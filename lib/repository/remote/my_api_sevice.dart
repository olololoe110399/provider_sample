import 'package:sample/models/movie.dart';
import 'package:sample/repository/remote/api_service.dart';
import 'package:sample/repository/remote/response/movie_response.dart';

class MyApiService extends ApiService {
  Future<List<Movie>> fetchMoviesByCategory(
    Category category,
  ) async {
    final map = await request(
      method: Method.get,
      url: 'movie/${category.path}',
    );
    return MovieResponse.fromJson(map).results ?? [];
  }
}

enum Category { popular, topRated, upcoming, nowPlaying }

extension CategoryExt on Category {
  String get path {
    switch (this) {
      case Category.popular:
        return 'popular';
      case Category.topRated:
        return 'top_rated';
      case Category.upcoming:
        return 'upcoming';
      case Category.nowPlaying:
        return 'now_playing';
    }
  }
}

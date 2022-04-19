import 'package:sample/models/movie.dart';

class MovieResponse {
  int _page = 0;
  int _totalResults = 0;
  int _totalPages = 0;
  final List<Movie> _result = [];

  MovieResponse.fromJson(Map<String, dynamic> parsedJson) {
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Movie movie = Movie.fromJson(parsedJson['results'][i]);
      _result.add(movie);
    }
  }

  // getter
  int get page => _page;
  int get totalPages => _totalPages;
  int get totalResults => _totalResults;
  List<Movie> get result => _result;
}

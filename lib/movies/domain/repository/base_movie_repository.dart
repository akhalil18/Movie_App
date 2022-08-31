import '../entities/movie.dart';

abstract class BaseMovieRepository {
  Future<Movie> getNowPlaying();

  Future<Movie> getTopRatedMovies();

  Future<Movie> getPopularMovies();
}

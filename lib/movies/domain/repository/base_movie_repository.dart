import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();
}

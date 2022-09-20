import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation_movie.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_recommendation_movies_use_case.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MoviesDetailsParameters parameters);

  Future<Either<Failure, List<RecommendationMovie>>> getRecommendationMovies(
      RecommendationMoviesParameters parameters);
}

import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommendation_movie_model.dart';
import 'package:movies_app/movies/domain/entities/recommendation_movie.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_recommendation_movies_use_case.dart';

import '../models/movie_details_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MoviesDetailsParameters parameters);

  Future<List<RecommendationMovie>> getRecommendationMovies(
      RecommendationMoviesParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(AppConstants.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(AppConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstants.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map((e) => MovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
    MoviesDetailsParameters parameters,
  ) async {
    final response =
        await Dio().get(AppConstants.movieDetailsPath(parameters.id));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<RecommendationMovie>> getRecommendationMovies(
      RecommendationMoviesParameters parameters) async {
    final response =
        await Dio().get(AppConstants.recommendationPath(parameters.id));

    if (response.statusCode == 200) {
      return List<RecommendationMovieModel>.from(
        (response.data['results'] as List)
            .map((e) => RecommendationMovieModel.fromJson(e)),
      );
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }
}

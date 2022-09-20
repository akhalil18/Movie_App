import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

import '../../../core/base_use_case.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MoviesDetailsParameters> {
  final BaseMovieRepository repository;
  GetMovieDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MoviesDetailsParameters parameters) async {
    return await repository.getMovieDetails(parameters);
  }
}

class MoviesDetailsParameters extends Equatable {
  final int id;
  const MoviesDetailsParameters(this.id);

  @override
  List<Object?> get props => [id];
}

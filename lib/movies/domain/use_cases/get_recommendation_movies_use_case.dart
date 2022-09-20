import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/base_use_case.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/recommendation_movie.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationMoviesUseCase extends BaseUseCase<
    List<RecommendationMovie>, RecommendationMoviesParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetRecommendationMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<RecommendationMovie>>> call(
      RecommendationMoviesParameters parameters) async {
    return await baseMovieRepository.getRecommendationMovies(parameters);
  }
}

class RecommendationMoviesParameters extends Equatable {
  final int id;

  const RecommendationMoviesParameters(this.id);

  @override
  List<Object?> get props => [id];
}

import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation_movie.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_details_use_case.dart';

import '../../domain/use_cases/get_recommendation_movies_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMoviesUseCase getRecommendationMoviesUseCase;

  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getRecommendationMoviesUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationMoviesEvent>(_getRecommendationMovies);
  }

  FutureOr<void> _getRecommendationMovies(event, emit) async {
    final result = await getRecommendationMoviesUseCase(
      RecommendationMoviesParameters(event.id),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
            recommendationMessage: l.message,
            recommendationState: RequestState.error),
      ),
      (r) => emit(state.copyWith(
          recommendations: r, recommendationState: RequestState.loaded)),
    );
  }

  FutureOr<void> _getMovieDetails(event, emit) async {
    final result =
        await getMovieDetailsUseCase(MoviesDetailsParameters(event.id));

    result.fold(
      (l) => emit(
        state.copyWith(
            movieDetailsMessage: l.message,
            movieDetailsState: RequestState.error),
      ),
      (r) => emit(state.copyWith(
          movieDetails: r, movieDetailsState: RequestState.loaded)),
    );
  }
}

part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.movieDetails,
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
    this.recommendations = const [],
  });

  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final MovieDetails? movieDetails;

  final RequestState recommendationState;
  final String recommendationMessage;
  final List<RecommendationMovie> recommendations;

  MovieDetailsState copyWith({
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    MovieDetails? movieDetails,
    RequestState? recommendationState,
    String? recommendationMessage,
    List<RecommendationMovie>? recommendations,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
      recommendations: recommendations ?? this.recommendations,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        recommendationState,
        recommendationMessage,
        recommendations,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';

import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingRequestState;
  final String nowPlayingMessage;

  final List<Movie> topRatedMovies;
  final String topRatedMessage;
  final RequestState topRatedRequestState;

  final List<Movie> popularMovies;
  final RequestState popularRequestState;
  final String popularMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingRequestState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.topRatedMovies = const [],
    this.topRatedMessage = '',
    this.topRatedRequestState = RequestState.loading,
    this.popularMovies = const [],
    this.popularMessage = '',
    this.popularRequestState = RequestState.loading,
  });
  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingRequestState,
        nowPlayingMessage,
        topRatedMovies,
        topRatedRequestState,
        topRatedMessage,
        popularMovies,
        popularRequestState,
        popularMessage,
      ];

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingRequestState,
    String? nowPlayingMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedRequestState,
    String? topRatedMessage,
    List<Movie>? popularMovies,
    RequestState? popularRequestState,
    String? popularMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingRequestState:
          nowPlayingRequestState ?? this.nowPlayingRequestState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedRequestState: topRatedRequestState ?? this.topRatedRequestState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMessage: popularMessage ?? this.popularMessage,
      popularRequestState: popularRequestState ?? this.popularRequestState,
    );
  }
}

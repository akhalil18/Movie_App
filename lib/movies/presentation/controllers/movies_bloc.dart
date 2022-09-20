import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/base_use_case.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import 'package:movies_app/movies/presentation/controllers/movies_event.dart';
import 'package:movies_app/movies/presentation/controllers/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesEvent;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getTopRatedMoviesEvent,
    this.getPopularMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
  }

  FutureOr<void> _getPopularMovies(event, emit) async {
    final result = await getPopularMoviesUseCase(NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
            popularRequestState: RequestState.error, popularMessage: l.message),
      ),
      (r) => emit(
        state.copyWith(
          popularRequestState: RequestState.loaded,
          popularMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(event, emit) async {
    final result = await getTopRatedMoviesEvent(NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
            topRatedRequestState: RequestState.error,
            topRatedMessage: l.message),
      ),
      (r) => emit(
        state.copyWith(
            topRatedRequestState: RequestState.loaded, topRatedMovies: r),
      ),
    );
  }

  FutureOr<void> _getNowPlayingMovies(event, emit) async {
    final result = await getNowPlayingMoviesUseCase(NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
            nowPlayingRequestState: RequestState.error,
            nowPlayingMessage: l.message),
      ),
      (r) => emit(
        state.copyWith(
            nowPlayingRequestState: RequestState.loaded, nowPlayingMovies: r),
      ),
    );
  }
}

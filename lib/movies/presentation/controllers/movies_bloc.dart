import 'package:flutter_bloc/flutter_bloc.dart';
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
    on<GetNowPlayingMoviesEvent>(
      (event, emit) async {
        final result = await getNowPlayingMoviesUseCase.execute();
        result.fold(
          (l) => emit(
            state.copyWith(
                nowPlayingRequestState: RequestState.error,
                nowPlayingMessage: l.message),
          ),
          (r) => emit(
            state.copyWith(
                nowPlayingRequestState: RequestState.loaded,
                nowPlayingMovies: r),
          ),
        );
      },
    );

    on<GetTopRatedMoviesEvent>(
      (event, emit) async {
        final result = await getTopRatedMoviesEvent.execute();
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
      },
    );

    on<GetPopularMoviesEvent>(
      (event, emit) async {
        final result = await getPopularMoviesUseCase.execute();
        result.fold(
          (l) => emit(
            state.copyWith(
                popularRequestState: RequestState.error,
                popularMessage: l.message),
          ),
          (r) => emit(
            state.copyWith(
              popularRequestState: RequestState.loaded,
              popularMovies: r,
            ),
          ),
        );
      },
    );
  }
}

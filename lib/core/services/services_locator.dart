import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/repository/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc.dart';

import '../../movies/data/data_source/movie_remote_data_source.dart';
import '../../movies/domain/use_cases/get_now_playing_movies_use_case.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // Bloc
    sl.registerFactory(() => MoviesBloc(sl()));

    // Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    // Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    // use cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
  }
}

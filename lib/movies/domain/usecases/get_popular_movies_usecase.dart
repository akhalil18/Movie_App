import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import '../entities/movie.dart';

class GetPopularMoviesUsecase {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUsecase(this.baseMovieRepository);

  Future<Movie> excute() async {
    return await baseMovieRepository.getPopularMovies();
  }
}

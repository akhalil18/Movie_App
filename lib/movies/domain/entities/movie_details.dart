import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final String overview;
  final int id;
  final String releaseDate;
  final String runtime;
  final String title;
  final double voteAverage;
  final List<Genres> genresList;

  const MovieDetails({
    required this.backdropPath,
    required this.overview,
    required this.id,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
    required this.genresList,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        overview,
        id,
        releaseDate,
        runtime,
        title,
        voteAverage,
        genresList,
      ];
}

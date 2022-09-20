import 'package:movies_app/movies/data/models/genres.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

class MoviDetailsModel extends MovieDetails {
  const MoviDetailsModel({
    required super.backdropPath,
    required super.overview,
    required super.id,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
    required super.genresList,
  });

  factory MoviDetailsModel.fromJson(Map<String, dynamic> json) =>
      MoviDetailsModel(
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        id: json['id'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'],
        genresList: List.from(
          (json['genres'] as List).map((e) => GenresModel.fromJson(e)),
        ),
      );
}

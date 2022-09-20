import 'package:movies_app/movies/data/models/genres.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.overview,
    required super.id,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
    required super.genresList,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        id: json['id'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average']?.toDouble(),
        genresList: List.from(
          (json['genres'] as List).map((e) => GenresModel.fromJson(e)),
        ),
      );
}

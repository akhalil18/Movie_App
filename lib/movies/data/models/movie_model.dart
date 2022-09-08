import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overView,
    required super.voteAverage,
    required super.generalIds,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        overView: json['overview'],
        voteAverage: json['vote_average']?.toDouble(),
        generalIds: List.from((json['genre_ids'] as List<int>).map((e) => e)),
        releaseDate: json['release_date'],
      );
}

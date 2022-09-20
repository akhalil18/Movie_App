import 'package:movies_app/movies/domain/entities/recommendation_movie.dart';

class RecommendationMovieModel extends RecommendationMovie {
  const RecommendationMovieModel({
    required super.id,
    super.title,
    super.backdropPath,
  });

  factory RecommendationMovieModel.fromJson(Map<String, dynamic> json) =>
      RecommendationMovieModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        title: json['title'],
      );

  @override
  List<Object?> get props => [id, title, backdropPath];
}

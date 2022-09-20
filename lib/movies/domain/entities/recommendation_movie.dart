import 'package:equatable/equatable.dart';

class RecommendationMovie extends Equatable {
  final int id;
  final String? backdropPath;
  final String? title;

  const RecommendationMovie({
    required this.id,
    this.backdropPath,
    this.title,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        title,
      ];
}

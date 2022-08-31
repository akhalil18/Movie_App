import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String overView;
  final double voteAverage;
  final List<int> generalIds;
  final String releaseDate;

  const Movie(
      {required this.id,
      required this.title,
      required this.backdropPath,
      required this.overView,
      required this.voteAverage,
      required this.generalIds,
      required this.releaseDate});

  @override
  List<Object?> get props =>
      [id, title, backdropPath, overView, voteAverage, generalIds];
}

class AppConstants {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = '8e33aa04e4e7ffe579b11925eaef4d5f';

  static const nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const popularMoviesPath = '$baseUrl/movie/popular?api_key=$apiKey';

  static const topRatedMoviesPath = '$baseUrl/movie/top_rated?api_key=$apiKey';
}

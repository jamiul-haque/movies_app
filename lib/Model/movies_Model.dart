class Movies {
  final String imdbId;
  final String poster;
  final String title;
  final String year;

  Movies(
      {required this.imdbId,
      required this.poster,
      required this.title,
      required this.year});

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
        imdbId: json['imdbID'],
        poster: json['Poster'],
        title: json['Title'],
        year: json['Year']);
  }

  static frommJson(movie) {}
}

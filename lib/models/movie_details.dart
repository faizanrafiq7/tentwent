class MovieDetails {
  final String backdrop_path;
  final List genre_ids;
  final String id;
  final String original_title;
  final String overview;
  final String poster_path;
  final String release_date;
  final String title;

  MovieDetails({
    required this.backdrop_path,
    required this.genre_ids,
    required this.id,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.release_date,
    required this.title,
  });

  factory MovieDetails.fromDocument(Map data) {
    return MovieDetails(
      backdrop_path: data['backdrop_path'],
      genre_ids: data['genre_ids'],
      id: data['id'].toString(),
      original_title: data['original_title'],
      overview: data['overview'],
      poster_path: data['poster_path'],
      release_date: data['release_date'],
      title: data['title'],
    );
  }
}

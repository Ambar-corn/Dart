import 'package:musicplayer/src/genre.dart';

class Song {
  final int id;
  final String author;
  final String name;
  final Genre genre;
  final int duration;
  int _minutes = 0;
  int _seconds = 0;
  bool _like = false;

  Song(
      {required this.id,
      required this.author,
      required this.name,
      required this.genre,
      required this.duration}) {
    _normalizeDuration();
  }
  factory Song.fromJson(Map<String, dynamic> json, List<Genre> genres) {
    final genreId = json['genre_id'] as int;
    final genre = genres.firstWhere(
      (element) => element.id == genreId,
      orElse: () => Genre(id: -1, title: "Unknow"),
    );
    return Song(
        id: json['id'],
        author: json['author'],
        name: json['name'],
        genre: genre,
        duration: json['duration']);
  }

  void _normalizeDuration() {
    _seconds = duration;
    if (duration > 60) {
      // seconds = duration;
      _minutes += _seconds ~/ 60;
      _seconds = _seconds % 60;
    }
  }

  void likeIt() {
    _like = true;
  }

  void unLikeIt() {
    _like = false;
  }

  bool get isLiked => _like;

  @override
  String toString() {
    return 'Song {id: $id, author: $author name: $name genre: ${genre.title} duration: $_minutes:${_seconds < 10 ? '0$_seconds' : _seconds} ${isLiked == true ? 'Лайкнутое' : 'Нелайкнутое'}\n';
  }
}

// Разработать ООП-макет музыкального плеера.
// Возможности: искать аудио, добавлять в свой плейлист, ставить "лайк", получать жанр, возвращать по жанру, отображать длительность

class Song {
  String name;
  String author;
  String genre; //жанр
  int minutes;
  int seconds;
  bool _like = false;
  Song(
      {required this.name,
      required this.author,
      required this.genre,
      required this.minutes,
      required this.seconds}) {
    _normal();
  }

  void _normal() {
    if (seconds >= 60) {
      minutes += seconds ~/ 60;
      seconds = seconds % 60;
    }
  }

  void likeIt() {
    _like = true;
  }

  void unLike() {
    _like = false;
  }

  @override
  String toString() {
    return "Название песни: $name Автор: $author Жанр: $genre Длительность:$minutes:${seconds < 10 ? '0$seconds' : seconds} ${_like == true ? 'Лайкнутое' : 'Нелайкнутое'}\n";
  }
}

class PlayList {
  List<Song> songs = [];
  // PlayList(this.songs);
  void addSong(Song song) {
    songs.add(song);
  }

  List<Song> searchSong(String name, String author) {
    return songs
        .where((song) =>
            song.name.toLowerCase() == name.toLowerCase() &&
            song.author.toLowerCase() == author.toLowerCase())
        .toList();
  }

  List<Song> searchGenre(String genre) {
    return songs
        .where((song) => song.genre.toLowerCase() == genre.toLowerCase())
        .toList();
  }

  @override
  String toString() {
    String result = '';
    for (Song song in songs) {
      result += '$song\n';
    }
    return result;
  }
}

class MusicPlayer {
  List<PlayList> playlists = [];

  void addPlayList(PlayList playlist) {
    playlists.add(playlist);
  }

  List<Song> globalSongSearch(String name, String author) {
    return playlists.expand((songs) => songs.searchSong(name, author)).toList();
  }

  List<Song> globalSearchGenre(String genre) {
    return playlists.expand((song) => song.searchGenre(genre)).toList();
  }
}

void main() {}

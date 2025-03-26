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
        .where((song) => song.name == name && song.author == author)
        .toList();
  }

  List<Song> searchGenre(String genre) {
    return songs.where((song) => song.genre == genre).toList();
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

void main() {
  // Инициализация песен
  Song song1 = Song(
      name: "Blinding Lights",
      author: "The Weeknd",
      genre: "Rock",
      minutes: 5,
      seconds: 55);
  Song song2 = Song(
      name: "Blinding Lights",
      author: "The Weeknd",
      genre: "Pop",
      minutes: 3,
      seconds: 53);
  Song song3 = Song(
      name: "Billie Jean",
      author: "Michael Jackson",
      genre: "Pop",
      minutes: 4,
      seconds: 54);
  Song song4 = Song(
      name: "Smells Like Teen Spirit",
      author: "Nirvana",
      genre: "Grunge",
      minutes: 5,
      seconds: 1);
  Song song5 = Song(
      name: "Hotel California",
      author: "Eagles",
      genre: "Rock",
      minutes: 6,
      seconds: 30);
  Song song6 = Song(
      name: "Blinding Lights",
      author: "The Weeknd",
      genre: "Synth-pop",
      minutes: 3,
      seconds: 20);
  Song song7 = Song(
      name: "Sweet Child O' Mine",
      author: "Guns N' Roses",
      genre: "Rock",
      minutes: 5,
      seconds: 56);
  Song song8 = Song(
      name: "Rolling in the Deep",
      author: "Adele",
      genre: "Soul",
      minutes: 3,
      seconds: 48);
  Song song9 = Song(
      name: "Stairway to Heaven",
      author: "Led Zeppelin",
      genre: "Rock",
      minutes: 8,
      seconds: 2);
  Song song10 = Song(
      name: "Lose Yourself",
      author: "Eminem",
      genre: "Hip-hop",
      minutes: 5,
      seconds: 20);

  // Инициализация плейлистов
  PlayList rockClassics = PlayList();
  rockClassics.addSong(song1); // Bohemian Rhapsody
  rockClassics.addSong(song5); // Hotel California
  rockClassics.addSong(song7); // Sweet Child O' Mine

  PlayList popHits = PlayList();
  popHits.addSong(song2); // Shape of You
  popHits.addSong(song3); // Billie Jean
  popHits.addSong(song6); // Blinding Lights

  PlayList longTracks = PlayList();
  longTracks.addSong(song9); // Stairway to Heaven
  longTracks.addSong(song5); // Hotel California

  PlayList mixedVibes = PlayList();
  mixedVibes.addSong(song4); // Smells Like Teen Spirit
  mixedVibes.addSong(song8); // Rolling in the Deep
  mixedVibes.addSong(song10); // Lose Yourself

  PlayList shortAndSweet = PlayList();
  shortAndSweet.addSong(song6); // Blinding Lights
  shortAndSweet.addSong(song8); // Rolling in the Deep
  shortAndSweet.addSong(song1);
  shortAndSweet.addSong(song2);

  // Добавляем лайк для проверки
  song1.likeIt(); // Лайкаем "Bohemian Rhapsody"
  MusicPlayer musicPlayer = MusicPlayer();
  musicPlayer.addPlayList(popHits);
  musicPlayer.addPlayList(shortAndSweet);
  musicPlayer.addPlayList(mixedVibes);

  // Вывод результатов
  // print("Плейлист 'Rock Classics':\n$rockClassics");
  // print("Плейлист 'Pop Hits':\n$popHits");
  // print("Плейлист 'Long Tracks':\n$longTracks");
  // print("Плейлист 'Mixed Vibes':\n$mixedVibes");
  // print("Плейлист 'Short and Sweet':\n$shortAndSweet");

  print(musicPlayer.globalSearchGenre("Rock"));
}

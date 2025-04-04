import 'dart:io';
import 'dart:convert';

import 'package:musicplayer/src/genre.dart';
import 'package:musicplayer/src/song.dart';

class MusicPlayer {
  List<Song> _playList = [];
  late List<Genre> genres;
  late List<Song> songs;

  MusicPlayer._(this.genres, this.songs);

  factory MusicPlayer.fromFiles(String genreFilePath, String songFilePath) {
    try {
      final genreFile = File(genreFilePath);
      final List<dynamic> genreJson = jsonDecode(genreFile.readAsStringSync());
      List<Genre> genres = genreJson.map((e) => Genre.fromJson(e)).toList();

      final songFile = File(songFilePath);
      final List<dynamic> songJson = jsonDecode(songFile.readAsStringSync());
      List<Song> songs = songJson.map((e) => Song.fromJson(e, genres)).toList();

      return MusicPlayer._(genres, songs);
    } catch (e) {
      print("Ошибка загрузки данных $e ");
      return MusicPlayer._([], []);
    }
  }

  List<Song> get getSongs => songs;

  List<Song> searchSong(String name, String author) {
    return songs
        .where((song) =>
            song.name.toLowerCase() == name.toLowerCase() &&
            song.author.toLowerCase() == author.toLowerCase())
        .toList();
  }

  void addPlaylist(int identifier) {
    try {
      Song match = songs.firstWhere((song) => song.id == identifier);
      _playList.add(match);
      print('$match успешно добавлена в плейлист');
    } catch (e) {
      print('Песня с id: $identifier не найдена');
    }
  }

  void like(int identifier) {
    try {
      songs.firstWhere((song) => song.id == identifier).likeIt();
      print('Песня лайкнута');
    } catch (e) {
      print('Песня с id: $identifier не найдена');
    }
  }

  void unLike(int identifier) {
    try {
      songs.firstWhere((song) => song.id == identifier).unLikeIt();
      print('Теперь пенся не лайкнута');
    } catch (e) {
      print('Песня с id: $identifier не найдена. Ошибка $e');
    }
  }

  List<Song> searchGenre(String genre) {
    return songs
        .where((song) => song.genre.title.toLowerCase() == genre.toLowerCase())
        .toList();
  }

  List<Song> get getPlayList => _playList;

  void removeSong(int identifier) {
    try {
      Song match = _playList.firstWhere((song) => song.id == identifier);
      _playList.remove(match);
      print("Песня $match успешно удалена из плейлиста ");
    } catch (e) {
      print("Песня c id: $identifier не найден. Ошибка $e");
    }
  }

  Song searchSongId(int identifier) {
    try {
      Song match = songs.firstWhere((song) => song.id == identifier);
      print('Песня с id: $identifier успешно найдена');
      return match;
    } catch (e) {
      print('Песня не найдена. Ошибка $e');
      return Song(
          id: -1,
          author: "No",
          name: "No",
          genre: Genre(id: -1, title: "No"),
          duration: 0);
    }
  }
}

void main() {
  MusicPlayer player = MusicPlayer.fromFiles('bin/genre.json', 'bin/song.json');
  print(player.getSongs);
  print(player.searchSongId(4));
}

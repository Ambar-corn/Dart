class Song {
  final String name;
  Song(this.name);
}

class Playlist {
  List<Song> songs = [];
  void add(Song item) {
    // for(i in item)
    // {
    //   if()
    // }
    songs.add(item);
  }

  String show() {
    List<String> buffer = [];
    songs.forEach((song) {
      buffer.add(song.name);
    });
    return buffer.join("\n");
    // for (string item in songs)
    // {
    //   return item;
    // }
  }
}

void main() {
  Song s1 = Song("a");
  Song s2 = Song("b");
  Playlist p = Playlist();
  p.add(s1);
  print(p.show());
  print("--------------------\n");
  p.add(s2);
  print(p.show());
}

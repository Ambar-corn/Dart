class Genre {
  final int id;
  final String title;

  Genre({required this.id, required this.title});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(id: json['id'], title: json['title']);
  }

  @override
  String toString() {
    return 'Genre{id: $id, title: $title}';
  }
}

class Rate {
  int id;
  double rating;
  String username;
  String image;
  String content;

  Rate(this.id, this.rating, this.username, this.image, this.content);

  Rate.fromJson(Map<String, dynamic> map)
      : id = map[0],
        rating = map[1],
        username = map[2],
        image = map[3],
        content = map[4];
}

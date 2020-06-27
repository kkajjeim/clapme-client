class Goal {
  int id;
  String title;
  String description;
  String image;
  String interval;
  int times;

  Goal(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.interval,
      this.times});

  factory Goal.fromJson(dynamic json) {
    return Goal(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        interval: json['interval'],
        times: json['times']);
  }

  // TO DO: interval converting method 추가하기
}

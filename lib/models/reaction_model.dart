class Reaction {
  int id;
  int userId;
  String userName;
  String type;

  Reaction({this.id, this.userId, this.userName, this.type});

  factory Reaction.fromJson(dynamic json) {
    return Reaction(
        id: json['id'],
        userId: json['user_id'],
        userName: json['user_name'],
        type: json['type']);
  }
}

String getImageUrlByType(String type) {
  switch (type) {
    case 'fire':
      return 'assets/reaction_fire.png';
    case 'clap':
      return 'assets/reaction_clap.png';
    case 'heart':
      return 'assets/reaction_heart.png';
    case 'smile':
      return 'assets/reaction_smile.png';
  }
}

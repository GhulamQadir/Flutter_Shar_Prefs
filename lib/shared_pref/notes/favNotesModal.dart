class UserFavorites {
  String title;
  String description;

  UserFavorites({required this.title, required this.description});

  Map<String, dynamic> toJson() {
    return {"title": title, "description": description};
  }
}

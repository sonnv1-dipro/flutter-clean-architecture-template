abstract class Post {
  int userId;
  int id;
  String title;
  bool completed;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
}

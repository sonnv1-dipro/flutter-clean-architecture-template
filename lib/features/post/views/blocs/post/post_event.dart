abstract class PostEvent {}

class FetchedPostEvent extends PostEvent {
  final int id;
  FetchedPostEvent({required this.id});
}

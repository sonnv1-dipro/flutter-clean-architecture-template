abstract class ListPostEvent {}

class FetchedListPostEvent extends ListPostEvent {
  final int limit;
  final bool isRefresh;
  FetchedListPostEvent({this.limit = 10, this.isRefresh = false});
}

extension XList<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool isContainInList(List<T> list) {
    if (this == null || this!.isEmpty) return false;
    for (var item in this!) {
      if (list.contains(item)) return true;
    }
    return false;
  }
}

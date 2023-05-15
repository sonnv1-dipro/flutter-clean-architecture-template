enum HandleStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == HandleStatus.initial;

  bool get isLoading => this == HandleStatus.loading;

  bool get isSuccess => this == HandleStatus.success;

  bool get isError => this == HandleStatus.error;
}

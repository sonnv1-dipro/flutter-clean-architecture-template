class ResStrings {
  ResStrings._privateConstructor();

  static final ResStrings _instance = ResStrings._privateConstructor();

  static ResStrings get instance => _instance;

  factory ResStrings() {
    return _instance;
  }

  String get appTitle => "App Title";
}

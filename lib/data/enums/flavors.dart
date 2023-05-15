enum Flavor {
  dev,
  qa,
  staging,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Base DEV';
      case Flavor.qa:
        return 'Base QA';
      case Flavor.staging:
        return 'Dipro';
      default:
        return 'title';
    }
  }

}

enum Flavor {
  dev,
  sandbox,
  staging,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Base DEV';
      case Flavor.sandbox:
        return 'Base Sandbox';
      case Flavor.staging:
        return 'Base Staging';
      case Flavor.prod:
        return 'Dipro';
      default:
        return 'title';
    }
  }
}

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
  unknown,
  initial;

  static AuthenticationStatus fromString(String status) {
    switch (status) {
      case 'authenticated':
        return AuthenticationStatus.authenticated;
      case 'unauthenticated':
        return AuthenticationStatus.unauthenticated;
      case 'initial':
        return AuthenticationStatus.initial;
      default:
        return AuthenticationStatus.unknown;
    }
  }

  bool get isauthentication => this == AuthenticationStatus.authenticated;

  bool get isUnauthentication => this == AuthenticationStatus.unauthenticated;

  bool get isUnknown => this == AuthenticationStatus.unknown;

  bool get isInitial => this == AuthenticationStatus.initial;
}

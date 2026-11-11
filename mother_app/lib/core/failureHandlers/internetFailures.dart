sealed class InternetFailure {
  final String message;

  InternetFailure(this.message);
}

class NoInternetFailure extends InternetFailure {
  NoInternetFailure()
    : super("No internet connection. Please check your data or Wi-Fi settings");

  // @override
  // String toString() =>
  //     "No internet connection. Please check your data or Wi-Fi settings: $message";
}

class SecureUrlFailure extends InternetFailure {
  SecureUrlFailure() : super("Only secure HTTPS links are allowed");

  // @override
  // String toString() => 'Only secure HTTPS links are allowed: $message';
}

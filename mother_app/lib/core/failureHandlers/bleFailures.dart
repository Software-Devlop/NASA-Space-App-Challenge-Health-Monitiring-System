sealed class BLEFailure {
  final String message;

  BLEFailure(this.message);
}

class BLEMessageQuery extends BLEFailure {
  BLEMessageQuery({required String message}) : super(message);

  @override
  String toString() => 'BLEMessageQuery: $message';
}

class BLEReceivingError extends BLEFailure {
  BLEReceivingError({required String message}) : super(message);

  @override
  String toString() => 'BLEReceivingError: $message';
}

class BLENotAvailable extends BLEFailure {
  BLENotAvailable(String message) : super("BLE device is not connected");
}

class BLESecurityFailure extends BLEFailure {
  BLESecurityFailure({required String message}) : super(message);

  @override
  String toString() => 'BLESecurityFailure: $message';
}

class BLESendingError extends BLEFailure {
  BLESendingError({required String message}) : super(message);

  @override
  String toString() => 'BLESendingError: $message';
}

class BLEScanningFailure extends BLEFailure {
  BLEScanningFailure() : super("Scanning Failed");
}

class BluetoothPowerException implements Exception {
  final String message;
  BluetoothPowerException(this.message);

  @override
  String toString() => 'BluetoothPowerException: $message';
}

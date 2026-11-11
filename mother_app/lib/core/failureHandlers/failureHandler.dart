sealed class Failure {
  final String message;
  const Failure(this.message);
}

// 1. Network / Remote Failure
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection.']);

  @override
  String toString() => 'NetworkFailure: $message';
}

// 2. Server Failure (e.g. 404, 500, or Iconify API issues)
class ServerFailure extends Failure {
  const ServerFailure({required String message}) : super(message);

  @override
  String toString() => 'ServerFailure: $message';
}

// 3. Local Cache / Disk Storage Failure
class CacheFailure extends Failure {
  const CacheFailure([super.message = 'No cached icon found locally.']);

  @override
  String toString() => 'CacheFailure: $message';
}

// 4. Unknown / Generic Fallback Failure
class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'An unexpected error occurred.']);

  @override
  String toString() => 'UnexpectedFailure: $message';
}

// 4. Unknown / Generic Fallback Failure
class PlantIconFetchingFailure extends Failure {
  const PlantIconFetchingFailure([
    super.message = 'An unexpected error occurred.',
  ]);

  @override
  String toString() => 'UnexpectedFailure: $message';
}

class PlantIconDownloadFailure extends Failure {
  const PlantIconDownloadFailure({required String message}) : super(message);

  @override
  String toString() => message;
}

// 1. Generic Database/Disk Failures (Covers Add, Update, Delete, Load)
class DatabaseFailure extends Failure {
  const DatabaseFailure([super.message = 'A database error occurred.']);

  @override
  String toString() => 'DatabaseFailure: $message';
}

// 2. Network / Download Failures
class DownloadFailure extends Failure {
  const DownloadFailure([super.message = 'Failed to download asset.']);

  @override
  String toString() => 'DownloadFailure: $message';
}

// 3. Validation / User Input Errors
class InvalidInputFailure extends Failure {
  const InvalidInputFailure([super.message = 'Invalid input provided.']);

  @override
  String toString() => 'InvalidInputFailure: $message';
}

// 4. Catch-all / Unknown Errors
class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unexpected error occurred.']);

  @override
  String toString() => 'UnknownFailure: $message';
}

class AudioRecordingFailure extends Failure {
  const AudioRecordingFailure(super.message);
}

class TranscriptionFailure extends Failure {
  const TranscriptionFailure(super.message);
}

class AiModelFailure extends Failure {
  const AiModelFailure([super.message = "Can't receive model answer"]);

  @override
  String toString() => 'InvalidInputFailure: $message';
}

class StorageFailure extends Failure {
  const StorageFailure(super.message);
}

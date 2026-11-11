import 'package:dartz/dartz.dart';
import 'package:mother_app/core/failureHandlers/exception.dart';
import 'package:mother_app/features/llm/domain/entities/chat.dart';

abstract class llmRepository {
  Future<Either<ServerException, ChatMessage>> sendMessage(String message);
}

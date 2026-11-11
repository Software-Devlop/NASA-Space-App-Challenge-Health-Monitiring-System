import 'package:dartz/dartz.dart';
import 'package:mother_app/core/failureHandlers/exception.dart';
import 'package:mother_app/features/llm/domain/abstractRepos/aiRepo.dart';
import 'package:mother_app/features/llm/domain/entities/chat.dart';

class SendLlmMessageUC {
  final llmRepository repository;

  SendLlmMessageUC(this.repository);

  Future<Either<ServerException, ChatMessage>> execute(String message) {
    return repository.sendMessage(message);
  }
}

// import 'package:dartz/dartz.dart';
// import 'package:mother_app/core/failureHandlers/exception.dart';
// import 'package:mother_app/features/llm/domain/entities/chat.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class SendAIMessageUC {
//   SendAIMessageUC();

//   Future<Either<ServerException, ChatMessage>> execute(String message) async {
//     // 1. Define your endpoint URL
//     final url = Uri.parse('http://127.0.0.1:8000/chat');

//     // 2. Prepare the data you want to send
//     final Map<String, String> requestBody = {'message': message};

//     try {
//       // 3. Send the POST request with headers and encoded body
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json; charset=UTF-8'},
//         body: jsonEncode(requestBody),
//       );

//       // 4. Handle the response
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         // Request successful
//         final responseData = jsonDecode(response.body);
//         // print('Success: $responseData');
//         return right(
//           ChatMessage(
//             message: responseData["message"],
//             dateTime: DateTime.now(),
//           ),
//         );
//       } else {
//         // Server returned an error status code
//         print('Failed with status: ${response.statusCode}');
//         print('Error response: ${response.body}');
//         return left(ServerException("Error response: ${response.body}"));
//       }
//     } catch (e) {
//       // Handle network errors or exceptions
//       print('Error occurred: $e');
//       return left(ServerException("Error $e"));
//     }
//   }
// }

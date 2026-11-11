// import 'dart:convert';
// import 'package:dartz/dartz.dart';
// import 'package:mother_app/core/failureHandlers/exception.dart';
// import 'package:http/http.dart' as http;

// class AnalyzeDataUC {
//   AnalyzeDataUC();

//   Future<Either<ServerException, String>> execute(
//     Map<String, dynamic> message,
//   ) async {
//     final url = Uri.parse('http://127.0.0.1:8000/analyze');

//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json; charset=UTF-8'},
//         body: jsonEncode(message),
//       );

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final dynamic responseData = jsonDecode(response.body);

//         if (responseData is Map<String, dynamic>) {
//           final explanation = responseData['explanation'];

//           if (explanation is String) {
//             return right(explanation);
//           }

//           return left(
//             ServerException('Missing or invalid explanation in response.'),
//           );
//         }

//         return left(ServerException('Unexpected response format from server.'));
//       }

//       print('Failed with status: ${response.statusCode}');
//       print('Error response: ${response.body}');

//       return left(
//         ServerException('HTTP ${response.statusCode}: ${response.body}'),
//       );
//     } catch (e) {
//       print('Error occurred: $e');
//       return left(ServerException('Request failed: $e'));
//     }//   }
// }

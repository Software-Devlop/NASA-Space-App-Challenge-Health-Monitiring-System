// import 'dart:io';

// Process? pythonProcess;

// Future<void> startPythonBackend() async {
//   // Skip embedded Python on Android and iOS.
//   if (!Platform.isWindows && !Platform.isLinux) return;

//   if (pythonProcess != null) return;

//   final backendDirectory = '${Directory.current.path}\\assets\\backend';

//   final exePath = '$backendDirectory\\mother_appBackend.exe';

//   final exeFile = File(exePath);

//   if (!await exeFile.exists()) {
//     throw Exception('Backend executable not found: $exePath');
//   }

//   try {
//     final process = await Process.start(
//       exePath,
//       [],
//       workingDirectory: backendDirectory,
//       environment: {
//         'FLUTTER_PARENT_PID': pid.toString(),
//         'PYTHONIOENCODING': 'utf-8',
//       },
//       includeParentEnvironment: true,
//       runInShell: false,
//     );

//     pythonProcess = process;

//     print('mother_app Backend process launched. PID: ${process.pid}');

//     process.stdout.transform(const SystemEncoding().decoder).listen((data) {
//       print('Backend: $data');
//     });

//     process.stderr.transform(const SystemEncoding().decoder).listen((data) {
//       print('Backend error: $data');
//     });

//     process.exitCode.then((code) {
//       print('Backend exited with code: $code');

//       if (identical(pythonProcess, process)) {
//         pythonProcess = null;
//       }
//     });
//   } catch (e) {
//     pythonProcess = null;
//     print('Failed to start mother_app Backend: $e');
//     rethrow;
//   }
// }

// Future<void> stopPythonBackend() async {
//   final process = pythonProcess;
//   pythonProcess = null;

//   if (process != null) {
//     process.kill();
//     await process.exitCode;

//     print('mother_app Backend stopped.');
//   }
// }

// // import 'dart:io';

// // Process? pythonProcess;

// // Future<void> startPythonBackend() async {
// //   if (pythonProcess != null) return;

// //   final backendDirectory = '${Directory.current.path}\\assets\\backend';

// //   final exePath = '$backendDirectory\\mother_appBackend.exe';

// //   // print('Flutter working directory: ${Directory.current.path}');
// //   // print('Backend directory: $backendDirectory');
// //   // print('Backend executable path: $exePath');

// //   final exeFile = File(exePath);

// //   if (!await exeFile.exists()) {
// //     throw Exception('Backend executable not found: $exePath');
// //   }

// //   try {
// //     final process = await Process.start(
// //       exePath,
// //       [],
// //       workingDirectory: backendDirectory,
// //       environment: {
// //         'FLUTTER_PARENT_PID': pid.toString(),
// //         'PYTHONIOENCODING': 'utf-8',
// //       },
// //       includeParentEnvironment: true,
// //       runInShell: false,
// //     );

// //     pythonProcess = process;

// //     print('mother_app Backend process launched. PID: ${process.pid}');

// //     process.stdout.transform(const SystemEncoding().decoder).listen((data) {
// //       print('Backend: $data');
// //     });

// //     process.stderr.transform(const SystemEncoding().decoder).listen((data) {
// //       print('Backend error: $data');
// //     });

// //     process.exitCode.then((code) {
// //       print('Backend exited with code: $code');

// //       if (identical(pythonProcess, process)) {
// //         pythonProcess = null;
// //       }
// //     });
// //   } catch (e) {
// //     pythonProcess = null;
// //     print('Failed to start mother_app Backend: $e');
// //     rethrow;
// //   }
// // }

// // Future<void> stopPythonBackend() async {
// //   final process = pythonProcess;
// //   pythonProcess = null;

// //   if (process != null) {
// //     process.kill();
// //     await process.exitCode;

// //     print('mother_app Backend stopped.');
// //   }
// // }

// // For coding

// // import 'dart:io';

// // Process? pythonProcess;

// // Future<void> startPythonBackend() async {
// //   if (pythonProcess != null) return;

// //   pythonProcess = await Process.start(
// //     r'C:\Users\Lenovo\Desktop\Latest AI research - using ollama in python\env\Scripts\python.exe',
// //     [
// //       '-X',
// //       'utf8',
// //       '-m',
// //       'uvicorn',
// //       'main:app',
// //       '--host',
// //       '127.0.0.1',
// //       '--port',
// //       '8000',
// //     ],
// //     workingDirectory:
// //         r'C:\Users\Lenovo\Desktop\Latest AI research - using ollama in python\backend',
// //     environment: {'FLUTTER_PARENT_PID': pid.toString()},
// //     includeParentEnvironment: true,
// //     runInShell: false,
// //   );

// //   final process = pythonProcess!;

// //   process.stdout
// //       .transform(const SystemEncoding().decoder)
// //       .listen((data) => print('Python: $data'));

// //   process.stderr
// //       .transform(const SystemEncoding().decoder)
// //       .listen((data) => print('Python error: $data'));

// //   process.exitCode.then((_) {
// //     if (identical(pythonProcess, process)) {
// //       pythonProcess = null;
// //     }
// //   });
// // }

// // Future<void> stopPythonBackend() async {
// //   final process = pythonProcess;
// //   pythonProcess = null;

// //   if (process != null) {
// //     process.kill(ProcessSignal.sigterm);
// //     await process.exitCode;
// //   }
// // }

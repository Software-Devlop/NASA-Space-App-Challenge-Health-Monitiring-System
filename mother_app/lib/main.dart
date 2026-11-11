import 'package:mother_app/core/statics/AppConstants.dart';
import 'package:mother_app/core/theme/AppTheme.dart';
import 'package:mother_app/features/llm/presentation/controllers/llmController.dart';
import 'package:mother_app/features/main/presentation/pages/base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  try {
    await container.read(aiInitializationProvider.future);
  } catch (e) {
    debugPrint('AI initialization failed: $e');
  }

  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const BaseScreen(),
    );
  }
}

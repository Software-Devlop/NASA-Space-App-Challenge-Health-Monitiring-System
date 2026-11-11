import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:llamadart/llamadart.dart';

abstract class llmLocalDataSource {
  Future<void> initialize();
  Future<String> sendMessage(String message);
  Future<void> dispose();
}

class AILocalDataSourceImpl implements llmLocalDataSource {
  final String windowsModelPath;
  final String linuxModelPath;

  LlamaEngine? _engine;

  AILocalDataSourceImpl({
    required this.windowsModelPath,
    required this.linuxModelPath,
  });

  Future<String> _getModelPath() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      final appDir = await getApplicationSupportDirectory();

      final modelFile = File('${appDir.path}/qwen3-4b-q4_k_m.gguf');

      // Reuse the previously copied model.
      if (await modelFile.exists()) {
        return modelFile.path;
      }

      // Ask the user to select the model.
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['gguf'],
      );

      if (result.isEmpty) {
        throw Exception('No GGUF model selected.');
      }

      final selectedPath = result.first.path;

      if (selectedPath == null) {
        throw Exception('Could not access the selected model.');
      }

      // Copy the selected model into app storage.
      await File(selectedPath).copy(modelFile.path);

      return modelFile.path;
    }

    if (defaultTargetPlatform == TargetPlatform.windows) {
      return windowsModelPath;
    }

    if (defaultTargetPlatform == TargetPlatform.linux) {
      return linuxModelPath;
    }

    throw UnsupportedError('Unsupported platform.');
  }

  @override
  Future<void> initialize() async {
    if (_engine != null) return;

    final modelPath = await _getModelPath();

    if (!await File(modelPath).exists()) {
      throw Exception('Model file not found: $modelPath');
    }

    _engine = await LlamaEngine.load(
      LlamaModel(ModelSource.path(modelPath)),
      params: const ModelParams(contextSize: 2048, gpuLayers: 0),
    );
  }

  @override
  Future<String> sendMessage(String message) async {
    if (_engine == null) {
      throw StateError('AI model is not initialized. Call initialize() first.');
    }

    return await _engine!.create(
      [
        LlamaChatMessage.fromText(
          role: LlamaChatRole.user,
          text: "/no_think\n$message",
        ),
      ],
      params: const GenerationParams(
        maxTokens: 250,
        temp: 0.3,
        topP: 0.9,
        topK: 40,
      ),
    ).text();
  }

  @override
  Future<void> dispose() async {
    await _engine?.dispose();
    _engine = null;
  }
}

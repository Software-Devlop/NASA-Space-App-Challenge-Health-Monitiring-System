import 'package:mother_app/core/statics/extensions.dart';
import 'package:mother_app/features/llm/data/datasources/localDataSource.dart';
import 'package:mother_app/features/llm/data/repositories/aiRepo.dart';
import 'package:mother_app/features/llm/domain/abstractRepos/aiRepo.dart';
import 'package:mother_app/features/llm/domain/entities/chat.dart';
import 'package:mother_app/features/llm/domain/usecases/sendAIMessageUC.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LlmController {
  final bool aiLoading;
  final String? aiError;
  final List<Chat> chats;
  final int currentChat;
  const LlmController({
    this.aiError,
    this.aiLoading = false,
    this.chats = const [],
    this.currentChat = 0,
  });

  LlmController copyWith({
    bool? aiLoading,
    List<Chat>? chats,
    String? Function()? aiError,
    int? currentChat,
  }) {
    return LlmController(
      aiLoading: aiLoading ?? this.aiLoading,
      aiError: aiError != null ? aiError() : this.aiError,
      chats: chats ?? this.chats,
      currentChat: currentChat ?? this.currentChat,
    );
  }
}

class LlmControllerManager extends Notifier<LlmController> {
  @override
  LlmController build() {
    // 5. Mandatory build method required by Riverpod Notifier
    return const LlmController();
  }

  set currentChat(int newChatIndex) {
    state = state.copyWith(currentChat: newChatIndex);
  }

  Future<void> sendMessage(String text, {bool isAutoUpdatePage = true}) async {
    print("I have received order form UI (Control Manager)");

    final newChat = Chat(
      userMessage: ChatMessage(message: text, dateTime: DateTime.now()),
    );

    final updatedChats = [...state.chats, newChat];
    final newIndex = updatedChats.length - 1; // 0-based index

    // 1. Update state atomically
    state = state.copyWith(
      aiLoading: true,
      aiError: () => null,
      chats: updatedChats,
      currentChat: isAutoUpdatePage ? newIndex : state.currentChat,
    );

    final result = await ref.read(llmSenderUCProvider).execute(text);

    // Create a mutable copy of the current list for updating the response
    final currentChatsList = [...state.chats];

    if (result.isLeft()) {
      state = state.copyWith(
        aiLoading: false,
        aiError: () => result.getLeft().message,
      );
    } else {
      final updatedChatWithResponse = newChat.addResponse(
        ChatMessage(
          message: result.getRight().message,
          dateTime: result.getRight().dateTime,
        ),
      );

      if (newIndex < currentChatsList.length) {
        currentChatsList[newIndex] = updatedChatWithResponse;
      }

      state = state.copyWith(
        aiLoading: false,
        aiError: () => null,
        chats: currentChatsList,
      );
    }
  }
}

// 6. Don't forget to expose your Notifier via a Provider:
final LlmControllerProvider =
    NotifierProvider<LlmControllerManager, LlmController>(
      LlmControllerManager.new,
    );

// Local data source
final llmLocalDataSourceProvider = Provider<llmLocalDataSource>(
  (ref) => AILocalDataSourceImpl(
    linuxModelPath: "/home/user/Models/Qwen3-4B-Q4_K_M.gguf",
    windowsModelPath: r'C:\Users\Lenovo\Desktop\Qwen3-4B-Q4_K_M.gguf',
  ),
  isAutoDispose: true,
);

// Repository: Select implementation according to platform
// Repository
final llmRepositoryProvider = Provider<llmRepository>(
  (ref) => llmRepositoryImpl(dataSource: ref.watch(llmLocalDataSourceProvider)),
);

// Use cases
final llmSenderUCProvider = Provider<SendLlmMessageUC>(
  (ref) => SendLlmMessageUC(ref.watch(llmRepositoryProvider)),
  isAutoDispose: true,
);

final aiInitializationProvider = FutureProvider<void>((ref) async {
  final dataSource = ref.watch(llmLocalDataSourceProvider);

  await dataSource.initialize();

  ref.onDispose(() {
    dataSource.dispose();
  });
});

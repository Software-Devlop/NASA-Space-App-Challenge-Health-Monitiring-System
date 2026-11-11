class ChatMessage {
  final String message;
  final DateTime dateTime;

  ChatMessage({required this.message, required this.dateTime});
}

class Chat {
  ChatMessage userMessage;
  ChatMessage? aiMessage;

  Chat({required this.userMessage, this.aiMessage});

  /// Since Clean Architecture entities are immutable,
  /// this method returns a new Chat instance with the AI response added.
  Chat addResponse(ChatMessage response) {
    return Chat(userMessage: userMessage, aiMessage: response);
  }

  /// Optional: Standard copyWith utility for state management ease
  Chat copyWith({ChatMessage? userMessage, ChatMessage? aiMessage}) {
    return Chat(
      userMessage: userMessage ?? this.userMessage,
      aiMessage: aiMessage ?? this.aiMessage,
    );
  }
}

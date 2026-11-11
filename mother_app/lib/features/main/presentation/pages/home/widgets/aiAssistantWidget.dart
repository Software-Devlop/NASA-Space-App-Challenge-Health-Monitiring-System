import 'package:mother_app/core/presentation/globalWidgets/custDivider.dart';
import 'package:mother_app/core/presentation/globalWidgets/custIconButton.dart';
import 'package:mother_app/core/presentation/globalWidgets/horizontalPageSlider.dart';
import 'package:mother_app/core/statics/AppConstants.dart';
import 'package:mother_app/core/statics/extensions.dart';
import 'package:mother_app/core/utils/copyHelper.dart';
import 'package:mother_app/features/llm/presentation/controllers/llmController.dart';
import 'package:mother_app/features/llm/domain/entities/chat.dart';
import 'package:mother_app/features/llm/presentation/widgets/chatBoxWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AIAssistantWidget extends ConsumerStatefulWidget {
  final List<Chat> chatWatch;
  final int currentChatPage;
  final List<String> suggestions;
  const AIAssistantWidget({
    super.key,
    required this.chatWatch,
    required this.currentChatPage,
    required this.suggestions,
  });

  @override
  ConsumerState<AIAssistantWidget> createState() => _AIAssistantWidgetState();
}

class _AIAssistantWidgetState extends ConsumerState<AIAssistantWidget> {
  final TextEditingController userMessageController = TextEditingController();
  final TextEditingController controller = TextEditingController();

  bool _isCopied = false;
  bool _showCopyButton = false;

  Future<void> _handleCopy(Chat fullChat) async {
    if (_isCopied) return;

    final text =
        "You: ${fullChat.userMessage.message}\n\n$appName AI: ${fullChat.aiMessage?.message ?? "(Still thinking...)"}";

    // Call the core helper
    await ClipboardHelper.copy(text);
    // 2. Update state to show checkmark
    setState(() {
      _isCopied = true;
    });

    // Presentation layer handles the UI notification feedback
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Copied to clipboard!")));
    }

    // 3. Revert back to copy icon after 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _isCopied = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final fullChat = widget.chatWatch.isNotEmpty
        ? widget.chatWatch[widget.currentChatPage]
        : null;
    userMessageController.text = widget.chatWatch.isNotEmpty
        ? widget.chatWatch[widget.currentChatPage].userMessage.message
        : "";
    return HorizontalPageSlider(
      height: 503,
      maxNbOfPage: ref.watch(LlmControllerProvider).chats.length,
      currentPage: ref.watch(LlmControllerProvider).currentChat,
      onPageChange: (value) {
        setState(() {
          ref.read(LlmControllerProvider.notifier).currentChat = value;
          print(value);
        });
      },
      pagesPlaceholder: Expanded(child: Center(child: Text("Ask me anything"))),

      onEnterTop: (event) {
        setState(() {
          _showCopyButton = true;
        });
      },

      onExitTop: (event) {
        setState(() {
          _showCopyButton = false;
        });
      },

      // Copy button
      topWidget: Row(
        spacing: 5,
        children: [
          Row(
            spacing: 15,
            children: [
              SvgPicture.asset("assets/icons/leaf.svg"),
              Text(
                "Mother_App Assistant",
                style: context.text.titleMedium!.copyWith(
                  // color: context.colors.primary,
                ),
              ),
            ],
          ),
          IgnorePointer(
            ignoring: !(_showCopyButton && widget.chatWatch.isNotEmpty),
            child: AnimatedOpacity(
              opacity: (_showCopyButton && widget.chatWatch.isNotEmpty)
                  ? 1.0
                  : 0.0,
              duration: const Duration(milliseconds: 150),
              child: CustIconButton(
                padding: const EdgeInsets.all(0),
                onPressed: fullChat != null
                    ? () => _handleCopy(fullChat)
                    : null,
                child: Icon(
                  _isCopied ? Icons.check_rounded : Icons.copy_rounded,
                  size: 20,
                  color: context.colors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
      pages: widget.chatWatch
          .map(
            (e) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User sent text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("You: ", style: context.text.bodyMedium),
                        Flexible(
                          child: TextField(
                            controller: userMessageController,
                            style: context.text.bodyMedium,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelStyle: context.text.bodyMedium,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              // isDense: true,
                              isCollapsed: true,
                            ),
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),

                    CustDivider(axis: CustDividerAxis.horizontal),

                    // AI response
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SelectionArea(
                        child: MarkdownBody(
                          data:
                              e.aiMessage?.message ??
                              ref.watch(LlmControllerProvider).aiError ??
                              "Sending...",
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          )
          .toList(),

      fixedWidget: Padding(
        padding: const EdgeInsets.only(right: 17),
        child: ChatBoxWidget(
          suggestions: widget.suggestions,
          controller: controller,
          onSend: (value) async {
            print("UI is sending");
            controller.clear();
            await ref
                .read(LlmControllerProvider.notifier)
                .sendMessage(value); // controller.text
          },
        ),
      ),
    );
  }
}

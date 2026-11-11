import 'package:mother_app/core/statics/extensions.dart';
import 'package:mother_app/features/llm/presentation/controllers/llmController.dart';
import 'package:mother_app/features/main/presentation/pages/home/widgets/aiAssistantWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();

  String randomText =
      "Lorem ispum dolor sit amet constectitur adipsicing domer saket redeki robn denov on sond! Sibd ksv oedd. Lorem ispum dolor sit amet constectitur adipsicing domer saket redeki robn denov, on sond sibd ksv oedd. Lorem ispum dolor sit amet constectitur adipsicing domer saket redeki robn denov on sond! Sibd ksv oedd.";
  int currentChatPage = 0;

  Map<String, String> info = {
    "info":
        "Lorem ispum dolor sit amet constectitur adipsicing domer saket redeki robn denov on sond! Sibd ksv oedd. Lorem ispum dolor sit amet constectitur adipsicing domer saket redeki robn denov, on sond sibd ksv oedd. Lorem ispum dolor sit amet constectitur adipsicing domer saket redeki robn denov on sond! Sibd ksv oedd.",
    "note":
        "Lorem ispum dolor sit amet constectitur adipsicing domer saket redeki robn denov on sond! Sibd ksv oedd. Lorem ispum dolor sit amet constectitur adipsicing domer saket redeki robn denov, on sond sibd ksv oedd. Lorem ispum dolor sit amet constectitur adipsicing domer saket redeki robn denov on sond! Sibd ksv oedd.",
    "alert":
        "Lorem ispum dolor sit amet constectitur adipsicing domer saket redeki robn denov on sond! Sibd ksv oedd. Lorem ispum dolor sit amet constectitur adipsicing domer saket redeki robn denov, on sond sibd ksv oedd. Lorem ispum dolor sit amet constectitur adipsicing domer saket redeki robn denov on sond! Sibd ksv oedd.",
  };

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currentChatPage = ref.watch(LlmControllerProvider).currentChat;
    final chatWatch = ref.watch(LlmControllerProvider).chats;

    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 10, bottom: 0),
      child: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        interactive: true,
        thickness: 9,
        radius: const Radius.circular(20),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 18, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greetings
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Greeting or so", style: context.text.headlineSmall),
                      Text(
                        "Here goes a subtitle, this section can be removed if not needed",
                        style: context.text.bodySmall!.copyWith(
                          color: context.colors.onSurface.withAlpha(200),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      // Left Section
                      Expanded(
                        child: Column(
                          spacing: 15,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // AI Assisstant (mother_app Assistant)
                            AIAssistantWidget(
                              chatWatch: chatWatch,
                              currentChatPage: currentChatPage,
                              suggestions: [],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

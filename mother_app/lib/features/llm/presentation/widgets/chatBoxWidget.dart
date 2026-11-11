import 'package:mother_app/core/presentation/globalWidgets/custElevatedButton.dart';
import 'package:mother_app/core/presentation/globalWidgets/custIconButton.dart';
import 'package:mother_app/core/statics/extensions.dart';
import 'package:flutter/material.dart';

class ChatBoxWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onSend; // Unified callback that accepts the text
  final List<String> suggestions;

  const ChatBoxWidget({
    super.key,
    required this.controller,
    this.hintText = "Type a message...",
    required this.onSend,
    required this.suggestions,
  });

  static const Duration _fadeDuration = Duration(milliseconds: 350);

  Widget _buildSuggestions(BuildContext context) {
    final bool hasSuggestions = suggestions.isNotEmpty;

    return AnimatedSize(
      duration: _fadeDuration,
      curve: Curves.easeOutCubic,
      alignment: Alignment.topLeft,
      child: AnimatedSwitcher(
        duration: _fadeDuration,
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        // Keep the chips aligned to the top-left while cross-fading
        layoutBuilder: (currentChild, previousChildren) {
          return Stack(
            alignment: Alignment.topLeft,
            children: [
              ...previousChildren,
              if (currentChild != null) currentChild,
            ],
          );
        },
        // Transition is a FadeTransition by default
        child: hasSuggestions
            ? Padding(
                // The key changes whenever the suggestions change -> new fade
                key: ValueKey(suggestions.join('|')),
                padding: const EdgeInsets.only(top: 3),
                child: Row(
                  spacing: 5,
                  children: suggestions
                      .map(
                        (suggestion) => CustElevatedButton(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          onPressed: () {
                            controller.text = suggestion;
                          },
                          child: Text(
                            suggestion.toSentenceCase(),
                            style: context.text.labelSmall!.copyWith(
                              color: context.colors.onPrimary,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            : const SizedBox.shrink(key: ValueKey('no-suggestions')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
      decoration: BoxDecoration(
        color: context.colors.secondary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          _buildSuggestions(context),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  minLines: 1,
                  maxLines: 3,
                  textInputAction: TextInputAction.send,
                  // 1. Keyboard submit triggers the callback directly with its text
                  onSubmitted: (text) {
                    if (text.trim().isNotEmpty) {
                      onSend(text);
                    }
                  },
                  style: context.text.bodyMedium!.copyWith(height: 1.3),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: context.text.bodyMedium!.copyWith(
                      color: context.colors.onSurface.withAlpha(150),
                    ),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              CustIconButton(
                icon: Icons.send_rounded,
                color: context.colors.onPrimary,
                bgColor: context.colors.primary,
                // 2. Send button grabs the current controller text and triggers the same callback
                onPressed: () {
                  final text = controller.text;
                  if (text.trim().isNotEmpty) {
                    onSend(text);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:mother_app/core/statics/extensions.dart';
import 'package:flutter/material.dart';

class CustTextField extends StatelessWidget {
  final String textHint;
  const CustTextField({super.key, required this.textHint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: textHint,
        filled: true,
        // 1. Set the border for when the field is idle/enabled
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 0.5,
            color: context.colors.secondary.withAlpha(150),
          ),
        ),
        // 2. Set the border for when the user clicks/focuses on the field
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width:
                1.0, // You can make it slightly thicker when focused if you like
            color: context.colors.secondary, // Or keep it the same color
          ),
        ),
        hintStyle: context.text.bodyMedium!.copyWith(
          color: context.colors.onSurface.withAlpha(190),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        isCollapsed: true,
      ),
    );
  }
}

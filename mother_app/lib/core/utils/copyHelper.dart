// lib/core/utils/clipboard_helper.dart
import 'package:flutter/services.dart';

class ClipboardHelper {
  static Future<void> copy(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }
}

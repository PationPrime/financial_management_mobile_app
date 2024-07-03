library src.app.tools.logger;

import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';

@immutable
class AppLogger {
  final String where;

  const AppLogger({
    required this.where,
  });

  void logError(
    String message, {
    String? code,
    String? lexicalScope,
    StackTrace? stackTrace,
    bool debugModeOnly = true,
  }) {
    if (!kDebugMode && debugModeOnly) {
      return;
    }

    dev.log(
      '😡 ($where)${lexicalScope is String ? "\n⚡ lexical scope: $lexicalScope" : ""}${code is String ? "\n💢 code: [$code]" : ""}\n💬 message: [$message]${stackTrace is StackTrace ? "\n\n🤯 stackTrace: $stackTrace 🥺" : ""}',
    );
  }

  void logMessage(
    String message, {
    String? lexicalScope,
    bool showWhere = true,
    bool debugModeOnly = true,
  }) {
    if (!kDebugMode && debugModeOnly) {
      return;
    }

    dev.log(
        "💬 ${showWhere ? (where) : ''}${lexicalScope is String ? " (lexical scope: $lexicalScope)" : ""}: $message");
  }

  void logArgsList(
    Map<String, dynamic> args, [
    bool debugModeOnly = true,
  ]) {
    if (!kDebugMode && debugModeOnly) {
      return;
    }

    for (int i = 0; i < args.length; i++) {
      logMessage(
        'argument [ ${args.keys.toList()[i]} ] : ${args.values.toList()[i]}',
        showWhere: false,
      );
      if (args.keys.toList()[i] == args.keys.last) {
        logMessage(
          '-----------------------------------------------------------------------\n',
          showWhere: false,
        );
      }
    }
  }
}
